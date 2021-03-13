package kr.co.doogle.front.controller.shop;

import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.NoticeDTO;
import kr.co.doogle.mapper.NoticeMapper;
import kr.co.doogle.paging.Paging;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	@Autowired
	private Paging paging;
	
	@RequestMapping("/shop/notice")
	public String notice(Model model,HttpServletRequest request,NoticeDTO dto) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		if(dto.getTitle() ==null || dto.getTitle() ==""){
			paging.setPaging(page, noticeMapper.getTotal("", ""), "/shop/notice");
			model.addAttribute("list",noticeMapper.getAll(paging.getStartRow(),paging.getViewCnt(), "", ""));
			System.out.println(dto.getTitle());
		}else {
			paging.setPaging(page, noticeMapper.getTotal("where title = #{title}", dto.getTitle()), "/shop/notice?title="+dto.getTitle());
			model.addAttribute("list",noticeMapper.getAll(paging.getStartRow(), paging.getViewCnt(), "where title like '%' || #{title} || '%'",dto.getTitle()));
		}
		model.addAttribute("idx", paging.getStartRow());
		model.addAttribute("title",dto.getTitle() != null ? dto.getTitle(): "");
		model.addAttribute("url","/shop/notice");
		model.addAttribute("paging",paging.getPageHtml());
		return "/front/shop/notice/notice";
	}
	
//  공지사항 View / 이전글 다음글 
	@RequestMapping("/shop/notice_view")
	public String notice_view(Model model,int no) {
		NoticeDTO dto = noticeMapper.getOne(no);
		model.addAttribute("dto",dto);
		NoticeDTO dto1 = noticeMapper.pre_nex(no);
		model.addAttribute("dto1",dto1);
		model.addAttribute("url","/shop/notice_view");
		return "/front/shop/notice/notice_view";
	}
//  공지사항 작성 -1 	
	@RequestMapping("/shop/notice_insert")
	public String notice_insert(Model model) {
		model.addAttribute("edit","edit");
		model.addAttribute("url","/notice_insert");
		return "/front/shop/notice/notice_insert";
	}
//  공지사항 작성 -2
	@RequestMapping("/shop/notice_insert_ok")
	public String notice_insert_ok(NoticeDTO dto) {
		noticeMapper.insert(dto);
		return "redirect:/shop/notice/";
	}
//	공지사항 수정
	@RequestMapping("/shop/notice_update")
	public String notice_update(Model model,int no) {
		NoticeDTO dto = noticeMapper.getOne(no);
		model.addAttribute("dto",dto);
		model.addAttribute("edit","edit");
		model.addAttribute("url","/notice_update");
		return "/front/shop/notice/notice_update";
		
	}
	
	@RequestMapping("/shop/notice_update_ok")
	public String notice_update_ok(NoticeDTO dto) {
		noticeMapper.update(dto);
		return "redirect:/shop/notice_view?no="+dto.getNno();
		
	}
	
	@RequestMapping("/shop/notice_delete")
	public String notice_delete(int no) {
		noticeMapper.delete(no);
		return "redirect:/shop/notice";
	}
	
	@RequestMapping("/shop/noticeReadCnt")
	public String noticeReadCnt(int no) {
		noticeMapper.noticeReadCnt(no);
		return "redirect:/shop/notice_view?no="+no;
	}
}
