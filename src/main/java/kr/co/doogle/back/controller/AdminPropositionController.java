package kr.co.doogle.back.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.CategoryDTO;
import kr.co.doogle.dto.PropositionDTO;
import kr.co.doogle.file.File;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.FileMapper;
import kr.co.doogle.mapper.PropositionMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class AdminPropositionController {
	@Autowired
	private PropositionMapper propositionMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private FileMapper fileMapper;
	@Autowired
	private File file;
	@Autowired
	private Paging paging;
	
	// 내가 작성한 리스트 보여주기
		@RequestMapping("/admin/proposition")
		public String propositionList(Model model, HttpServletRequest request) {
			int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
			String ctno = request.getParameter("ctno");
			
			if (ctno == null || ctno == "") {
				paging.setPaging(page, propositionMapper.getTotal(null, null), "/admin/proposition");
				model.addAttribute("list", propositionMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), null, null));
			} else {
				paging.setPaging(page, propositionMapper.getTotal("where type = #{type}", ctno), "/admin/proposition?ctno=" + ctno);
				model.addAttribute("list", propositionMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), "where ctno = #{ctno}", ctno));
			}
			model.addAttribute("url", "/admin/proposition");
			model.addAttribute("list", propositionMapper.getPcategory());
			model.addAttribute("i", paging.getStartRow());
			model.addAttribute("paging", paging.getPageHtml());
			return "/back/proposition/list";
		}
		
		@RequestMapping("/admin/proposition/detail")
		public String propositionUpdate(HttpServletRequest request,Model model) {
			int ppno = Integer.parseInt(request.getParameter("ppno"));
			model.addAttribute("url", "/admin/proposition/detail");
			model.addAttribute("edit", "edit");
			model.addAttribute("dto", propositionMapper.getContent(ppno));
			// 조회
			return "/back/proposition/write";
		}
}
