package kr.co.doogle.front.controller.shop;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.dto.FileDTO;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.EventMapper;
import kr.co.doogle.mapper.FileMapper;
import kr.co.doogle.mapper.GradeMapper;
import kr.co.doogle.member.Member;
import kr.co.doogle.paging.Paging;

@Controller
public class EventController {

	@Autowired
	private EventMapper eventMapper;
	@Autowired
	private FileMapper fileMapper;
	@Autowired
	private Paging paging;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private Member member; 

	/* nextgrade추가 */
	@Autowired
	private GradeMapper gradeMapper;

	@RequestMapping("/shop/event")
	public ModelAndView event_main(ModelAndView mv) {
		mv.addObject("elist", eventMapper.getAll());
		mv.addObject("url", "/shop/event");
		mv.setViewName("/front/shop/event/event_list");
		List<Integer> list2 = eventMapper.getFno_main();
		ArrayList<FileDTO> flist = new ArrayList<FileDTO>();
		for (int i : list2) {
			System.out.println(i);
			FileDTO fdto = fileMapper.getOne("where fno=#{fno}", Integer.toString(i));
			System.out.println(fdto);
//			System.out.println();
			flist.add(fdto);
		}
		mv.addObject("flist", flist);
//		System.out.println(rdto.getHd());
		mv.addObject("i", paging.getStartRow());
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		return mv;
	}

	@RequestMapping("/shop/event/my_benefit")
	public String my_benefit(Model model, HttpServletRequest request, HttpSession session) {
		if (!member.isLogin(session))
			return "redirect:/login";
		/* 세션생성되면 id 추가 */
		String id = request.getParameter("id") != null ? request.getParameter("id") : "";
		model.addAttribute("list", gradeMapper.getNext(id));
//		model.addAttribute("list", gradeMapper.getNext("efg"));
		model.addAttribute("url", "/shop/event/my_benefit");
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		return "/front/shop/event/my_benefit";
	}

	@RequestMapping("/shop/event/lover")
	public String event_lover(Model model, HttpServletRequest request) {
		String id = request.getParameter("id") != null ? request.getParameter("id") : "";
		model.addAttribute("id", id);
		model.addAttribute("url", "/shop/event/lover");
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		return "/front/shop/event/lover";
	}

	@RequestMapping("/shop/event/collection")
	public String event_collection(Model model) {
		model.addAttribute("url", "/shop/event/collection");
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		return "/front/shop/event/collection";
	}

	@RequestMapping("/shop/event/total")
	public String event_total(Model model) {
		model.addAttribute("url", "/shop/event/total");
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		return "/front/shop/event/total";
	}

	@RequestMapping("/shop/event/friend")
	public String event_friend(Model model) {
		model.addAttribute("url", "/shop/event/friend");
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		return "/front/shop/event/friend";
	}

	@RequestMapping("/shop/event/basket")
	public String event_basket(Model model) {
		model.addAttribute("url", "/shop/event/basket");
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		return "/front/shop/event/basket";
	}

	@RequestMapping("/shop/event/benefit")
	public String event_benefit(Model model) {
		model.addAttribute("url", "/shop/event/benefit");
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		return "/front/shop/event/benefit";
	}

}