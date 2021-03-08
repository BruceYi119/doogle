package kr.co.doogle.front.controller.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.BulkOrderDTO;
import kr.co.doogle.mapper.BulkOrderMapper;

@Controller
public class BulkOrderController {

	@Autowired
	private BulkOrderMapper bulkOrderMapper;

	@RequestMapping("/shop/bulkOrder")
	public String bulk_order(Model model) {
		model.addAttribute("edit", "edit");
		model.addAttribute("url", "/shop/bulkOrder");
		return "/front/shop/bulk_order/list";
	}

	@RequestMapping("/shop/bulkOrderOk")
	public String bulkOrderOk(BulkOrderDTO dto) {
		bulkOrderMapper.insert(dto);
		return "redirect:/shop/bulkOrder";
	}

}