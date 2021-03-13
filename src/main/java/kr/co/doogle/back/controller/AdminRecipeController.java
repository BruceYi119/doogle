package kr.co.doogle.back.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.dto.FileDTO;
import kr.co.doogle.dto.RecipeDTO;
import kr.co.doogle.file.File;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.FileMapper;
import kr.co.doogle.mapper.RecipeMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class AdminRecipeController {

	@Autowired
	private File file;
	@Autowired
	private Paging paging;
	@Autowired
	private FileMapper fileMapper;
	@Autowired
	private RecipeMapper recipeMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	
	@RequestMapping("/admin/recipe")
	public ModelAndView recipe(ModelAndView mv, HttpServletRequest request, RecipeDTO rdto) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		if (rdto.getCtno()==null) {
			paging.setPaging(page, recipeMapper.getTotal(null, null), "/admin/recipe");
			mv.addObject("list", recipeMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), null, null));
		} else {
			paging.setPaging(page, recipeMapper.getTotal("where ctno = #{ctno}", rdto.getCtno()), "/admin/recipe?ctno=" + rdto.getCtno());
			mv.addObject("list", recipeMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), "where ctno = #{ctno}", rdto.getCtno()));
		}
		mv.addObject("i", paging.getStartRow());
		mv.addObject("ctno", rdto.getCtno() != null ? rdto.getCtno() : "");
		mv.addObject("url", "/admin/recipe");
		mv.addObject("paging", paging.getPageHtml());
		mv.setViewName("/back/recipe/list");
		return mv;
	}
	
	@RequestMapping("/admin/recipe/detail")
	public ModelAndView recipe_detail(ModelAndView mv, @RequestParam("rno") int rno) {
		RecipeDTO rdto = recipeMapper.getOne(rno);
		mv.addObject("rdto", rdto);
		mv.addObject("fdto", fileMapper.getOne("where fno=#{fno}", Integer.toString(rdto.getFno())));		
		mv.setViewName("/back/recipe/detail");
		return mv;
	}
	
	@RequestMapping("/admin/recipe/mod")
	public ModelAndView recipe_mod(ModelAndView mv, @RequestParam("rno") int rno) {
		RecipeDTO rdto = recipeMapper.getOne(rno);
		mv.addObject("rdto", rdto);
		mv.addObject("fdto", fileMapper.getOne("where fno=#{fno}", Integer.toString(rdto.getFno())));		
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}","r","0",null));
		mv.addObject("edit", "edit");
		mv.addObject("url","/admin/recipe/add");
		mv.setViewName("/back/recipe/mod");
		return mv;
	}
	
	@RequestMapping("/admin/recipe/mod/ok")
	@Transactional(timeout = 10)
	public String modOk(@RequestParam("files") MultipartFile[] files,RecipeDTO rdto) {
		FileDTO fdto = null;
		ArrayList<String> flist = null;
		int ctno = 0;
		
		// 업로드 파일이 있으면 fileDTO 생성 기본 loc등록
		if (files.length > 0) {
			flist = new ArrayList();
			fdto = new FileDTO();
			file.setLocation(file.getLoc().get("recipe"));
			fdto.setLoc(file.getRealLoc("recipe"));
			ctno = categoryMapper.getTypeCtno("레시피", 0, "f");
			//value 가져와서 매일밥상/특별한날...등으로 각각 저장 아님 레시피로 저장?
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

		// 새로운 사진을 넣었으면 새로운사진으로, 안넣었으면 원래 사진으로
		if(fdto.getFno()!=0)
			rdto.setFno(fdto.getFno());
				
		recipeMapper.mod(rdto,"where rno=#{rno}",rdto.getRno());
		return "redirect:/admin/recipe/detail?rno=" + rdto.getRno();
	}
	
	@RequestMapping("/admin/recipe/delete")
	public String recipe_delete(@RequestParam("rno") int rno) {
		recipeMapper.delete(rno);
		return "redirect:/admin/recipe";
	}
	
	@RequestMapping("/admin/recipe/add")
	public ModelAndView recipe_write(ModelAndView mv) {
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}","r","0",null));
		mv.addObject("edit", "edit");
		mv.addObject("url","/admin/recipe/add");
		mv.setViewName("/back/recipe/recipe_add");
		return mv;
	}
	
	@RequestMapping("/admin/recipe/add/ok")
	@Transactional(timeout = 10)
	public String recipe_addOk(@RequestParam("files") MultipartFile[] files,RecipeDTO rdto) {
		FileDTO fdto = null;
		ArrayList<String> flist = null;
		int ctno = 0;
		
		// 업로드 파일이 있으면 fileDTO 생성 기본 loc등록
		if (files.length > 0) {
			flist = new ArrayList<String>();
			fdto = new FileDTO();
			file.setLocation(file.getLoc().get("recipe"));
			fdto.setLoc(file.getRealLoc("recipe"));
			ctno = categoryMapper.getTypeCtno("레시피", 0, "f");
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

		// insert한 이미지파일fno productDTO에 등록
		rdto.setFno(fdto.getFno());
		
		recipeMapper.insert(rdto);
		
		return "redirect:/admin/recipe";
	}
	

}