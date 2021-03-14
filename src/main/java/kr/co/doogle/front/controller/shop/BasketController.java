package kr.co.doogle.front.controller.shop;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.BasketDTO;
import kr.co.doogle.dto.BasketProductProdctOptionFileDTO;
import kr.co.doogle.dto.DeliveryDTO;
import kr.co.doogle.mapper.BasketMapper;

@Controller
public class BasketController {

	@Autowired
	private BasketMapper basketMapper;
//
//	@RequestMapping("/shop/test")
//	public void test(PrintWriter out) {
//		out.print(basketMapper.getAllProduct().toString());
//	}
//	
	@RequestMapping("/shop/basket")
	public String basket(Model model,HttpSession session) {
		int mno = 1;
		//int mno= (int) session.getAttribute("mno");
		ArrayList<BasketProductProdctOptionFileDTO> list = basketMapper.getAllSellProduct(mno);
		ArrayList<BasketProductProdctOptionFileDTO> fList = basketMapper.getFrozenProduct(mno);
		ArrayList<BasketProductProdctOptionFileDTO> rList = basketMapper.getRoomProduct(mno);
		ArrayList<BasketProductProdctOptionFileDTO> cList = basketMapper.getColdProduct(mno);
		ArrayList<BasketProductProdctOptionFileDTO> dList = basketMapper.getDisableProduct(mno);
		
		DeliveryDTO ddto = basketMapper.deliveryInfo(mno);
		
		double totalPrice = 0;		//총금액
		double totalDisPrice = 0;	//할인금액
		double payment = 0;			//결제예정금액

		for (BasketProductProdctOptionFileDTO dto : list) {
			//금액계산
			if(dto.getSel_not().equals("y")) {	//판매중인 제품
				if(dto.getPono()>0) {	//옵션있을때
					totalDisPrice += dto.getOprice()*dto.getDiscount()/100*dto.getQuantity();
					totalPrice += dto.getOprice()*dto.getQuantity();
					
					switch (dto.getDis_not()) {
					case "y":	//할인상품
						payment += dto.getOprice()*dto.getQuantity()*(1-dto.getDiscount()/100);
						break;

					case "n":	//할인x
						payment += dto.getOprice()*dto.getQuantity();
						break;
					}
					
				}else {	//옵션없을때
					totalDisPrice += dto.getPprice()*dto.getDiscount()/100*dto.getQuantity();
					totalPrice += dto.getPprice()*dto.getQuantity();
					switch (dto.getDis_not()) {
					case "y":	//할인 상품
						payment += dto.getPprice()*dto.getQuantity()*(1-dto.getDiscount()/100);
						break;
					case "n":	//할인x
						payment += dto.getPprice()*dto.getQuantity();
						break;
					}
					
				}

			}
		}
				
		//판매 가능한 상품개수
		int sellableSize = fList.size()+rList.size()+cList.size();
		
		model.addAttribute("totalPrice",Math.round(totalPrice));
		model.addAttribute("totalDisPrice",Math.round(totalDisPrice));
		model.addAttribute("payment",Math.round(payment));
		model.addAttribute("fList",fList);
		model.addAttribute("rList",rList);
		model.addAttribute("cList",cList);
		model.addAttribute("dList",dList);
		model.addAttribute("sellableSize",sellableSize);
		model.addAttribute("ddto",ddto);
		model.addAttribute("url","/shop/basket");
		
		return "/front/shop/basket/basket";
	}
	
	//장바구니넣기
	@RequestMapping("front/shop/basket/addBasket")
	public void addBasket(HttpSession session,HttpServletRequest request,BasketDTO bdto) {
		int mno = 1;
		//int mno = (int)session.getAttribute("mno");
		int count = basketMapper.dupChkBasket(bdto);
		if(count>0) {
			int quantity = basketMapper.cntQuantity(bdto)+bdto.getQuantity();
			//basketMapper.updateQuantity(quantity,bdto.getMno(),bdto.getBno());
		}else {
			basketMapper.addBasket(bdto);
		}
	}
	
	//수량 변경
	@RequestMapping("front/shop/basket/chgQuantity")
	public void chgQuantity(HttpSession session,HttpServletRequest request) {
		int mno=1;
		//int mno = (int)session.getAttribute("mno");
		int bno = Integer.parseInt(request.getParameter("bno"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		basketMapper.updateQuantity(quantity,mno,bno);
	}
	
	//상품 한개 삭제
	@RequestMapping("/shop/deleteBasket")
	@Transactional(timeout = 10)
	public String deleteBasket(HttpServletRequest request) {
		int mno = 1;
		int bno = Integer.parseInt(request.getParameter("bno"));

		basketMapper.deleteBasket(mno,bno);
		return "redirect:/shop/basket";
	}
	
	//선택된 상품 삭제
	@RequestMapping("/shop/delChkBasket")
	@Transactional(timeout = 10)
	public String delChkBasket(HttpServletRequest request) {
		int mno = 1;
		String[] bnos = request.getParameterValues("bnoArr");
		for(int i=0 ; i<bnos.length ; i++) {
			int bno = Integer.parseInt(bnos[i]);
			basketMapper.deleteBasket(mno,bno);
		}
		return "redirect:/shop/basket";
	}
	
	
	
}