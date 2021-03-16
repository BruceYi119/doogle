package kr.co.doogle.front.controller.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.SavingDTO;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.MyCouponMapper;
import kr.co.doogle.mapper.SavingListMapper;
import kr.co.doogle.mapper.SavingMapper;
import kr.co.doogle.member.Member;
import kr.co.doogle.paging.Paging;

@Controller
public class SavingController {

	@Autowired
	private MyCouponMapper myCouponMapper;
	@Autowired
	private SavingMapper savingMapper;
	@Autowired
	private SavingListMapper savingListMapper;
	@Autowired
	private Paging paging;
	@Autowired
	private Member member;
	@Autowired
	private CategoryMapper categoryMapper;

	@RequestMapping("/shop/mypage/mysaving")
	public String mypageSaving(Model model, HttpSession session, HttpServletRequest request, SavingDTO dto) {
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

//		// 회원의 적립금 소멸예정 날짜 출력
		model.addAttribute("exp", savingListMapper.exp(mno));

		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		paging.setPaging(page, savingListMapper.getSavingListCnt(mno), "/shop/mypage/mysaving");
		model.addAttribute("i", paging.getStartRow());
		model.addAttribute("url", "/shop/mypage/mysaving");
		model.addAttribute("list", savingListMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), mno));
		model.addAttribute("paging", paging.getPageHtml());
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));

		return "/front/shop/mypage/mysaving";
	}

}