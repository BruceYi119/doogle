package kr.co.doogle.front.controller.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.category.Category;
import kr.co.doogle.dto.GradeDTO;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.GradeMapper;
import kr.co.doogle.mapper.ProductMapper;
import kr.co.doogle.member.Member;
import kr.co.doogle.paging.Paging;
import kr.co.doogle.product.Product;

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
	@Autowired
	private Product product;
	@Autowired
	private GradeMapper gradeMapper;
	@Autowired
	private Member member;

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

	@RequestMapping("/shop/product/best")
	public ModelAndView bestList(ModelAndView mv, HttpServletRequest request) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

		paging.setViewCnt(30);
		paging.setPaging(page, 50, "/shop/product/best");

		mv.addObject("list", productMapper.getAllFileBestNew(paging.getStartRow(), paging.getViewCnt(), "where p.best_yn = 'y'"));
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		mv.addObject("paging", paging.getPageHtml());	
		mv.setViewName("/front/shop/product/bestList");

		return mv;
	}

	@RequestMapping("/shop/product/new")
	public ModelAndView newList(ModelAndView mv, HttpServletRequest request) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

		paging.setViewCnt(30);
		paging.setPaging(page, 50, "/shop/product/new");

		mv.addObject("list", productMapper.getAllFileBestNew(paging.getStartRow(), paging.getViewCnt(), "where p.new_yn = 'y'"));
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		mv.addObject("paging", paging.getPageHtml());	
		mv.setViewName("/front/shop/product/newList");

		return mv;
	}

	@RequestMapping("/shop/product/search")
	public ModelAndView searchList(ModelAndView mv, HttpServletRequest request, @RequestParam("search") String search) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

		paging.setViewCnt(30);
		paging.setPaging(page, productMapper.getSearchTotal(search), "/shop/product/search?search=" + search);

		mv.addObject("list", productMapper.getAllSearch(paging.getStartRow(), paging.getViewCnt(), search));
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		mv.addObject("paging", paging.getPageHtml());	
		mv.addObject("search", search);	
		mv.addObject("total", paging.getTotalCnt());	
		mv.setViewName("/front/shop/product/searchList");

		return mv;
	}

	@RequestMapping("/shop/product/dis")
	public ModelAndView disList(ModelAndView mv, HttpServletRequest request) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

		paging.setViewCnt(30);
		paging.setPaging(page, 50, "/shop/product/dis");

		mv.addObject("list", productMapper.getAllFileBestNew(paging.getStartRow(), paging.getViewCnt(), "where discount > 10"));
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		mv.addObject("paging", paging.getPageHtml());	
		mv.setViewName("/front/shop/product/disList");

		return mv;
	}

	@RequestMapping("/shop/product/detail/{pno}")
	public ModelAndView detail(ModelAndView mv, @PathVariable("pno") int pno, HttpSession session) {
		int earn = 0;
		String grageName = "";
		if (member.isLogin(session)) {
			GradeDTO dto = gradeMapper.getEarns(session.getAttribute("mno").toString());
			earn = dto.getEarn();
			grageName = dto.getName();
		} 

		mv.addObject("earn", earn);
		mv.addObject("grageName", grageName);
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		mv.addObject("dto", product.convert(productMapper.getDetail(pno)));
		mv.addObject("url", "/shop/product/detail");
		mv.setViewName("/front/shop/product/detail");
		return mv;
	}

}