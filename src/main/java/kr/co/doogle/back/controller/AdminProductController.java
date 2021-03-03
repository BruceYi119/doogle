package kr.co.doogle.back.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.dto.CategoryDTO;
import kr.co.doogle.dto.FileDTO;
import kr.co.doogle.dto.ProductDTO;
import kr.co.doogle.file.File;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.FileMapper;
import kr.co.doogle.mapper.ProductMapper;
import kr.co.doogle.paging.Paging;
import kr.co.doogle.product.Product;

@Controller
public class AdminProductController {

	@Autowired
	private File file;
	@Autowired
	private Paging paging;
	@Autowired
	private Product product;
	@Autowired
	private FileMapper fileMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private CategoryMapper categoryMapper;

	@RequestMapping("/admin/product")
	public ModelAndView product(ModelAndView mv, HttpServletRequest request) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		paging.setPaging(page, productMapper.getTotal(null, null, null, null), "/admin/category");
		mv.addObject("i", paging.getStartRow());
		mv.addObject("url", "/admin/product/add");
		mv.addObject("list", product.convert(productMapper.getAll(paging.getStartRow(), paging.getViewCnt(), null, null, null, null)));
		mv.addObject("paging", paging.getPageHtml());
		mv.setViewName("/back/product/list");
		return mv;
	}

	@RequestMapping("/admin/product/detail")
	public ModelAndView detail(ModelAndView mv, @RequestParam("pno") int pno) {
		ProductDTO dto = productMapper.getOne(pno);
		mv.addObject("url", "/admin/product");
		mv.addObject("dto", product.convert(dto));
		mv.addObject("flist", fileMapper.getAll("where fno in (" + dto.getFno().replaceAll("(\\d+)", "'$1'") + ")", null));
		mv.setViewName("/back/product/detail");
		return mv;
	}

	@RequestMapping("/admin/product/add")
	public ModelAndView add(ModelAndView mv) {
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		mv.addObject("url", "/admin/product/add");
		mv.setViewName("/back/product/add");
		return mv;
	}

	@RequestMapping("/admin/product/mod")
	public ModelAndView mod(ModelAndView mv, @RequestParam("pno") int pno) {
		ProductDTO dto = productMapper.getOne(pno);
		mv.addObject("url", "/admin/product");
		mv.addObject("dto", dto);
		mv.addObject("flist", fileMapper.getAll("where fno in (" + dto.getFno().replaceAll("(\\d+)", "'$1'") + ")", null));
		mv.addObject("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));
		mv.setViewName("/back/product/mod");
		return mv;
	}

	@RequestMapping("/admin/product/mod/ok")
	public String modOk(Model model, ProductDTO dto) {
		productMapper.mod(dto);
		return "redirect:/admin/product/mod?pno=" + dto.getPno();
	}

	@RequestMapping("/admin/product/ajax/category")
	public void ajaxCategory(PrintWriter out, CategoryDTO dto) throws UnsupportedEncodingException {
		JSONObject json = new JSONObject();
		List<CategoryDTO> list = categoryMapper.getAll("where type = #{type} and lv = #{lv} and pctno = #{pctno}", "p", Integer.toString(dto.getLv()), Integer.toString(dto.getPctno()));
		JSONObject jObj;
		if (list.size() == 0)
			jObj = json.put("list", false);
		else
			jObj = json.put("list", list);
		out.print(URLEncoder.encode(jObj.toString(), "UTF-8"));
	}

	@RequestMapping("/admin/product/add/ok")
	@Transactional(timeout = 10)
	public String addOk(@RequestParam("files") MultipartFile[] files, ProductDTO dto) {
		FileDTO fdto = null;
		ArrayList<String> flist = null;
		int ctno = 0;

		// 업로드 파일이 있으면 fileDTO 생성 기본 loc등록
		if (files.length > 0) {
			flist = new ArrayList();
			fdto = new FileDTO();
			file.setLocation(file.getLoc().get("product"));
			fdto.setLoc(file.getRealLoc("product"));
			ctno = categoryMapper.getTypeCtno("상품", 0, "f");
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
		dto.setFno(String.join(",", flist));

		// 상품 insert
		productMapper.add(dto);

		return "redirect:/admin/product";
	}

}