package kr.co.doogle.front.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.front.mapper.MemberMapper;
import kr.co.doogle.key.Key;

@Controller
public class MainController {

	@Autowired
	private Key k;
	@Autowired
	private MemberMapper memberMapper;

	@RequestMapping("/")
	public String main(Model model) {
		return "/front/index";
	}

	@RequestMapping("/calendar")
	public String calendar(Model model) {
		model.addAttribute("url", "/calendar");
		return "/front/calendar/calendar";
	}

	@RequestMapping("/map")
	public String map(Model model) {
		model.addAttribute("url", "/map");
		model.addAttribute("apikey", k.getKeys().get(Key.Kyes.KAKAO_MAP_APPKEY));
		return "/front/api/kakao/map";
	}

	@RequestMapping("/terms")
	public String terms(Model model) {
		model.addAttribute("url", "/terms");
		return "/front/member/terms";
	}

	@RequestMapping("/join")
	public String join(Model model) {
		model.addAttribute("url", "/join");
		return "/front/member/join";
	}

	@RequestMapping("/id_check")
	public void id_check(HttpServletRequest request, PrintWriter out) {
		String id = request.getParameter("id") != null ? request.getParameter("id") : "";
		String duId = memberMapper.isDuplicateId(id);

		if (duId == null) {
			out.print("{ \"check\": false }");
		} else {
			out.print("{ \"check\": true }");
		}
	}

	@RequestMapping("/jusoPopup")
	public String jusoPopup(Model model, HttpServletRequest request) {
		String confmKey = k.getKeys().get(Key.Kyes.JUSO);
		String inputYn = request.getParameter("inputYn");  
		String roadAddrPart1 = request.getParameter("roadAddrPart1");   
		String zipNo = request.getParameter("zipNo"); 
		String addrDetail = request.getParameter("addrDetail"); 
		String func = request.getParameter("func") != null ? request.getParameter("func") : null;

		model.addAttribute("confmKey", confmKey);
		model.addAttribute("inputYn", inputYn);
		model.addAttribute("roadAddrPart1", roadAddrPart1);
		model.addAttribute("zipNo", zipNo);
		model.addAttribute("addrDetail", addrDetail);
		model.addAttribute("func", func);
		return "/front/member/jusoPopup";
	}

}