package kr.co.doogle.back.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.api.data.AlarmMailSend;
import kr.co.doogle.dto.AlarmDTO;
import kr.co.doogle.dto.MemberDTO;
import kr.co.doogle.dto.ProductDTO;
import kr.co.doogle.mapper.AlarmMapper;
import kr.co.doogle.mapper.ProductMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class AdminAlarmController {
	
	@Autowired
	AlarmMapper alarmMapper;
	
	@Autowired
	ProductMapper productMapper;
	
	@Autowired
	Paging paging;
	
	// 전체 재입고 알림 조회 + 수량 
	@RequestMapping("/admin/alarm")
	public String alarmList(Model model,HttpServletRequest request,AlarmDTO dto) {
		
		List<AlarmDTO> list = alarmMapper.getAll();
		List<ProductDTO> list2 = new ArrayList<ProductDTO>();
		int pno = 0;
		for(AlarmDTO qpno : list) {
			pno = qpno.getPno();
		list2.addAll(productMapper.getQuantity(pno));
		model.addAttribute("list2",list2);
		}
		model.addAttribute("list",list);
		model.addAttribute("url","/admin/alarm");
		return "/back/alarm/list";
	}
	
	// 재입고 알림 회원에게 메일 발송 (이름,내용)
	@RequestMapping("/admin/alarmMailSend")
	public String alarmMailSend(HttpServletRequest request) throws Exception {
		int mno = Integer.parseInt(request.getParameter("mno"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		MemberDTO dto = alarmMapper.getMailPhone(mno);
		AlarmMailSend ams = AlarmMailSend.getInstance();
		String email = dto.getEmail();
		String product = alarmMapper.productName(pno);
		String subject = "요청하신 물품의 재입고 신청이 완료 되었습니다! 지금 바로 구매 가능합니다.";
		String name = dto.getName();
		String body= "안녕하세요  "+name+"  고객님\n"+ "재입고 시 알림을 요청하신 물품 ["+product+"] 이/가 재입고 되었습니다.\n"+"※ 인기 상품의 경우 구매시점에 따라 조기품절될 수 있습니다.";
		ams.setEmail(email, subject, body);
		
		return "redirect:/admin/alarm";
	}
	
	// 문자 메세지 전송 form
	@RequestMapping("/admin/alarmPhoneSend")
	public String alarmPhoneSend(HttpServletRequest request) throws Exception {
        
		return "/back/alarm/send";
	}
	
	// 재입고 알림 문자 메세지 전송
	@GetMapping("/admin/alarmPhoneSendOk")
	public String alarmPhoneSendOk(HttpServletRequest request,PrintWriter out) throws Exception {
//		
//		int mno = Integer.parseInt(request.getParameter("mno"));
//		MemberDTO dto = alarmMapper.getMailPhone(mno);
//		
//		String api_key = "NCSSFISVTTSUSP14"; //api key
//        String api_secret = "VPH2JCRGDCSM6JQWL5EMPZ5PFSWQMFL9";  // api secret
//        
//        String customerPhone = dto.getPhone();
//        		
//        CoolSms coolSms = new CoolSms(api_key, api_secret);
//        JSONObject result1 = coolSms.balance();
//        System.out.println(result1);
//        HashMap<String, String> set = new HashMap<String, String>();
//        set.put("to", customerPhone); // 수신번호
//
//        set.put("from", (String)request.getParameter("from")); // 발신번호
//        set.put("text", (String)request.getParameter("text")); // 문자내용
//        set.put("type", "sms"); // 문자 타입
//
//        System.out.println(set);
//        out.print("success");
//
//        JSONObject result = coolSms.send(set); // 보내기&전송결과받기
////
//        if ((boolean)result.get("status") == true) {
//          // 메시지 보내기 성공 및 전송결과 출력
//          System.out.println("성공");
//          System.out.println(result.get("group_id")); // 그룹아이디
//          System.out.println(result.get("result_code")); // 결과코드
//          System.out.println(result.get("result_message")); // 결과 메시지
//          System.out.println(result.get("success_count")); // 메시지아이디
//          System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
//        } else {
//          // 메시지 보내기 실패
//          System.out.println("실패");
//          System.out.println(result.get("code")); // REST API 에러코드
//          System.out.println(result.get("message")); // 에러메시지
//        }
//  
        return "redirect:/admin/alarm";
	}
	// 개별적으로 문자보낼시 사용되는 메소드.
	@GetMapping("/admin/alarmPhoneSendOk2")
	public String alarmPhoneSendOk2(HttpServletRequest request,PrintWriter out) throws Exception {
		
		String phone = request.getParameter("from");
		
		String api_key = "NCSSFISVTTSUSP14"; //api key
        String api_secret = "VPH2JCRGDCSM6JQWL5EMPZ5PFSWQMFL9";  // api secret
//        
//        		
//        CoolSms coolSms = new CoolSms(api_key, api_secret);
//        JSONObject result1 = coolSms.balance();
//        System.out.println(result1);
//        HashMap<String, String> set = new HashMap<String, String>();
//        set.put("to", phone); // 수신번호
//
//        set.put("from", (String)request.getParameter("from")); // 발신번호
//        set.put("text", (String)request.getParameter("text")); // 문자내용
//        set.put("type", "sms"); // 문자 타입
//
//        System.out.println(set);
//        out.print("success");
//
//        JSONObject result = coolSms.send(set); // 보내기&전송결과받기
////
//        if ((boolean)result.get("status") == true) {
//          // 메시지 보내기 성공 및 전송결과 출력
//          System.out.println("성공");
//          System.out.println(result.get("group_id")); // 그룹아이디
//          System.out.println(result.get("result_code")); // 결과코드
//          System.out.println(result.get("result_message")); // 결과 메시지
//          System.out.println(result.get("success_count")); // 메시지아이디
//          System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
//        } else {
//          // 메시지 보내기 실패
//          System.out.println("실패");
//          System.out.println(result.get("code")); // REST API 에러코드
//          System.out.println(result.get("message")); // 에러메시지
//        }
  
        return "redirect:/admin/alarm";
	}
}
