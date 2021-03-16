package kr.co.doogle.back.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.PaymentMemberDTO;
import kr.co.doogle.mapper.PaymentMapper;

@Controller
public class AdminPaymentController {

	@Autowired
	PaymentMapper paymentMapper;

	@RequestMapping("/admin/payment")
	public String payment(Model model) {
		ArrayList<PaymentMemberDTO> adminPaymentArr = paymentMapper.getAdminPayment();
		model.addAttribute("adminPaymentArr", adminPaymentArr);
		return "/back/payment/list";
	}

}