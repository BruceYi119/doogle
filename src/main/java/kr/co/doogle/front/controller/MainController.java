package kr.co.doogle.front.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.api.data.Data;
import kr.co.doogle.api.naver.Search;
import kr.co.doogle.key.Key;

@Controller
public class MainController {

	@Autowired
	private Key key;
	@Autowired
	private Data data;
	@Autowired
	private Search search;

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

	@RequestMapping("/search/{val}/{type}/{title}")
	public ModelAndView search(ModelAndView mv, HttpServletRequest request, @PathVariable("val") String val,
			@PathVariable("type") String type, @PathVariable("title") String title) {
		String page = request.getParameter("page") != null ? request.getParameter("page") : "1";
		String display = request.getParameter("display") != null ? request.getParameter("display")
				: search.getDisplay() + "";
		JSONObject json = new JSONObject(search.search(val, type));
		String total = !type.equals("ERRATA") ? "(" + json.get("total").toString() + ")" : "";
		String errata = type.equals("ERRATA") ? json.get("errata").toString() : "";
		List<JSONObject> list = new ArrayList();

		if (!type.equals("ERRATA")) {
			JSONArray items = (JSONArray) json.get("items");
			Iterator it = items.iterator();
			while (it.hasNext())
				list.add((JSONObject) it.next());
		}

		mv.addObject("url", "/search");
		mv.addObject("val", val);
		mv.addObject("type", type);
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.addObject("total", total);
		mv.addObject("title", title);
		mv.addObject("errata", errata);
		mv.addObject("display", display);
		mv.setViewName("/front/api/naver/search");
		return mv;
	}

	@RequestMapping("/search/more/{page}/{val}/{type}")
	public void searchMore(PrintWriter out, HttpServletRequest request, @PathVariable("page") String page, @PathVariable("val") String val,
			@PathVariable("type") String type) throws UnsupportedEncodingException {
		StringBuilder sb = new StringBuilder();
		String display = request.getParameter("display") != null ? request.getParameter("display")
				: search.getDisplay() + "";
		JSONObject json = new JSONObject(search.search(val, type));
		String total = !type.equals("ERRATA") ? "(" + json.get("total").toString() + ")" : "";
		String errata = type.equals("ERRATA") ? json.get("errata").toString() : "";
		List<JSONObject> list = new ArrayList();

		if (!type.equals("ERRATA")) {
			JSONArray items = (JSONArray) json.get("items");
			Iterator it = items.iterator();
			while (it.hasNext())
				list.add((JSONObject) it.next());
		}

		sb.append("{ \"html\": \"");
		switch (type) {
		case "BOOK":
			break;
		case "MOVIE":
			break;
		case "LOCAL":
			break;
		case "ERRATA":
			break;
		case "IMAGE":
			for (JSONObject o : list) {
				sb.append("<li class='image'>");
				sb.append("<a href='" + o.get("link") + "' link='" + o.get("link") + "'><img src='" + o.get("thumbnail")
						+ "' /></a>");
				sb.append("</li>");
			}
			break;
		default:
			for (JSONObject o : list) {
				sb.append("<li>");
				sb.append("<dl>");
				sb.append("<dt><a href='" + o.get("link") + "' target='_blank'>" + o.get("title") + "</a></dt>");
				sb.append("<dd>" + o.get("description") + "</dd>");
				sb.append("</dl>");
				sb.append("</li>");
			}
			break;
		}

		sb.append("\", \"page\": " + page + " }");
		out.print(URLEncoder.encode(sb.toString(), "UTF-8"));
	}

}