package kr.co.doogle.front.controller.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.dto.CouponDTO;
import kr.co.doogle.dto.MyCouponDTO;
import kr.co.doogle.mapper.CouponMapper;
import kr.co.doogle.mapper.MyCouponMapper;
import kr.co.doogle.mapper.SavingMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class MyCouponController {

	@Autowired
	private MyCouponMapper myCouponMapper;
	@Autowired
	private CouponMapper couponMapper;
	@Autowired
	private SavingMapper savingMapper;
	@Autowired
	private Paging paging;
	
	@RequestMapping("/shop/mypage/mycoupon")
	public ModelAndView mypageCoupon(ModelAndView mv, HttpSession session, HttpServletRequest request, CouponDTO dto) {
		session.setAttribute("mno", "150");  // 150번 mno로 강제 로그인
//		session.setAttribute("mno", "1");  // 1번 mno로 강제 로그인
		
		// mno 형변환
		int mno = Integer.parseInt(session.getAttribute("mno").toString());
		
//		// mno와 일치하는 my_coupon테이블의 데이터 전부나열
//		mv.addObject("list", myCouponMapper.getAll(mno));
//		
//		// mno 와 일치하는 my_coupon테이블의 쿠폰갯수 조회
		mv.addObject("count", myCouponMapper.getCouponCount(mno));
		
//		// 회원의 현재 적립금액전체 출력
		mv.addObject("saving", savingMapper.getOne(mno));
		
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		paging.setPaging(page, myCouponMapper.getCouponCount(mno), "/shop/mypage/mycoupon");
		mv.addObject("i", paging.getStartRow());
		mv.addObject("url", "/shop/mypage/mycoupon");
		mv.addObject("list", myCouponMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), mno));
		mv.addObject("paging", paging.getPageHtml());
//		
		mv.setViewName("/front/shop/mypage/mycoupon");
		return mv;
	}
	
	
	
	// 쿠폰페이지에서 새로운 쿠폰 등록하기
	@RequestMapping("/shop/mypage/mycoupon/add")
	public String add(HttpSession session, MyCouponDTO dto) {
		session.setAttribute("mno", "150"); //강제 로그인 세션, 150(멤버번호)으로 지정
//		session.setAttribute("mno", "1");   //강제 로그인 세션, 1(멤버번호)으로 지정
		
		int cno = couponMapper.getCheck(dto.getCno()); //coupon 테이블에 입력한 쿠폰의 종류가 있는지 확인

		if (cno == 0) {  // 없을경우 
			return "redirect:/shop/mypage/mycoupon/?add=false";
		} else {         // 있을경우
			dto.setMno(Integer.parseInt(session.getAttribute("mno").toString())); // 강제로 지정한 멤버번호 입력
			myCouponMapper.add(dto);	// MyCouponMapper에 있는 insert문 실행		 
			return "redirect:/shop/mypage/mycoupon/?add=true";
		}
	}

}