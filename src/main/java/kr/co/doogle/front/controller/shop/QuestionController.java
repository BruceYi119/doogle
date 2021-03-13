package kr.co.doogle.front.controller.shop;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.QnaDTO;
import kr.co.doogle.dto.QuestionDTO;
import kr.co.doogle.mapper.QuestionMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionMapper questionMapper;
	
	
	@Autowired
	Paging paging;
	
//	자주하는 질문
	@RequestMapping("/shop/questionList")
	public String questionList(Model model,HttpServletRequest request,QuestionDTO dto) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		if(dto.getCtno() == null ) {
			paging.setPaging(page, questionMapper.getTotal(null,null), "/shop/questionList");
			model.addAttribute("list",questionMapper.getAll(paging.getStartRow(),paging.getViewCnt(),null,null));
		}else {
			paging.setPaging(page, questionMapper.getTotal("where ctno =#{ctno}",dto.getCtno()), "/shop/questionList?ctno="+dto.getCtno());
			model.addAttribute("list",questionMapper.getAll(paging.getStartRow(), paging.getViewCnt(), "where ctno = #{ctno}", dto.getCtno()));
		}
		model.addAttribute("idx", paging.getStartRow());
		model.addAttribute("ctno",dto.getCtno() != null ? dto.getCtno(): null);
		model.addAttribute("url","/shop/questionList");
		model.addAttribute("paging",paging.getPageHtml());
		return "/front/shop/question/questionList";
	}
	
//  질문지 작성-1
	@RequestMapping("/shop/questionRegister")
	public String questionRegister(QnaDTO dto,Model model) {
		model.addAttribute("edit","edit");
		model.addAttribute("url","/questionRegister");
		return "/front/shop/question/questionRegister";
	}
//  질문지 작성-2
	@RequestMapping("/shop/questionRegisterOk")
	public String questionRegisterOk(QuestionDTO dto) {
		questionMapper.insert(dto);
		System.out.println(dto.getType());
		return "redirect:/shop/questionList";
	}
//	질문지 수정 -1
	@RequestMapping("/shop/questionUpdate")
	public String questionUpdate(Model model,int qno) {
		QuestionDTO qdto = questionMapper.getOne(qno);
		System.out.println(qdto);
		model.addAttribute("edit","edit");
		model.addAttribute("url","/questionUpdate");
		model.addAttribute("qdto",qdto);
		return "/front/shop/question/questionUpdate";
	}
//	질문지 수정 -2
	@RequestMapping("/shop/questionUpdateOk")
	public String questionUpdateOk(QuestionDTO dto) {
		questionMapper.update(dto);
		return "redirect:/shop/questionList";
		
	}
	
//	질문지 삭제 
	@RequestMapping("/shop/questionDelete")
	public String questionDelete(int qno) {
		questionMapper.delete(qno);
		return "redirect:/shop/questionList";
	}

}
