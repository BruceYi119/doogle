package kr.co.doogle.front.controller;

import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.dto.TestDTO;
import kr.co.doogle.mapper.TestMapper;

@Controller
public class TestController {

	@Autowired
	private TestMapper testMapper;

	@RequestMapping("/test")
	public ModelAndView test(ModelAndView mv) {
		mv.addObject("list", testMapper.getAll());
		mv.setViewName("/front/edit/list");
		return mv;
	}

	@RequestMapping("/test/edit")
	public ModelAndView edit(ModelAndView mv) {
		mv.addObject("edit", "edit");
		mv.addObject("url", "/test/edit");
		mv.setViewName("/front/edit/edit");
		return mv;
	}

	@RequestMapping("/test/add")
	public ModelAndView add(ModelAndView mv, TestDTO dto) {
		testMapper.add(dto);
		mv.setViewName("redirect:/test");
		return mv;
	}

	@RequestMapping("/test/test")
	public void getTno(PrintWriter out) {
		out.print(testMapper.getTno("ff"));
	}

}