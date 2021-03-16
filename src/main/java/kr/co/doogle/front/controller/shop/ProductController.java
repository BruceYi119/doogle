package kr.co.doogle.front.controller.shop;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.category.Category;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.ProductMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class ProductController {

	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private Paging paging;
	@Autowired
	private Category category;

	@RequestMapping("/shop/product/{ctno}")
	public ModelAndView list(ModelAndView mv, @PathVariable("ctno") int ctno, HttpServletRequest request) {
		String cctno = request.getParameter("cctno") != null ? request.getParameter("cctno") : null;
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		paging.setViewCnt(30);

		if (cctno == null) {
			paging.setPaging(page, productMapper.getTotal("where ctno = #{ctno}", Integer.toString(ctno), null, null),
					"/shop/product/" + ctno);
			mv.addObject("plist", productMapper.getAllFile(paging.getStartRow(), paging.getViewCnt(),
					"where p.ctno = #{ctno}", Integer.toString(ctno), null, null));
		} else {
			paging.setPaging(page, productMapper.getTotal("where ctno = #{ctno} and ctno1 = #{ctno1}",
					Integer.toString(ctno), cctno, null), "/shop/product/" + ctno + "?cctno=" + cctno);
			mv.addObject("plist", productMapper.getAllFile(paging.getStartRow(), paging.getViewCnt(),
					"where p.ctno = #{ctno} and p.ctno1 = #{ctno1}", Integer.toString(ctno), cctno, null));
		}

		mv.addObject("icon", category.getIcons().get(Integer.toString(ctno)));
		mv.addObject("cctno", cctno);
		mv.addObject("paging", paging.getPageHtml());
		mv.addObject("category", categoryMapper.getOne(ctno));
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		mv.addObject("mlist", categoryMapper.getAll("where type = #{type} and lv = #{lv} and pctno = #{pctno}", "p",
				"1", Integer.toString(ctno)));
		mv.setViewName("/front/shop/product/list");
		return mv;
	}

	@RequestMapping("/shop/product/detail/{pno}")
	public ModelAndView detail(ModelAndView mv, @PathVariable("pno") int pno) {
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		mv.addObject("dto", productMapper.getDetail(pno));
		mv.setViewName("/front/shop/product/detail");
		return mv;
	}

}