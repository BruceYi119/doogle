package kr.co.doogle.back.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.EcoDTO;
import kr.co.doogle.file.File;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.EcoMapper;
import kr.co.doogle.mapper.FileMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class AdminEcoController {
	@Autowired
	private EcoMapper ecoMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private FileMapper fileMapper;
	@Autowired
	private File file;
	@Autowired
	private Paging paging;
	
	@RequestMapping("/admin/eco")
	public String propositionList(Model model,HttpServletRequest request) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		String ctno = request.getParameter("ctno");
		if (ctno == null || ctno == "") {
			paging.setPaging(page, ecoMapper.getTotal(null, null), "/admin/eco");
			model.addAttribute("list", ecoMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), null, null));
		} else {
			paging.setPaging(page, ecoMapper.getTotal("where ctno = #{ctno}", ctno), "/admin/eco?ctno=" + ctno);
			model.addAttribute("list", ecoMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), "where ctno = #{ctno}", ctno));
		}
		model.addAttribute("url", "/admin/eco");
		model.addAttribute("list", ecoMapper.getPcategory());
		model.addAttribute("i", paging.getStartRow());
		model.addAttribute("paging", paging.getPageHtml());
		return "/back/eco/list";
	}
	@RequestMapping("/admin/eco/detail")
	public String propositionUpdate(HttpServletRequest request,Model model) {
		int epno = Integer.parseInt(request.getParameter("epno"));
		model.addAttribute("url", "/admin/eco/detail");
		model.addAttribute("edit", "edit");
		model.addAttribute("dto", ecoMapper.getContent(epno));
		// 조회
		return "/back/eco/write";
	}

}
