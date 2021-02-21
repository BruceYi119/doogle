package kr.co.doogle.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminProductController {

	@RequestMapping("/admin/product")
	public String product() {
		return "/back/product/list";
	}

	@RequestMapping("/admin/product/add")
	public String add() {
		return "/back/product/add";
	}

}