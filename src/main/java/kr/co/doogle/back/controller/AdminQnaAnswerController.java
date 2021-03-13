package kr.co.doogle.back.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.api.data.AlarmMailSend;
import kr.co.doogle.api.data.CoolSms;
import kr.co.doogle.dto.QnaDTO;
import kr.co.doogle.dto.Qna_AnswerDTO;
import kr.co.doogle.mapper.QnaAnswerMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class AdminQnaAnswerController {
	
	@Autowired
	Paging paging;
	
	@Autowired
	QnaAnswerMapper qnaAnswerMapper;
	
	// 1:1 문의 전체 조회
	@RequestMapping("/admin/qnaAnswer")
	public String qnaAnswer(Model model,HttpServletRequest request,QnaDTO dto) {
		
		ArrayList<Integer> qnnoList = qnaAnswerMapper.getQnno();
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		if(dto.getCtno()==null) {
			paging.setPaging(page, qnaAnswerMapper.getTotal(null, null), "/admin/qnaAnswer");
			model.addAttribute("list",qnaAnswerMapper.getAll(paging.getStartRow(),paging.getViewCnt(),null,null));
		}else {
			paging.setPaging(page, qnaAnswerMapper.getTotal("where ctno =#{ctno}",dto.getCtno()), "/admin/qnaAnswer?ctno="+dto.getCtno());
			model.addAttribute("list",qnaAnswerMapper.getAll(paging.getStartRow(), paging.getViewCnt(), "where ctno = #{ctno}", dto.getCtno()));
		}
		model.addAttribute("ctnonum",qnnoList);
		model.addAttribute("idx", paging.getStartRow());
		model.addAttribute("ctno",dto.getCtno() != null ? dto.getCtno(): null);
		model.addAttribute("url","/admin/qnaAnswer");
		model.addAttribute("paging",paging.getPageHtml());
		
		return "back/qnaAnswer/list";
	}
	
	// 1:1 문의 답변 등록
	@RequestMapping("/admin/qnaAnswerWrite")
	public String quaAnswerWrite(HttpServletRequest request,Model model) {
		int qnno = Integer.parseInt(request.getParameter("no"));
		QnaDTO dto = qnaAnswerMapper.getOne(qnno);
		model.addAttribute("dto",dto);
		model.addAttribute("edit","edit");
		model.addAttribute("url","/admin/qnaAnswerWrite");
		return "back/qnaAnswer/qnaAnswerWrite";
	}
	
	// 자
	@RequestMapping("/admin/quaAnswerView")
	public String quaAnswerView(HttpServletRequest request,Model model) {
		int qnno = Integer.parseInt(request.getParameter("no"));
		QnaDTO dto = qnaAnswerMapper.getOne(qnno);
		String content =qnaAnswerMapper.getContent(qnno);
		model.addAttribute("dto",dto);
		model.addAttribute("edit","edit");
		model.addAttribute("content",content);
		model.addAttribute("url","/admin/quaAnswerView");
		return "back/qnaAnswer/qnaAnswerView";
	}

	@RequestMapping("/admin/qnaAnswerWriteOk")
	public String qnaAnswerWriteOk(Qna_AnswerDTO dto) {
		qnaAnswerMapper.insert(dto);
		return "redirect:/admin/qnaAnswer";
	}
	
	@RequestMapping("/admin/qnaAnswerMail")
	public void qnaAnswerMail(HttpServletRequest request,PrintWriter out) throws Exception {
		AlarmMailSend ams = AlarmMailSend.getInstance();
		String email = request.getParameter("addr");
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		int qnno = Integer.parseInt(request.getParameter("qnno"));
		String content = qnaAnswerMapper.getContent(qnno);
		String subject = "문의 주신" + title + " 에 대한 답변이 도착했습니다";
		String body= "안녕하세요  "+name+"  고객님\n"+ "문의주신 ["+title+"] 에 대한 안내드립니다.\n"+
					 "문의 주신 내용에 대한 답변은 다음과 같습니다.\n"+
					 "----------------------------------------\n"+
					 content;
		System.out.println(content);
		out.print("success");
		ams.setEmail(email, subject, body);
		qnaAnswerMapper.emailOk(qnno);
//		return "redirect:/admin/qnaAnswer";
	}
	
	@RequestMapping("/admin/qnaAnswerPhone")
	public void qnaAnswerPhone(HttpServletRequest request,PrintWriter out) {
		
		String api_key = "NCSSFISVTTSUSP14"; 
        String api_secret = "VPH2JCRGDCSM6JQWL5EMPZ5PFSWQMFL9";  
        int qnno = Integer.parseInt(request.getParameter("qnno"));
        
        String customerPhone = request.getParameter("phone");
        CoolSms coolSms = new CoolSms(api_key, api_secret);
        
        HashMap<String, String> set = new HashMap<String, String>();
        set.put("to", customerPhone);
        
        set.put("from", "01091401058"); // 발신번호
        set.put("text", "[Doogle]문의주신 내용에 대한 답변이 완료되었습니다."); // 문자내용
        set.put("type", "sms");
        
        System.out.println(set);
        JSONObject result = coolSms.send(set);
        out.print("success");
        qnaAnswerMapper.phoneOk(qnno);
        if ((boolean)result.get("status") == true) {
          // 메시지 보내기 성공 및 전송결과 출력
          System.out.println("성공");
          System.out.println(result.get("group_id")); // 그룹아이디
          System.out.println(result.get("result_code")); // 결과코드
          System.out.println(result.get("result_message")); // 결과 메시지
          System.out.println(result.get("success_count")); // 메시지아이디
          System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
        } else {
          // 메시지 보내기 실패
          System.out.println("실패");
          System.out.println(result.get("code")); // REST API 에러코드
          System.out.println(result.get("message")); // 에러메시지
        }
	}
}


















