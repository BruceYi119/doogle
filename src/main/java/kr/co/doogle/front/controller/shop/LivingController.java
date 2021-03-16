package kr.co.doogle.front.controller.shop;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.dto.ProductProductOptionDTO;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.LivingMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class LivingController {
	@Autowired
	private LivingMapper livingMapper;
	@Autowired
	private Paging paging;
	@Autowired
	private CategoryMapper categoryMapper;

	@RequestMapping("/shop/living")
	public ModelAndView living(HttpSession session, HttpServletRequest request, ModelAndView mv) {
		int mno = 1;
		int pno = 3;
		ArrayList<ProductProductOptionDTO> pList = livingMapper.basketPopup(pno);
		if (pList.size() == 1) {
			mv.addObject("option", 0);
			mv.addObject("dto", pList.get(0));
		} else {

			mv.addObject("option", pList.size());
			mv.addObject("pList", pList);
			mv.addObject("name", "[" + pList.get(0).getBrand() + "] " + pList.get(0).getPname());
		}
		// int mno = Integer.parseInt(session.getAttribute("mno").toString());
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		paging.setPaging(page, livingMapper.getTotal(mno), "/shop/living");
		mv.addObject("list", livingMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), mno));
		mv.addObject("url", "/shop/living");
		mv.addObject("i", paging.getStartRow());
		mv.addObject("paging", paging.getPageHtml());
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));

		mv.setViewName("/front/shop/living/living");
		return mv;
	}

	@RequestMapping("/shop/deleteLiving")
	public String deleteLiving(HttpServletRequest request, HttpSession session) {
		// int mno = 1;
		int mno = Integer.parseInt(session.getAttribute("mno").toString());
		String[] lnos = request.getParameterValues("lno");
		for (int i = 0; i < lnos.length; i++) {
			int lno = Integer.parseInt(lnos[i]);
			livingMapper.deleteLiving(mno, lno);
		}
		return "redirect:/shop/living";
	}

	@RequestMapping("/shop/deleteOneLiving")
	public String deleteOneLiving(HttpServletRequest request) {
		int mno = 1;
		// int mno = Integer.parseInt(session.getAttribute("mno").toString());
		int lno = Integer.parseInt(request.getParameter("lno"));
		livingMapper.deleteLiving(mno, lno);
		return "redirect:/shop/living";
	}

	/* 모달로 늘사는것 리스트 추가 ---상품상세페이지 */
	@RequestMapping("/shop/putOnLiving")
	@Transactional(timeout = 10)
	public void putOnLiving(HttpServletRequest request, PrintWriter out) {
		int mno = 1;
		// int mno = Integer.parseInt(session.getAttribute("mno").toString());
		int pno = Integer.parseInt(request.getParameter("pno"));
		int countNum = livingMapper.isOnTheList(mno, pno);
		if (countNum == 0) {
			livingMapper.addLiving(mno, pno);
			out.print(countNum);
		} else {
			out.print(countNum);
		}
	}
}
