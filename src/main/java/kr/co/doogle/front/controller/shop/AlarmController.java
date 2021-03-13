package kr.co.doogle.front.controller.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.AlarmDTO;
import kr.co.doogle.mapper.AlarmMapper;

@Controller
public class AlarmController {
	
	@Autowired
	AlarmMapper alarmMapper;
	
	@RequestMapping("/shop/alarmApply")
	public String alarmApply() {

		return "/front/shop/alarm/alarmApply";
	}
	
	@RequestMapping("shop/alarmApplyOk")
	public String alarmApplyOk(AlarmDTO dto) {
		alarmMapper.insert(dto);
		System.out.println(dto);
		return "redirect:/shop/alarmApply";
	}
}
