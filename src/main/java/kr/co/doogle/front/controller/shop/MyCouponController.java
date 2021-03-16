package kr.co.doogle.front.controller.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.CouponDTO;
import kr.co.doogle.dto.MyCouponDTO;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.CouponMapper;
import kr.co.doogle.mapper.MyCouponMapper;
import kr.co.doogle.mapper.SavingMapper;
import kr.co.doogle.member.Member;
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
	@Autowired
	private Member member;
	@Autowired
	private CategoryMapper categoryMapper;

	@RequestMapping("/shop/mypage/mycoupon")
	public String mypageCoupon(Model model, HttpSession session, HttpServletRequest request, CouponDTO dto) {
		if (!member.isLogin(session))
			return "redirect:/login";

//		session.setAttribute("mno", "1");  	// 1번 mno로 강제 로그인
		session.setAttribute("mno", "2"); // 2번 mno로 강제 로그인
//		session.setAttribute("mno", "150"); // 150번 mno로 강제 로그인

		// mno 형변환
		int mno = Integer.parseInt(session.getAttribute("mno").toString());

//		// mno 와 일치하는 my_coupon테이블의 쿠폰갯수 조회
		model.addAttribute("count", myCouponMapper.getCouponCount(mno));

//		// 회원의 현재 적립금액전체 출력
		model.addAttribute("saving", savingMapper.getOne(mno));

		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		paging.setPaging(page, myCouponMapper.getCouponCount(mno), "/shop/mypage/mycoupon");
		model.addAttribute("i", paging.getStartRow());
		model.addAttribute("url", "/shop/mypage/mycoupon");
		model.addAttribute("list", myCouponMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), mno));
		model.addAttribute("paging", paging.getPageHtml());
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));

		return "/front/shop/mypage/mycoupon";
	}

	// 쿠폰페이지에서 새로운 쿠폰 등록하기
	@RequestMapping("/shop/mypage/mycoupon/add")
	public String add(HttpSession session, MyCouponDTO dto) {
//		session.setAttribute("mno", "1");  	// 1번 mno로 강제 로그인
		session.setAttribute("mno", "2"); // 2번 mno로 강제 로그인
//		session.setAttribute("mno", "150"); // 150번 mno로 강제 로그인

		int cno = couponMapper.getCheck(dto.getCno()); // coupon 테이블에 입력한 쿠폰의 종류가 있는지 확인

		if (cno == 0) { // 없을경우
			return "redirect:/shop/mypage/mycoupon/?add=false";
		} else { // 있을경우
			dto.setMno(Integer.parseInt(session.getAttribute("mno").toString())); // 강제로 지정한 멤버번호 입력
			myCouponMapper.add(dto); // MyCouponMapper에 있는 insert문 실행
			return "redirect:/shop/mypage/mycoupon/?add=true";
		}
	}

}