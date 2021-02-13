package kr.co.doogle.front.controller;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.api.data.Data;
import kr.co.doogle.key.Key;

@Controller
public class MainController {

	@Autowired
	private Key key;
	@Autowired
	private Data data;

	@RequestMapping("/")
	public String main(Model model) {
		return "/front/index";
	}

	@RequestMapping("/calendar")
	public String calendar(Model model) {
		model.addAttribute("url", "/calendar");
		return "/front/calendar/calendar";
	}

	@RequestMapping("/map")
	public String map(Model model) {
		model.addAttribute("url", "/map");
		model.addAttribute("apikey", key.getKeys().get(Key.Kyes.KAKAO_MAP_APPKEY));
		return "/front/api/kakao/map";
	}
	
	@RequestMapping("/covid19")
	public void covid19(PrintWriter out) {
		StringBuffer sb = new StringBuffer();
		LocalDate ld = LocalDate.now();
		LocalDate pld = ld.minusDays(1);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("YYYMMdd");
		String serviceKey = key.getKeys().get(Key.Kyes.DATA_COVID19_SERVICEKEY);
		sb.setLength(0);
		sb.append("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?");
		sb.append("serviceKey=");
		sb.append(serviceKey);
		sb.append("&pageNo=1&");
		sb.append("numOfRows=2&");
		sb.append("startCreateDt=");
		sb.append(dtf.format(pld));
		sb.append("&endCreateDt=&");
		sb.append(dtf.format(ld));

		out.print(data.getXmlData(sb.toString()));
	}

}