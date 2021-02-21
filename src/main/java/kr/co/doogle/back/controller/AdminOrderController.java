package kr.co.doogle.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminOrderController {

	@RequestMapping("/admin/order")
	public String order() {
		return "/back/order/list";
	}
	
}