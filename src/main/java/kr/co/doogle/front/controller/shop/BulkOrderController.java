package kr.co.doogle.front.controller.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.BulkOrderDTO;
import kr.co.doogle.mapper.BulkOrderMapper;
import kr.co.doogle.mapper.CategoryMapper;

@Controller
public class BulkOrderController {

	@Autowired
	private BulkOrderMapper bulkOrderMapper;
	@Autowired
	private CategoryMapper categoryMapper; 

	@RequestMapping("/shop/bulkOrder")
	public String bulk_order(Model model) {
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
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