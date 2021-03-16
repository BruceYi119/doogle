package kr.co.doogle.back.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.member.Member;

@Controller
public class AdminFileController {

	@Autowired
	private Member member;

	@RequestMapping("/admin/file")
	public String file(HttpSession session) {
		if (!member.isAdminLogin(session))
			return "redirect:/login";

		return "/back/file/list";
	}

}