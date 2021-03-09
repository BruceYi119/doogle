package kr.co.doogle.front.controller.shop;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.mapper.CategoryMapper;

@Controller
public class ShopController {

	@Autowired
	private CategoryMapper categoryMapper;

	@RequestMapping("/shop")
	public ModelAndView shop(ModelAndView mv) {
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		mv.addObject("url", "main");
		mv.setViewName("/front/shop/shop");
		return mv;
	}

	@RequestMapping("/shop/product/category/{ctno}")
	public void shopAjaxProductCategory(PrintWriter out, @PathVariable("ctno") String ctno) throws UnsupportedEncodingException {
		JSONObject json = new JSONObject();
		json.put("list", categoryMapper.getAll("where type = #{type} and lv = #{lv} and pctno = #{pctno}", "p", "1", ctno));
		out.print(URLEncoder.encode(json.toString(), "UTF-8"));
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

	@RequestMapping("/shop/search")
	public void search(@RequestParam("search") String search, PrintWriter out) {
		System.out.println(search);
		out.print(search);
	}

}