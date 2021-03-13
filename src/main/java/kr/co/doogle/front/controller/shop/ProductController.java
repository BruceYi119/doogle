package kr.co.doogle.front.controller.shop;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.ProductMapper;

@Controller
public class ProductController {

	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private CategoryMapper categoryMapper;

	@RequestMapping("/shop/product/{ctno}")
	public ModelAndView list(ModelAndView mv, @PathVariable("ctno") int ctno, HttpServletRequest request) {
		String cctno = request.getParameter("cctno") != null ? request.getParameter("cctno") : null;

		if (cctno == null) {
			mv.addObject("plist", productMapper.getAllFile(1, 21, "where p.ctno = #{ctno}", Integer.toString(ctno), null, null));			
		} else {
			mv.addObject("plist", productMapper.getAllFile(1, 21, "where p.ctno = #{ctno} and p.ctno1 = #{ctno1}", Integer.toString(ctno), cctno, null));						
		}

		mv.addObject("cctno", cctno);
		mv.addObject("category", categoryMapper.getOne(ctno));
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		mv.addObject("mlist", categoryMapper.getAll("where type = #{type} and lv = #{lv} and pctno = #{pctno}", "p", "1", Integer.toString(ctno)));
		mv.setViewName("/front/shop/product/list");
		return mv;
	}

	@RequestMapping("/shop/product/detail/{pno}")
	public ModelAndView detail(ModelAndView mv, @PathVariable("pno") int pno) {
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		mv.addObject("url", "/shop/product/detail/");
		mv.addObject("dto", productMapper.getDetail(pno));
		mv.setViewName("/front/shop/product/detail");
		return mv;
	}

}