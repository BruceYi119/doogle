package kr.co.doogle.front.controller.shop;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.BasketDTO;
import kr.co.doogle.dto.BasketDeliveryDTO;
import kr.co.doogle.dto.BasketProductProdctOptionFileDTO;
import kr.co.doogle.mapper.BasketMapper;
import kr.co.doogle.member.Member;

@Controller
public class BasketController {

	@Autowired
	private BasketMapper basketMapper;
	@Autowired
	private Member member;

	@RequestMapping("/shop/basket")
	public String basket(Model model,HttpSession session) {
		if (!member.isLogin(session))
			return "redirect:/login";
		
		//int mno = 1;
		int mno = Integer.parseInt(session.getAttribute("mno").toString());
		ArrayList<BasketProductProdctOptionFileDTO> list = basketMapper.getAllSellProduct(mno);
		ArrayList<BasketProductProdctOptionFileDTO> fList = basketMapper.getFrozenProduct(mno);
		ArrayList<BasketProductProdctOptionFileDTO> rList = basketMapper.getRoomProduct(mno);
		ArrayList<BasketProductProdctOptionFileDTO> cList = basketMapper.getColdProduct(mno);
		ArrayList<BasketProductProdctOptionFileDTO> dList = basketMapper.getDisableProduct(mno);
		
		BasketDeliveryDTO ddto = basketMapper.deliveryInfo(mno);
		
		double totalPrice = 0;		//총금액
		double totalDisPrice = 0;	//할인금액
		double payment = 0;			//결제예정금액s
		double totalEarn = 0;			//총적립금

		for (BasketProductProdctOptionFileDTO dto : list) {
			//금액계산
			if(dto.getSel_yn().equals("y")) {	//판매중인 제품
				if(dto.getPono()>0) {	//옵션있을때
					totalDisPrice += dto.getOprice()*dto.getDiscount()/100*dto.getQuantity();
					totalPrice += dto.getOprice()*dto.getQuantity();
					
					switch (dto.getDis_yn()) {
					case "y":	//할인상품
						payment += dto.getOprice()*dto.getQuantity()*(1-dto.getDiscount()/100);
						totalEarn += dto.getOprice()*dto.getQuantity()*(1-dto.getDiscount()/100)*dto.getEarn()/100;
						break;

					case "n":	//할인x
						payment += dto.getOprice()*dto.getQuantity();
						totalEarn += dto.getOprice()*dto.getQuantity()*dto.getEarn()/100;
						break;
					}
					
				}else {	//옵션없을때
					totalDisPrice += dto.getPprice()*dto.getDiscount()/100*dto.getQuantity();
					totalPrice += dto.getPprice()*dto.getQuantity();
					switch (dto.getDis_yn()) {
					case "y":	//할인 상품
						payment += dto.getPprice()*dto.getQuantity()*(1-dto.getDiscount()/100);
						totalEarn +=  dto.getPprice()*dto.getQuantity()*(1-dto.getDiscount()/100)*dto.getEarn()/100;
						break;
					case "n":	//할인x
						payment += dto.getPprice()*dto.getQuantity();
						totalEarn += dto.getPprice()*dto.getQuantity()*dto.getEarn()/100;
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
		model.addAttribute("totalEarn",Math.round(totalEarn));
		model.addAttribute("fList",fList);
		model.addAttribute("rList",rList);
		model.addAttribute("cList",cList);
		model.addAttribute("dList",dList);
		model.addAttribute("sellableSize",sellableSize);
		model.addAttribute("ddto",ddto);
		model.addAttribute("url","/shop/basket");
		
		return "/front/shop/basket/basket";
	}

	
	@RequestMapping("/shop/addBasket")
	@Transactional(timeout = 10)
	public void addBasket(HttpSession session,BasketDTO bdto, PrintWriter out) {
		//int mno = 1;
		int mno = Integer.parseInt(session.getAttribute("mno").toString());
		int count = basketMapper.dupChkBasket(bdto);
		out.print(count);

		if(count>0) {
			int quantity = basketMapper.cntQuantity(bdto)+bdto.getQuantity();
			out.print(quantity);
			basketMapper.updateQuantity(bdto,quantity);
		}else {
			basketMapper.addBasket(bdto);
		}
	}
	
	 //수량 변경
	 @RequestMapping("/front/shop/basket/chgQuantity")
	 @Transactional(timeout = 10)
	 public void chgQuantity(HttpSession session,HttpServletRequest request,PrintWriter out) { 
		 //int mno=1;
		 int mno = Integer.parseInt(session.getAttribute("mno").toString());
		 int bno = Integer.parseInt(request.getParameter("bno")); 
		 int quantity = Integer.parseInt(request.getParameter("quantity"));
		 int cnt = basketMapper.chgQuantity(quantity,mno,bno);
		 out.print(cnt);
	 }
	 
	
	//상품 한개 삭제
	@RequestMapping("/shop/deleteBasket")
	@Transactional(timeout = 10)
	public String deleteBasket(HttpSession session,HttpServletRequest request) {
		//int mno = 1;
		int mno = Integer.parseInt(session.getAttribute("mno").toString());
		int bno = Integer.parseInt(request.getParameter("bno"));

		basketMapper.deleteBasket(mno,bno);
		return "redirect:/shop/basket";
	}
	
	//선택된 상품 삭제
	@RequestMapping("/shop/delChkBasket")
	@Transactional(timeout = 10)
	public String delChkBasket(HttpSession session,HttpServletRequest request) {
		//int mno = 1;
		String[] bnos = request.getParameterValues("bnoArr");
		int mno = Integer.parseInt(session.getAttribute("mno").toString());
		for(int i=0 ; i<bnos.length ; i++) {
			int bno = Integer.parseInt(bnos[i]);
			basketMapper.deleteBasket(mno,bno);
		}
		return "redirect:/shop/basket";
	}
	
	
	
}