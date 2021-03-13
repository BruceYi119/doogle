package kr.co.doogle.front.controller.shop;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.dto.CouponDTO;
import kr.co.doogle.dto.MyCouponDTO;
import kr.co.doogle.dto.SavingDTO;
import kr.co.doogle.mapper.CouponMapper;
import kr.co.doogle.mapper.MyCouponMapper;
import kr.co.doogle.mapper.SavingMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class SavingController {
	
	@Autowired
	private MyCouponMapper myCouponMapper;
	@Autowired
	private CouponMapper couponMapper;
	@Autowired
	private SavingMapper savingMapper;
	@Autowired
	private Paging paging;
	
//	@RequestMapping("/shop/mypage/mysaving")
//	public String mypageSaving(Model model, HttpSession session, HttpServletRequest request, SavingDTO dto) {	
//		session.setAttribute("mno", "150");  // 150번 mno로 강제 로그인
////		session.setAttribute("mno", "1");  // 150번 mno로 강제 로그인
//		
//		int mno = Integer.parseInt(session.getAttribute("mno").toString());
//		// 회원의 현재 적립금액전 출력
//		model.addAttribute("saving", savingMapper.getOne(mno));
//		
//		return "/front/shop/mypage/mysaving";
//		
//		
//	}
	
	@RequestMapping("/shop/mypage/mysaving")
	public ModelAndView mypageSaving(ModelAndView mv, HttpSession session, HttpServletRequest request, SavingDTO dto) {
		session.setAttribute("mno", "150");  // 150번 mno로 강제 로그인
//		session.setAttribute("mno", "1");  // 1번 mno로 강제 로그인
		
		// mno 형변환
		int mno = Integer.parseInt(session.getAttribute("mno").toString());
		
//		// mno 와 일치하는 my_coupon테이블의 쿠폰갯수 조회
		mv.addObject("count", myCouponMapper.getCouponCount(mno));
		
//		// 회원의 현재 적립금액전체 출력
		mv.addObject("saving", savingMapper.getOne(mno));
		
//		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
//		paging.setPaging(page, myCouponMapper.getCouponCount(mno), "/shop/mypage/mycoupon");
//		mv.addObject("i", paging.getStartRow());
//		mv.addObject("url", "/shop/mypage/mycoupon");
//		mv.addObject("list", myCouponMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), mno));
//		mv.addObject("paging", paging.getPageHtml());
	
		mv.setViewName("/front/shop/mypage/mysaving");
		return mv;
	}
	
	


}