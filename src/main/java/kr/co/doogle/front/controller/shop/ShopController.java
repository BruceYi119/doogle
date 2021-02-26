package kr.co.doogle.front.controller.shop;

import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

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

	@RequestMapping("/shop/form")
	public String form() {
		return "/front/shop/product/form";
	}

	@RequestMapping("/shop/form/test")
	public void formTest(PrintWriter out, HttpServletRequest request) {
		out.print(Arrays.toString(request.getParameterValues("bno")));
	}

}