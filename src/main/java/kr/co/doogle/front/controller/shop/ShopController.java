package kr.co.doogle.front.controller.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.TestDTO;
import kr.co.doogle.mapper.TestMapper;

@Controller
public class ShopController {

	@Autowired
	private TestMapper testMapper;

	@RequestMapping("/shop")
	public String shop() {
		return "/front/shop/shop";
	}

	@RequestMapping("/shop/edit")
	public String edit(Model model) {
		model.addAttribute("dto", testMapper.getAll());
		model.addAttribute("edit", "edit");
		return "/front/shop/edit/edit";
	}

	@RequestMapping("/shop/product/form")
	public String productForm(Model model) {
		model.addAttribute("edit", "edit");
		model.addAttribute("url", "/shop/product/form");
		return "/front/shop/product/form";
	}

	@RequestMapping("/shop/product/insert")
	public String productInsert(Model model, TestDTO dto) {
		testMapper.insert(dto);
		return "redirect:/shop/product/form";
	}

}