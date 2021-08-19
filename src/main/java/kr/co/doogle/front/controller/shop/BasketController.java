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
import kr.co.doogle.dto.BasketProductProdctOptionFileDTO;
import kr.co.doogle.dto.DeliveryDTO;
import kr.co.doogle.dto.GradeMemberDTO;
import kr.co.doogle.mapper.BasketMapper;
import kr.co.doogle.mapper.DeliveryMapper;
import kr.co.doogle.mapper.GradeMapper;
import kr.co.doogle.member.Member;

@Controller
public class BasketController {

	@Autowired
	private BasketMapper basketMapper;
	@Autowired
	private Member member;
	@Autowired
	private GradeMapper gradeMapper;
	@Autowired
	private DeliveryMapper deliveryMapper;

	@RequestMapping("/shop/basket")
	public String basket(Model model,HttpSession session) {
		if (!member.isLogin(session))
			return "redirect:/login";
		
		//int mno = 1;
		String id = session.getAttribute("id").toString();
		String mno = session.getAttribute("mno").toString();
		
		ArrayList<BasketProductProdctOptionFileDTO> list = basketMapper.getAllSellProduct(mno);
		ArrayList<BasketProductProdctOptionFileDTO> fList = basketMapper.getFrozenProduct(mno);
		ArrayList<BasketProductProdctOptionFileDTO> rList = basketMapper.getRoomProduct(mno);
		ArrayList<BasketProductProdctOptionFileDTO> cList = basketMapper.getColdProduct(mno);
		ArrayList<BasketProductProdctOptionFileDTO> dList = basketMapper.getDisableProduct(mno);
		
		//배송정보 가져오기
		DeliveryDTO ddto = deliveryMapper.getDefault(mno);
		//회원별 적립률 가져오기
		GradeMemberDTO mDTOEarn = gradeMapper.getEarn(id);
		
		double totalPrice = 0;		//총금액
		double totalDisPrice = 0;	//할인금액
		double payment = 0;			//결제예정금액
		double totalEarn = 0;			//총적립금
		double earn = mDTOEarn.getEarn();	//적립률
		
		for (BasketProductProdctOptionFileDTO dto : list) {
			//금액계산
			if(dto.getSel_yn().equals("y")) {	//판매중인 제품
				if(dto.getPono()>0) {	//옵션있을때
					totalPrice += dto.getOprice()*dto.getQuantity();
					switch (dto.getDis_yn()) {
					case "y":	//할인상품
						totalDisPrice += Math.round(dto.getOprice()*dto.getDiscount()/100)*dto.getQuantity();
						break;
					}
				}else {	//옵션없을때
					totalPrice += dto.getPprice()*dto.getQuantity();
					switch (dto.getDis_yn()) {
					case "y":	//할인상품
						totalDisPrice += Math.round(dto.getPprice()*dto.getDiscount()/100)*dto.getQuantity();
						break;
					}
				}
			}
		}
		payment = totalPrice-totalDisPrice;
		totalEarn = payment*earn/100;
		
		//판매 가능한 상품개수
		int sellableSize = fList.size()+rList.size()+cList.size();
		
		model.addAttribute("totalPrice",Math.round(totalPrice));
		model.addAttribute("totalDisPrice",Math.round(totalDisPrice));
		model.addAttribute("payment",Math.round(payment));
		model.addAttribute("totalEarn",Math.round(totalEarn));
		model.addAttribute("earn",earn);
		model.addAttribute("fList",fList);
		model.addAttribute("rList",rList);
		model.addAttribute("cList",cList);
		model.addAttribute("dList",dList);
		model.addAttribute("sellableSize",sellableSize);
		model.addAttribute("ddto",ddto);
		model.addAttribute("url","/shop/basket");
		
		return "/front/shop/basket/basket";
	}

	//장바구니추가
	@RequestMapping("/shop/addBasket")
	@Transactional(timeout = 10)
	public void addBasket(HttpSession session,BasketDTO bdto, PrintWriter out) {
		int mno = session.getAttribute("mno") != null ? Integer.parseInt(session.getAttribute("mno").toString()) : 0;
		boolean isRun = false;
		if(isRun) {
			out.print(-1);
		}
		isRun = true;
		if (mno == 0) {
			out.print(-1);
		} else {
			bdto.setMno(mno);
			int count = basketMapper.dupChkBasket(bdto);
			
			if(count != 0) {
				int quantity = basketMapper.cntQuantity(bdto)+bdto.getQuantity();
				int num = basketMapper.updateQuantity(bdto,quantity);
				out.print(2);
			}else {
				basketMapper.addBasket(bdto);
				out.print(1);
			}
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