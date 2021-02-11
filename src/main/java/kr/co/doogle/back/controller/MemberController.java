package kr.co.doogle.back.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.front.mapper.MemberMapper;
import kr.co.doogle.pagination.Pagination;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;
	private int range = 10;

	@Bean
	public Pagination pagination() {
		Pagination pagination = new Pagination();

		return pagination;
	}

	@RequestMapping("/admin/member")
	public String member(Model model, HttpServletRequest request) {
		Pagination p = pagination();
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		int range = request.getParameter("range") != null ? Integer.parseInt(request.getParameter("range")) : 1;
		p.setInfo(page, range, memberMapper.getTotalCnt());
		model.addAttribute("page", page);
		model.addAttribute("pageInfo", p.getInfo());
		model.addAttribute("list", memberMapper.getAllPage(page, this.range));
		return "/back/member/member";
	}
}