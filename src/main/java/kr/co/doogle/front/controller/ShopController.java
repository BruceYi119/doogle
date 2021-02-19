package kr.co.doogle.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShopController {

	@RequestMapping("/shop")
	public String shop() {
		return "/front/shop/shop";
	}

	@RequestMapping("/shop/edit")
	public String edit(Model model) {
		model.addAttribute("edit", "edit");
		return "/front/shop/edit/edit";
	}

	@RequestMapping("/shop/product/form")
	public String productform(Model model) {
		model.addAttribute("edit", "edit");
		model.addAttribute("url", "/shop/product/form");
		return "/front/shop/product/form";
	}

}