package kr.co.doogle.back.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.doogle.dto.FileDTO;
import kr.co.doogle.dto.ProductDTO;
import kr.co.doogle.file.File;
import kr.co.doogle.mapper.FileMapper;
import kr.co.doogle.mapper.ProductMapper;

@Controller
public class AdminProductController {

	@Autowired
	private File file;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private FileMapper fileMapper;

	@RequestMapping("/admin/product")
	public String product() {
		return "/back/product/list";
	}

	@RequestMapping("/admin/product/add")
	public String add() {
		return "/back/product/add";
	}

	@RequestMapping("/admin/product/add/ok")
	@Transactional(timeout = 10)
	public String addOk(@RequestParam("files") MultipartFile[] files, ProductDTO dto) {
		FileDTO fdto = null;
		ArrayList<String> flist = null;
		
		// 업로드 파일이 있으면 fileDTO 생성 기본 loc등록
		if (files.length > 0) {
			flist = new ArrayList();
			fdto = new FileDTO();
			fdto.setLoc(file.getRealLoc(file.getLoc().get("product")));
		}

		for (MultipartFile f : files) {
			// 파일을 선택한 폼만 insert처리
			if (f.getOriginalFilename() != "") {
				fdto.setName(f.getOriginalFilename());
				fdto.setReal_name(f.getOriginalFilename());
			}
		}

		file.setLocation(file.getLoc().get("product"));
		file.fileUpload(files);
		file.getRealLoc(file.getLoc().get("product"));
		return "redirect:/admin/product";
	}

}