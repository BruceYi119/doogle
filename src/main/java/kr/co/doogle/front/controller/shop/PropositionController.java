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
import kr.co.doogle.dto.FileDTO;
import kr.co.doogle.dto.PropositionDTO;
import kr.co.doogle.file.File;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.FileMapper;
import kr.co.doogle.mapper.PropositionMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class PropositionController {
	@Autowired
	private PropositionMapper propositionMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private FileMapper fileMapper;
	@Autowired
	private File file;
	@Autowired
	private Paging paging;
	
	// 내가 작성한 리스트 보여주기
	@RequestMapping("/shop/propositionList")
	public String propositionList(Model model,HttpServletRequest request) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		String ctno = request.getParameter("ctno");
		if (ctno == null || ctno == "") {
			paging.setPaging(page, propositionMapper.getTotal(null, null), "/shop/propositionList");
			model.addAttribute("list", propositionMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), null, null));
		} else {
			paging.setPaging(page, propositionMapper.getTotal("where type = #{type}", ctno), "/shop/propositionList?ctno=" + ctno);
			model.addAttribute("list", propositionMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), "where ctno = #{ctno}", ctno));
		}
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		model.addAttribute("url", "/shop/propositionList");
		model.addAttribute("list", propositionMapper.getPcategory());
		model.addAttribute("i", paging.getStartRow());
		model.addAttribute("paging", paging.getPageHtml());
		return "/front/shop/proposition/list";
	}
	
	// 문서 작성 폼
	@RequestMapping("/shop/propositionWrite")
	public String propositionWrite(Model model) {
		List<CategoryDTO> category=categoryMapper.getAllSql("select * from category where lv=0 and type='o'");
		model.addAttribute("url", "/shop/propositionWrite");
		model.addAttribute("edit", "edit");
		model.addAttribute("category", category);
		return "/front/shop/proposition/write";
	}
	
	// 문서 작성 후 insert
	@RequestMapping("/shop/propositionWriteOk")
	public String propositionWriteOk(PropositionDTO dto,@RequestParam("files") MultipartFile[] files) {
		FileDTO fdto = null; // 파일에 넣을 DTO
		ArrayList<String> flist = null; // 넘어온 files을 받을 배열. fno값이 들어감. ,로 연결
		int ctno = 0; // 대분류 값
//		 업로드 파일이 있으면 fileDTO 생성 기본 loc등록
		if (files.length > 0) {
			flist = new ArrayList();
			fdto = new FileDTO();
			file.setLocation(file.getLoc().get("proposition")); // 업로드 경로. 저장 폴더가 자동으로 생성
			fdto.setLoc(file.getRealLoc("proposition")); // img 태그를 사용할 당시에 Loc+name을 붙이면 끝
			ctno = categoryMapper.getTypeCtno("상품제안", 0, "f"); // eco, 대분류 키값, type 키값
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
		propositionMapper.insert(dto);
		return "redirect:/shop/propositionList";
	}
	
	// 문서 업데이트
	@RequestMapping("/shop/propositionUpdate")
	public String propositionUpdate(HttpServletRequest request,Model model) {
		int ppno = Integer.parseInt(request.getParameter("ppno"));
		List<CategoryDTO> category=categoryMapper.getAllSql("select * from category where lv=0 and type='o'");
		model.addAttribute("url", "/shop/propositionWrite");
		model.addAttribute("edit", "edit");
		model.addAttribute("dto", propositionMapper.getContent(ppno));
		model.addAttribute("category", category);
		// 조회
		return "/front/shop/proposition/update";
	}
	
	// 
	@RequestMapping("/shop/propositionUpdateOk")
	public String propositionUpdateOk(PropositionDTO dto) {
		propositionMapper.update(dto);
		return "redirect:/shop/propositionList";
	}
	@RequestMapping("/shop/propositionDelete")
	public String propositionDelete(HttpServletRequest request) {
		int ppno = Integer.parseInt(request.getParameter("ppno"));
		propositionMapper.delete(ppno);
		return "redirect:/shop/propositionList";
	}
}