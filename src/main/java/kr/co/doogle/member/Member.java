package kr.co.doogle.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import kr.co.doogle.dto.MemberDTO;
import kr.co.doogle.mapper.MemberMapper;
import kr.co.doogle.security.Security;

public class Member {

	@Inject
	private Security security;
	@Inject
	private MemberMapper memberMapper;

	public boolean adminLogin(HttpSession session, String id, String pw) {
		boolean login = false;

		security.getSha512(pw);
		pw = security.getSha512();

		MemberDTO dto = memberMapper.adminLogin(id, pw);

		if (dto != null) {
			session.setAttribute("admin", dto.getId());
			session.setAttribute("id", dto.getId());
			session.setAttribute("name", dto.getName());
			login = true;
		}

		return login;
	}

	public boolean login(HttpSession session, String id, String pw) {
		boolean login = false;

		security.getSha512(pw);
		pw = security.getSha512();

		MemberDTO dto = memberMapper.login(id, pw);

		if (dto != null) {
			session.setAttribute("id", dto.getId());
			session.setAttribute("name", dto.getName());
			login = true;
		}

		return login;
	}

	public boolean isLogin(HttpSession session) {
		Boolean login = false;

		if (session.getAttribute("id") != null && session.getAttribute("name") != null)
			login = true;

		return login;
	}

	public boolean isAdminLogin(HttpSession session) {
		Boolean login = false;
		
		if (session.getAttribute("admin") != null)
			login = true;
		
		return login;
	}

	public void logout(HttpSession session) {
		session.removeAttribute("id");
		session.removeAttribute("name");
	}

}