package kr.co.doogle.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCategoryController {

	@RequestMapping("/admin/category")
	public String category() {
		return "/back/category/list";
	}

	@RequestMapping("/admin/category/add")
	public String add() {
		return "/back/category/add";
	}

}