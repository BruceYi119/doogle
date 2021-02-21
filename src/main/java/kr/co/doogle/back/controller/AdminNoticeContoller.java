package kr.co.doogle.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminNoticeContoller {

	@RequestMapping("/admin/notice")
	public String notice() {
		return "/back/notice/list";
	}

	@RequestMapping("/admin/notice/add")
	public String add() {
		return "/back/notice/add";
	}

}