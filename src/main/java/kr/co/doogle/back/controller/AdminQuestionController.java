package kr.co.doogle.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminQuestionController {

	@RequestMapping("/admin/question")
	public String coupon() {
		return "/back/question/list";
	}

	@RequestMapping("/admin/question/add")
	public String add() {
		return "/back/question/add";
	}

}