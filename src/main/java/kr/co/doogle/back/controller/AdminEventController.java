package kr.co.doogle.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminEventController {

	@RequestMapping("/admin/event")
	public String event() {
		return "/back/event/list";
	}

	@RequestMapping("/admin/event/add")
	public String add() {
		return "/back/event/add";
	}

}