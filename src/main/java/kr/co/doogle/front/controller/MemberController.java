package kr.co.doogle.front.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.MemberDTO;
import kr.co.doogle.key.Key;
import kr.co.doogle.mapper.MemberMapper;
import kr.co.doogle.member.Member;
import kr.co.doogle.security.Security;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private Key key;
	@Autowired
	private Member member;
	@Autowired
	private Security security;

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

	@RequestMapping("/member/info")
	public String info(Model model, HttpSession session) {
		if (member.isLogin(session) == false)
			return "redirect:/login";
		model.addAttribute("dto", memberMapper.getOne(session.getAttribute("id").toString()));
		model.addAttribute("url", "/member/info");
		return "/front/member/info";
	}

	@RequestMapping("/member/info_update")
	public void join(MemberDTO dto, PrintWriter out) {
		StringBuilder sb = new StringBuilder();
		int r = memberMapper.updateInfo(dto);
		MemberDTO mdto = memberMapper.getOne(dto.getId());
		if (r == 1)
			sb.append("{ \"update\": true, \"info\": { ");
		else
			sb.append("{ \"update\": false, \"info\": { ");

		sb.append("\"name\": \"");
		sb.append(mdto.getName());
		sb.append("\", \"phone\": \"");
		sb.append(mdto.getPhone());
		sb.append("\", \"birth\": \"");
		sb.append(mdto.getBirth());
		sb.append("\", \"zipcode\": \"");
		sb.append(mdto.getZipcode());
		sb.append("\", \"addr\": \"");
		sb.append(mdto.getAddr());
		sb.append("\", \"addr_detail\": \"");
		sb.append(mdto.getAddr_detail());
		sb.append("\", \"email\": \"");
		sb.append(mdto.getEmail());
		sb.append("\"");
		sb.append(" } }");

		out.write(sb.toString());
	}

	@RequestMapping("/login")
	public String login(Model model, HttpServletRequest request) {
		String login = request.getParameter("login") != null ? request.getParameter("login") : "";
		model.addAttribute("loginErr", login.equals("false") ? "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다." : "");		
		model.addAttribute("url", "/login");		
		return "/front/member/login";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		member.logout(session);
		return "redirect:/";
	}

	@RequestMapping("/login_ok")
	public String login_ok(HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id") != null ? request.getParameter("id") : "";
		String pw = request.getParameter("pw") != null ? request.getParameter("pw") : "";
		boolean login = member.login(session, id, pw);

		if (login == false) {
			return "redirect:/login?login=false";
		}
		return "redirect:/";
	}

	@RequestMapping("/join_ok")
	public String join_ok(HttpSession session, MemberDTO dto) {
		security.getSha512(dto.getPw());
		dto.setPw(security.getSha512());

		int r = memberMapper.insert(dto);
		if (r == 1)
			member.login(session, dto.getId(), dto.getPw());
		return "redirect:/";
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
		String confmKey = key.getKeys().get(Key.Kyes.JUSO);
		String inputYn = request.getParameter("inputYn");  
		String roadAddrPart1 = request.getParameter("roadAddrPart1");   
		String zipNo = request.getParameter("zipNo"); 
		String addrDetail = request.getParameter("addrDetail"); 
		String func = request.getParameter("func") != "" ? request.getParameter("func") : "";

		model.addAttribute("confmKey", confmKey);
		model.addAttribute("inputYn", inputYn);
		model.addAttribute("roadAddrPart1", roadAddrPart1);
		model.addAttribute("zipNo", zipNo);
		model.addAttribute("addrDetail", addrDetail);
		model.addAttribute("func", func);
		return "/front/member/jusoPopup";
	}
	
}