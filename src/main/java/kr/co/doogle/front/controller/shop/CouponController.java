
package kr.co.doogle.front.controller.shop;

import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.mapper.MyCouponMapper;

@Controller
public class CouponController {

	@Autowired
	private MyCouponMapper myCouponMapper;

	@RequestMapping("/shop/coupon/test")
	public void test(PrintWriter out) {
//		out.print(myCouponMapper.getAll().toString());
	}

}