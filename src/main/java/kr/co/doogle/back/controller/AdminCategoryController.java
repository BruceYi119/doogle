package kr.co.doogle.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.category.Category;
import kr.co.doogle.dto.CategoryDTO;
import kr.co.doogle.mapper.CategoryMapper;

@Controller
public class AdminCategoryController {

	@Autowired
	private Category category;
	@Autowired
	private CategoryMapper categoryMapper;

	@RequestMapping("/admin/category")
	public ModelAndView category(ModelAndView mv, CategoryDTO dto) {
		if (dto.getType() == null || dto.getType() == "")
			mv.addObject("list", categoryMapper.getAll());
		else
			mv.addObject("list", categoryMapper.getAllType(dto.getType()));
		mv.addObject("type", dto.getType() != null ? dto.getType() : "");
		mv.addObject("category", category.getType());
		mv.addObject("url", "/admin/category");
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