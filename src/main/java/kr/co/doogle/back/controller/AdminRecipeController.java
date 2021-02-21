package kr.co.doogle.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminRecipeController {

	@RequestMapping("/admin/recipe")
	public String recipe() {
		return "/back/recipe/list";
	}

}