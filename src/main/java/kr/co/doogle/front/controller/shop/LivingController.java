package kr.co.doogle.front.controller.shop;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.LivingProductProductOptionFileDTO;
import kr.co.doogle.dto.ProductProductOptionDTO;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.LivingMapper;

@Controller
public class LivingController {
	@Autowired
	private LivingMapper livingMapper;
	@Autowired
	private CategoryMapper categoryMapper;

	@RequestMapping("/shop/living")
	public String living(HttpServletRequest request, Model model) {
		int mno = 1;
		int pno = 2;

		ArrayList<LivingProductProductOptionFileDTO> list = livingMapper.livingList(mno);
		model.addAttribute("list", list);
		model.addAttribute("url", "/shop/living");
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));

		return "/front/shop/living/living";
	}

	@RequestMapping("/shop/livingToBasket")
	public void livingTobasket(HttpServletRequest request, Model model, HttpServletResponse response)
			throws IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		ArrayList<ProductProductOptionDTO> pList = livingMapper.basketPopup(pno);
		Map<String, Object> list = new HashMap<String, Object>();
		if (pList.size() == 1) {
			list.put("option", 0);
			list.put("dto", pList.get(0));
			response.getWriter().print(list);
			model.addAttribute("option", 0);
			model.addAttribute("dto", pList.get(0));
		} else {
			list.put("option", pList.size());
			list.put("pList", pList);
			list.put("name", "[" + pList.get(0).getBrand() + "] " + pList.get(0).getPname());
			response.getWriter().print(list);
			model.addAttribute("option", pList.size());
			model.addAttribute("pList", pList);
			model.addAttribute("name", "[" + pList.get(0).getBrand() + "] " + pList.get(0).getPname());
		}

	}

	@RequestMapping("/shop/deleteLiving")
	public String deleteLiving(HttpServletRequest request) {
		int mno = 1;
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
		int lno = Integer.parseInt(request.getParameter("lno"));
		livingMapper.deleteLiving(mno, lno);
		return "redirect:/shop/living";
	}

	@RequestMapping("/front/shop/living/livingPopup")
	public String livingPopup(Model model) {
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		return "/front/shop/living/livingPopup";
	}

	/* 모달로 늘사는것 리스트 추가 */
	@RequestMapping("/shop/putOnLiving")
	@Transactional(timeout = 10)
	public void putOnLiving(HttpServletRequest request, PrintWriter out) {
		int mno = 1;
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
