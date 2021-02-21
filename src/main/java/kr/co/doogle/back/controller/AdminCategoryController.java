package kr.co.doogle.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.category.Category;

@Controller
public class AdminCategoryController {

	@Autowired
	private Category category;

	@RequestMapping("/admin/category")
	public ModelAndView category(ModelAndView mv) {
		mv.addObject("list", "list");
		mv.setViewName("/back/category/list");
		return mv;
	}

	@RequestMapping("/admin/category/add")
	public ModelAndView add(ModelAndView mv) {
		mv.setViewName("/back/category/add");
		return mv;
	}

	@RequestMapping("/admin/category/init")
	public String init() {
		category.initCategory();
		return "redirect:/admin/category";
	}

}