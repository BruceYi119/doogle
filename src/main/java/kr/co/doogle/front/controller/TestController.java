package kr.co.doogle.front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.doogle.dto.ProductDTO;
import kr.co.doogle.dto.Test1DTO;
import kr.co.doogle.dto.TestDTO;
import kr.co.doogle.file.File;
import kr.co.doogle.mapper.Test1Mapper;
import kr.co.doogle.mapper.TestMapper;

@Controller
public class TestController {

	@Autowired
	private File file;
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
		dto.setTno(4);
		dto.setCon("ㅠㅠㅠㅠㅠ");
		dto1.setCon("ㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
		dto1.setTno(seq);
		testMapper.add(dto);
		test1Mapper.add(dto1);

		return "redirect:/admin/category";
	}

	@RequestMapping("/test/upload/form")
	public String uploadForm() {
		return "/front/test/uploadForm";
	}

	@PostMapping("/file/upload")
	public String uploadFIle(@RequestParam("files") MultipartFile[] files, ProductDTO dto) {
		for (MultipartFile f : files) {
			System.out.println(f.getOriginalFilename());
			System.err.println(file.getRealLoc("product"));
		}

		file.setLocation(file.getLoc().get("product"));
		file.fileUpload(files);
		file.getRealLoc(file.getLoc().get("product"));
		return "redirect:/test/upload/form";
	}

}