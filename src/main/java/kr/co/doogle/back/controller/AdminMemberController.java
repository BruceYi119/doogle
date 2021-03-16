package kr.co.doogle.back.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.mapper.MemberMapper;
import kr.co.doogle.member.Member;

@Controller
public class AdminMemberController {

	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private Member member;

	@RequestMapping("/admin/member")
	public String member(Model model, HttpServletRequest request, HttpSession session) {
		if (!member.isAdminLogin(session))
			return "redirect:/login";
//		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
//		int range = request.getParameter("range") != null ? Integer.parseInt(request.getParameter("range")) : 1;
//		p.setInfo(page, range, memberMapper.getTotalCnt());
//		model.addAttribute("url", "/paging");
//		model.addAttribute("page", page);
//		model.addAttribute("pageInfo", p.getInfo());
//		model.addAttribute("list", memberMapper.getAllPage(page, this.range));
		return "/back/member/list";
	}

	@RequestMapping("/admin/member/add")
	public String member(HttpSession session) {
		if (!member.isAdminLogin(session))
			return "redirect:/login";

		return "/back/member/add";
	}

}