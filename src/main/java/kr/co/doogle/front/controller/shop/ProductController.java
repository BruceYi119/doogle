package kr.co.doogle.front.controller.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.mapper.ProductMapper;

@Controller
public class ProductController {

	@Autowired
	private ProductMapper productMapper;

	@RequestMapping("/shop/product/detail/{pno}")
	public ModelAndView detail(ModelAndView mv, @PathVariable("pno") int pno) {
		mv.addObject("url", "/shop/product/detail/");
		mv.addObject("dto", productMapper.getDetail(pno));
		mv.setViewName("/front/shop/product/detail");
		return mv;
	}

}