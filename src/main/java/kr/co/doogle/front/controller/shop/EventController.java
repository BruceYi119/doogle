package kr.co.doogle.front.controller.shop;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.dto.EventDTO;
import kr.co.doogle.dto.FileDTO;
import kr.co.doogle.mapper.EventMapper;
import kr.co.doogle.mapper.FileMapper;
import kr.co.doogle.mapper.GradeMapper;
import kr.co.doogle.mapper.ProductMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class EventController {

	@Autowired
	private EventMapper eventMapper;
	@Autowired
	private FileMapper fileMapper;
	@Autowired
	private Paging paging;

	/* nextgrade추가 */
	@Autowired
	private GradeMapper gradeMapper;

	/*상품리스트*/
	@Autowired
	private ProductMapper productMapper;
	
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
		return mv;
	}

	@RequestMapping("/shop/event/my_benefit")
	public String my_benefit(Model model, HttpServletRequest request) {
		/* 세션생성되면 id 추가 */
//		String id = request.getParameter("id") != null ? request.getParameter("id") : "";
//		model.addAttribute("list", gradeMapper.getNext(id));
		model.addAttribute("list", gradeMapper.getNext("efg"));
		model.addAttribute("url", "/shop/event/my_benefit");
		return "/front/shop/event/my_benefit";
	}

	@RequestMapping("/shop/event/lover")
	public String event_lover(Model model, HttpServletRequest request) {
		String id = request.getParameter("id") != null ? request.getParameter("id") : "";
		model.addAttribute("id", id);
		model.addAttribute("url", "/shop/event/lover");
		return "/front/shop/event/lover";
	}

	@RequestMapping("/shop/event/collection")
	public String event_collection(Model model) {
		model.addAttribute("url", "/shop/event/collection");
		return "/front/shop/event/collection";
	}

	@RequestMapping("/shop/event/total")
	public String event_total(Model model) {
		model.addAttribute("url", "/shop/event/total");
		return "/front/shop/event/total";
	}

	@RequestMapping("/shop/event/friend")
	public String event_friend(Model model) {
		model.addAttribute("url", "/shop/event/friend");
		return "/front/shop/event/friend";
	}

	@RequestMapping("/shop/event/basket")
	public String event_basket(Model model) {
		model.addAttribute("url", "/shop/event/basket");
		return "/front/shop/event/basket";
	}

	@RequestMapping("/shop/event/benefit")
	public String event_benefit(Model model) {
		model.addAttribute("url", "/shop/event/benefit");
		return "/front/shop/event/benefit";
	}
	
	@RequestMapping("/shop/event/product")
	public ModelAndView event_product(ModelAndView mv,HttpServletRequest request,EventDTO edto) {
		mv.addObject("edto", eventMapper.getOne(edto.getEno()));
		String brand = request.getParameter("brand") != null ? request.getParameter("brand") : "";
		String name = request.getParameter("name") != null ? request.getParameter("name") : "";
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		System.out.println(brand);
		System.out.println(name);
		paging.setViewCnt(30);

		paging.setPaging(page, productMapper.getEventTotal("where brand like '%'||#{brand}||'%' and name like '%'||#{name}||'%'",brand,name), "/shop/event/product?eno="+edto.getEno()+"&brand="+brand+"&name="+name);
		System.out.println(productMapper.getEventTotal("where brand like '%'||#{brand}||'%' and name like '%'||#{name}||'%'",brand,name));
		mv.addObject("plist", productMapper.getEventFile(paging.getStartRow(), paging.getViewCnt(), "where p.brand like '%'||#{brand}||'%' and p.name like '%'||#{name}||'%'",brand,name));			
		
		mv.addObject("url", "/shop/event/product");
		mv.addObject("i", paging.getStartRow());
		mv.addObject("paging", paging.getPageHtml());
		mv.setViewName("/front/shop/event/event_product");
		return mv;
	}

}
