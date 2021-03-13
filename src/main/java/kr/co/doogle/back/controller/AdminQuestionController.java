package kr.co.doogle.back.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.QuestionDTO;
import kr.co.doogle.mapper.QuestionMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class AdminQuestionController {

	@Autowired
	QuestionMapper questionMapper;
	
	@Autowired
	Paging paging;
	
	@RequestMapping("/admin/question")
	public String questionList(Model model,HttpServletRequest request,QuestionDTO dto) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		if(dto.getCtno() == null ) {
			paging.setPaging(page, questionMapper.getTotal(null,null), "/admin/question");
			model.addAttribute("list",questionMapper.getAll(paging.getStartRow(),paging.getViewCnt(),null,null));
		}else {
			paging.setPaging(page, questionMapper.getTotal("where ctno =#{ctno}",dto.getCtno()), "/admin/question?ctno="+dto.getCtno());
			model.addAttribute("list",questionMapper.getAll(paging.getStartRow(), paging.getViewCnt(), "where ctno = #{ctno}", dto.getCtno()));
		}
		model.addAttribute("idx", paging.getStartRow());
		model.addAttribute("ctno",dto.getCtno() != null ? dto.getCtno(): null);
		model.addAttribute("url","/admin/question");
		model.addAttribute("paging",paging.getPageHtml());
		return "/back/question/list";
	}

	@RequestMapping("/admin/question/add")
	public String add(Model model) {
		model.addAttribute("edit","edit");
		model.addAttribute("url","/admin/question/add");
		return "/back/question/add";
	}
	
	@RequestMapping("/admin/question/add/ok")
	public String questionAddOk(QuestionDTO dto) {
		questionMapper.insert(dto);
		return "redirect:/admin/question";
	}
	
	@RequestMapping("/admin/questionUpdate")
	public String questionUpdate(Model model,int qno) {
		QuestionDTO qdto = questionMapper.getOne(qno);
		model.addAttribute("edit","edit");
		model.addAttribute("url","/admin/questionUpdate");
		model.addAttribute("qdto",qdto);
		return "/back/question/update";
	}
	
	@RequestMapping("/admin/question/update/ok")
	public String updateOk(QuestionDTO dto) {
		questionMapper.update(dto);
		return "redirect:/admin/question";
	}
	
	@RequestMapping("/admin/questionDelete")
	public String questionDelete(int qno) {
		questionMapper.delete(qno);
		return "redirect:/admin/question";
	}
}