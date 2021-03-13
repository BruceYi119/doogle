package kr.co.doogle.back.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.NoticeDTO;
import kr.co.doogle.mapper.NoticeMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class AdminNoticeController {

	@Autowired
	NoticeMapper noticeMapper;
	
	@Autowired
	Paging paging;
	
	
	// 공지사항 전체 조회
	@RequestMapping("/admin/notice")
	public String notice(Model model,HttpServletRequest request,NoticeDTO dto) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		if(dto.getTitle() ==null || dto.getTitle() ==""){
			paging.setPaging(page, noticeMapper.getTotal("", ""), "/admin/notice");
			model.addAttribute("list",noticeMapper.getAll(paging.getStartRow(),paging.getViewCnt(), "", ""));
			System.out.println(dto.getTitle());
		}else {
			paging.setPaging(page, noticeMapper.getTotal("where title = #{title}", dto.getTitle()), "/admin/notice?title="+dto.getTitle());
			model.addAttribute("list",noticeMapper.getAll(paging.getStartRow(), paging.getViewCnt(), "where title = #{title}",dto.getTitle()));
			System.out.println(dto.getTitle());
		}
		model.addAttribute("idx", paging.getStartRow());
		model.addAttribute("title",dto.getTitle() != null ? dto.getTitle(): "");
		model.addAttribute("url","/admin/notice");
		model.addAttribute("paging",paging.getPageHtml());
		return "/back/notice/list";
	}

	// 공지사항 추가
	@RequestMapping("/admin/notice/add")
	public String add(Model model) {
		model.addAttribute("edit","edit");
		model.addAttribute("url","/admin/notice/add");
		return "/back/notice/add";
	}
	
	// 공지사항 추가-2
	@RequestMapping("/admin/notice/add/ok")
	public String addOk(NoticeDTO dto) {
		System.out.println(dto.getType());
		noticeMapper.insert(dto);
		return "redirect:/admin/notice";
	}
	
	// 공지사항 수정
	@RequestMapping("/admin/notice_update")
	public String notice_update(Model model,int no) {
		NoticeDTO dto = noticeMapper.getOne(no);
		model.addAttribute("dto",dto);
		model.addAttribute("edit","edit");
		model.addAttribute("url","/admin/notice_update");
		return "/back/notice/notice_update";
	}
	
	//공지사항 수정-2
	@RequestMapping("/admin/notice_updateOk")
	public String notice_updateOk(NoticeDTO dto) {
		System.out.println(dto);
		noticeMapper.update(dto);
		return "redirect:/admin/notice";
	}
	
	// 공지사항 조회
	@RequestMapping("/admin/notice_view")
	public String notice_view(Model model,int no) {
		NoticeDTO dto = noticeMapper.getOne(no);
		model.addAttribute("dto",dto);
		NoticeDTO dto1 = noticeMapper.pre_nex(no);
		model.addAttribute("dto1",dto1);
		return "/back/notice/notice_view";
	}
	
	// 공지사항 삭제
	@RequestMapping("/admin/notice_delete")
	public String notice_delete(int no) {
		noticeMapper.delete(no);
		return "redirect:/admin/notice";
		
	}
}