package kr.co.doogle.back.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.dto.OrdersMemberDTO;
import kr.co.doogle.mapper.OrdersMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class AdminOrderController {
	
	@Autowired
	OrdersMapper ordersMapper;
	@Autowired
	private Paging paging;
	

	@RequestMapping("/admin/order")
	public String order(Model model, ModelAndView mv, HttpServletRequest request, OrdersMemberDTO omdto) {
		ArrayList<OrdersMemberDTO> adminOrdersArr = ordersMapper.getAdminOrders();
		model.addAttribute("adminOrdersArr",adminOrdersArr);
		
		return "/back/order/list";
	}
	
	
	
	
}