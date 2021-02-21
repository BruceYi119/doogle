package kr.co.doogle.front.controller.shop;

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

}