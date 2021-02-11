package kr.co.doogle.front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.front.mapper.MemberMapper;
import kr.co.doogle.key.Key;

@Controller
public class MainController {

//	@Autowired
//	private MemberMapper memberMapper;

	@Bean
	public Key key() {
		Key key = new Key();

		return key;
	}

	@RequestMapping("/")
	public String main(Model model) {
//		model.addAttribute("list", memberMapper.getAll());
		return "/front/index";
	}

	@RequestMapping("/calendar")
	public String calendar(Model model) {
		model.addAttribute("url", "/calendar");
		return "/front/calendar/calendar";
	}

	@RequestMapping("/map")
	public String map(Model model) {
		Key k = key();
		model.addAttribute("url", "/map");
		model.addAttribute("apikey", k.getKeys().get(Key.Kyes.KAKAO_MAP_APPKEY));
		return "/front/api/kakao/map";
	}

}