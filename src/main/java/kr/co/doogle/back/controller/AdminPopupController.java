package kr.co.doogle.back.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.dto.PopupDTO;
import kr.co.doogle.mapper.PopupMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class AdminPopupController {

	@Autowired
	private Paging paging;

	@Autowired
	private PopupMapper popupMapper;

	@RequestMapping("/admin/popup")
	public ModelAndView popup(ModelAndView mv, HttpServletRequest request, PopupDTO pudto) {

		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		paging.setPaging(page, popupMapper.getTotal(null, null), "/admin/event");
		mv.addObject("list", popupMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), null, null));

		mv.addObject("i", paging.getStartRow());
		mv.addObject("url", "/admin/popup");
		mv.addObject("paging", paging.getPageHtml());
		mv.setViewName("/back/popup/list");

		return mv;
	}

	@RequestMapping("/admin/popup_test")
	public ModelAndView popup_test(ModelAndView mv, HttpServletRequest request, PopupDTO pudto) {

		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		paging.setPaging(page, popupMapper.getTotal(null, null), "/admin/event");
		mv.addObject("list", popupMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), null, null));

		mv.addObject("i", paging.getStartRow());
		mv.addObject("url", "/admin/popup");
		mv.addObject("paging", paging.getPageHtml());
		mv.setViewName("/back/popup/list_test");

		return mv;
	}

	@RequestMapping("/admin/popup/detail")
	public ModelAndView popup_detail(ModelAndView mv, int puno) {
		PopupDTO pudto = popupMapper.getOne(puno);
		mv.addObject("dto", pudto);
		mv.setViewName("back/popup/detail");
		return mv;
	}

	@RequestMapping("admin/popup/on")
	public ModelAndView popup_on(ModelAndView mv, int puno) {
		PopupDTO pudto = popupMapper.getOne(puno);
		mv.addObject("dto", pudto);
		mv.setViewName("back/popup/on");
		return mv;
	}

	@RequestMapping("/admin/popup/add")
	public ModelAndView popup_add(ModelAndView mv) {
		mv.addObject("edit", "edit");
		mv.addObject("url", "/admin/popup/add");
		mv.setViewName("/back/popup/add");
		return mv;
	}

	@RequestMapping("/admin/popup/add/ok")
	public String popup_addOk(PopupDTO pudto) {
		popupMapper.insert(pudto);
		return "redirect:/admin/popup";
	}

	@RequestMapping("/admin/popup/mod")
	public ModelAndView popup_mod(ModelAndView mv, @RequestParam("puno") int puno) {
		PopupDTO pudto = popupMapper.getOne(puno);
		mv.addObject("pudto", pudto);
		mv.addObject("edit", "edit");
		mv.addObject("url", "/admin/popup/add");
		mv.setViewName("/back/popup/mod");
		return mv;
	}

	@RequestMapping("/admin/popup/mod/ok")
	public String popup_modOk(PopupDTO pudto) {
		popupMapper.mod(pudto, "where puno=#{puno}", pudto.getPuno());
		return "redirect:/admin/popup/detail?puno=" + pudto.getPuno();
	}

	@RequestMapping("/admin/popup/delete")
	public String popup_del(@RequestParam("puno") int puno) {
		popupMapper.del(puno);
		return "redirect:/admin/popup";
	}

}