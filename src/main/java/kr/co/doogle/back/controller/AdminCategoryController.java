package kr.co.doogle.back.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.category.Category;
import kr.co.doogle.dto.CategoryDTO;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class AdminCategoryController {

	@Autowired
	private Category category;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private Paging paging;

	@RequestMapping("/admin/category")
	public ModelAndView category(ModelAndView mv, HttpServletRequest request, CategoryDTO dto) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		if (dto.getType() == null || dto.getType() == "") {
			paging.setPaging(page, categoryMapper.getTotal(null, null), "/admin/category");
			mv.addObject("list", categoryMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), null, null));
		} else {
			paging.setPaging(page, categoryMapper.getTotal("where type = #{type}", dto.getType()), "/admin/category?type=" + dto.getType());
			mv.addObject("list", categoryMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), "where type = #{type}", dto.getType()));
		}
		mv.addObject("i", paging.getStartRow());
		mv.addObject("type", dto.getType() != null ? dto.getType() : "");
		mv.addObject("category", category.getType());
		mv.addObject("url", "/admin/category");
		mv.addObject("paging", paging.getPageHtml());
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