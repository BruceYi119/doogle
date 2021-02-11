package kr.co.doogle.front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.front.mapper.MemberMapper;

@Controller
public class MainController {

//	@Autowired
//	private MemberMapper memberMapper;

	@RequestMapping("/")
	public String main(Model model) {
//		model.addAttribute("list", memberMapper.getAll());
		return "/front/index";
	}

}