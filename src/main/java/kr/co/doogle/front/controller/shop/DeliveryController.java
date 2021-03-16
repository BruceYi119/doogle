package kr.co.doogle.front.controller.shop;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.DeliveryDTO;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.DeliveryMapper;
import kr.co.doogle.mapper.MemberMapper;
import kr.co.doogle.member.Member;

@Controller
public class DeliveryController {
	@Autowired
	private DeliveryMapper deliveryMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private Member member;

	@RequestMapping("/shop/deliveryList")
	public String deliveryList(Model model, HttpSession session) {
		if (!member.isLogin(session))
			return "redirect:/login";

		int mno = (int) session.getAttribute("mno");
		List<DeliveryDTO> list = deliveryMapper.getAll(mno);
		ArrayList<String> addr = deliveryMapper.getAddr(mno);
		ArrayList<Integer> addrlist = deliveryMapper.addrRegexp();
		ArrayList<String> teakbea = new ArrayList<String>();
		model.addAttribute("teakbea", teakbea);
		model.addAttribute("list", list);
		model.addAttribute("url", "/shop/deliveryList");
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		return "/front/shop/delivery/list";
	}

	@RequestMapping("/delivery_pop")
	public String delivery_pop(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		int mno = memberMapper.getId(id);
		model.addAttribute("mno", mno);
		model.addAttribute("url", "/delivery_pop");
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		return "/front/shop/delivery/delivery_pop";
	}

	@RequestMapping("/delivery_ok")
	public void delivery_ok(DeliveryDTO dto, PrintWriter out) {
		deliveryMapper.insert(dto);
		out.print(dto.toString());
	}

	@RequestMapping("/deliveryUpdate")
	public String deliveryUpdate(HttpServletRequest request, Model model) {
		String dno = request.getParameter("dno");
		String addr = deliveryMapper.updateGet(dno);
		String addr_detail = deliveryMapper.updateGet2(dno);
		model.addAttribute("addr", addr);
		model.addAttribute("addr_detail", addr_detail);
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		return "/front/shop/delivery/deliveryUpdate";
	}

	@RequestMapping("/deliveryUpdateOk")
	public void deliveryUpdateOk(DeliveryDTO dto, HttpServletRequest request, PrintWriter out) {
		int mno = Integer.parseInt(request.getParameter("mno"));
		String dno = request.getParameter("dno");
		deliveryMapper.update(dto, dno);
		out.print("success");
	}

	@RequestMapping("/deliveryDelete")
	public void deliveryDelete(HttpServletRequest request, PrintWriter out) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		deliveryMapper.delete(dno);
		out.print("success");
	}

	@RequestMapping("/delivery_defaultUpdate")
	public void delivery_defaultUpdate(HttpServletRequest request, PrintWriter out) {
		int dno = Integer.parseInt(request.getParameter("dno"));
		int mno = Integer.parseInt(request.getParameter("mno"));
		System.out.println(dno);
		System.out.println(mno);
		deliveryMapper.defaultUpdateNo(mno);
		deliveryMapper.defaultUpdate(dno);
		out.print("success");
	}

	@RequestMapping("/test2")
	public String test(PrintWriter out, Model model) {
		boolean check = false;
		String addr = "서울 구로구 구로동 a";
		String[] arr = addr.split(" ");
		check = Arrays.asList(arr).contains("서울");
		if (check == false)
			check = Arrays.asList(arr).contains("인천");
		if (check == false)
			check = Arrays.asList(arr).contains("경기");
		out.print(check);

		int mno = memberMapper.getId("mk");
//		System.out.println(mno);
		ArrayList<String> addr3 = deliveryMapper.getAddr(mno);
		ArrayList<String> newaddr = new ArrayList<String>();
		ArrayList<String> newaddr2 = new ArrayList<String>();
//		System.out.println(addr3);

		for (String dd1 : addr3) {
			if (dd1.contains("서울")) {
				dd1 = "y";
				newaddr.add(dd1);
				System.out.println(dd1);
				model.addAttribute("new", newaddr);
			} else {
				newaddr2.add(dd1);
				System.out.println(dd1);
			}
		}
		return "/front/shop/aa";
	}
}
