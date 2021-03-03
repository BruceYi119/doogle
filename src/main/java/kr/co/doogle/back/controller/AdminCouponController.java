package kr.co.doogle.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCouponController {

	@RequestMapping("/admin/coupon")
	public String coupon() {
		return "/back/coupon/list";
	}

	@RequestMapping("/admin/coupon/add")
	public String add() {
		return "/back/coupon/add";
	}

	@RequestMapping("/admin/coupon/myCoupon")
	public String myCoupon() {
		return "/back/coupon/mylist";
	}

}