package kr.co.doogle.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminPaymentController {

	@RequestMapping("/admin/payment")
	public String payment() {
		return "/back/payment/list";
	}

}