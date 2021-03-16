package kr.co.doogle.front.controller.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.AlarmDTO;
import kr.co.doogle.mapper.AlarmMapper;
import kr.co.doogle.mapper.CategoryMapper;

@Controller
public class AlarmController {

	@Autowired
	private AlarmMapper alarmMapper;
	@Autowired
	private CategoryMapper categoryMapper;

	@RequestMapping("/shop/alarmApply")
	public String alarmApply(Model model) {
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		return "/front/shop/alarm/alarmApply";
	}

	@RequestMapping("shop/alarmApplyOk")
	public String alarmApplyOk(AlarmDTO dto) {
		alarmMapper.insert(dto);
		System.out.println(dto);
		return "redirect:/shop/alarmApply";
	}
}
