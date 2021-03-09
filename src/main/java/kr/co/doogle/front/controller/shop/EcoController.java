package kr.co.doogle.front.controller.shop;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.doogle.dto.CategoryDTO;
import kr.co.doogle.dto.EcoDTO;
import kr.co.doogle.dto.FileDTO;
import kr.co.doogle.file.File;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.EcoMapper;
import kr.co.doogle.mapper.FileMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class EcoController {
	@Autowired
	private EcoMapper ecoMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private File file;
	@Autowired
	private Paging paging;
	@Autowired
	private FileMapper fileMapper;

	@RequestMapping("/shop/ecoList")
	public String propositionList(Model model, HttpServletRequest request) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		String ctno = request.getParameter("ctno");
		if (ctno == null || ctno == "") {
			paging.setPaging(page, ecoMapper.getTotal(null, null), "/shop/ecoList");
			model.addAttribute("list", ecoMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), null, null));
		} else {
			paging.setPaging(page, ecoMapper.getTotal("where type = #{type}", ctno), "/shop/ecoList?ctno=" + ctno);
			model.addAttribute("list", ecoMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), "where ctno = #{ctno}", ctno));
		}
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		model.addAttribute("url", "/shop/ecoList");
		model.addAttribute("list", ecoMapper.getPcategory());
		model.addAttribute("i", paging.getStartRow());
		model.addAttribute("paging", paging.getPageHtml());
		return "/front/shop/eco/list";
	}

	@RequestMapping("/shop/ecoWrite")
	public String propositionWrite(Model model) {
		List<CategoryDTO> category=categoryMapper.getAllSql("select * from category where lv=0 and type='e'");
		model.addAttribute("url", "/shop/ecoWrite");
		model.addAttribute("edit", "edit");
		model.addAttribute("category", category);
		return "/front/shop/eco/write";
	}
	@RequestMapping("/shop/ecoWriteOk")
//	@Transactional(timeout = 10)
	public String propositionWriteOk(@RequestParam("files") MultipartFile[] files, EcoDTO dto) {
		FileDTO fdto = null; // 파일에 넣을 DTO
		ArrayList<String> flist = null; // 넘어온 files을 받을 배열. fno값이 들어감. ,로 연결
		int ctno = 0; // 대분류 값
//		 업로드 파일이 있으면 fileDTO 생성 기본 loc등록
		if (files.length > 0) {
			flist = new ArrayList();
			fdto = new FileDTO();
			file.setLocation(file.getLoc().get("eco")); // 업로드 경로. 저장 폴더가 자동으로 생성
			fdto.setLoc(file.getRealLoc("eco")); // img 태그를 사용할 당시에 Loc+name을 붙이면 끝
			ctno = categoryMapper.getTypeCtno("에코포장피드백", 0, "f"); // eco, 대분류 키값, type 키값
		}

		for (MultipartFile f : files) {
			// 파일을 선택하고 넘어온 파일 files에 insert
			if (f.getOriginalFilename() != "") {
				int fno = fileMapper.getSeq();
				fdto.setFno(fno);
				fdto.setName(f.getOriginalFilename());
				fdto.setReal_name(f.getOriginalFilename());
				fdto.setCtno(ctno);
				flist.add(Integer.toString(fno));
				fileMapper.add(fdto);
			}
		}

		// 파일 업로드
		file.fileUpload(files);

		dto.setFno(String.join(",", flist));
		ecoMapper.insert(dto);
		return "redirect:/shop/ecoList";
	}
	@RequestMapping("/shop/ecoUpdate")
	public String propositionUpdate(HttpServletRequest request,Model model) {
		int epno = Integer.parseInt(request.getParameter("epno"));
		List<CategoryDTO> category=categoryMapper.getAllSql("select * from category where lv=0 and type='e'");
		model.addAttribute("url", "/shop/ecoWrite");
		model.addAttribute("edit", "edit");
		model.addAttribute("dto", ecoMapper.getContent(epno));
		model.addAttribute("category", category);
		// 조회
		return "/front/shop/eco/update";
	}
	@RequestMapping("/shop/ecoUpdateOk")
	public String propositionUpdateOk(EcoDTO dto) {
		ecoMapper.update(dto);
		return "redirect:/shop/ecoList";
	}
	@RequestMapping("/shop/ecoDelete")
	public String propositionDelete(HttpServletRequest request) {
		int epno = Integer.parseInt(request.getParameter("epno"));
		ecoMapper.delete(epno);
		return "redirect:/shop/ecoList";
	}
}