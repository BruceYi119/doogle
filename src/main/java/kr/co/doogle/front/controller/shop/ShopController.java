package kr.co.doogle.front.controller.shop;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		mv.setViewName("/front/shop/shop");
		return mv;
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
	public void search(@RequestParam("search") String search, PrintWriter out) throws UnsupportedEncodingException {
		System.out.println(search);
		out.print(search);
	}

}