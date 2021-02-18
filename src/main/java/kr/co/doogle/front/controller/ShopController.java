package kr.co.doogle.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShopController {

	@RequestMapping("/shop")
	public String shop() {
		return "/front/shop/shop";
	}

}