package kr.co.doogle.front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.Test1DTO;
import kr.co.doogle.dto.TestDTO;
import kr.co.doogle.mapper.Test1Mapper;
import kr.co.doogle.mapper.TestMapper;

@Controller
public class TestController {

	@Autowired
	private TestMapper testMapper;
	@Autowired
	private Test1Mapper test1Mapper;

	@RequestMapping("/test/trainsaction")
	@Transactional(timeout = 10)
	public String test() {
		TestDTO dto = new TestDTO();
		Test1DTO dto1 = new Test1DTO();
		int seq = testMapper.getSeq();
		dto.setTno(seq);
		dto.setCon("ㅠㅠㅠㅠㅠ");
		dto1.setCon("ㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
		dto1.setTno(seq);
		testMapper.add(dto);
		test1Mapper.add(dto1);

		return "redirect:/admin/category";
	}
	
}