package kr.co.doogle.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminPopupController {

	@RequestMapping("/admin/popup")
	public String popup() {
		return "/back/popup/list";
	}

	@RequestMapping("/admin/popup/add")
	public String add() {
		return "/back/popup/add";
	}

}