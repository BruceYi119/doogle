package kr.co.doogle.front.controller.shop;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.dto.FileDTO;
import kr.co.doogle.dto.RecipeDTO;
import kr.co.doogle.file.File;
import kr.co.doogle.mapper.FileMapper;
import kr.co.doogle.mapper.RecipeMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class RecipeController {

	@Autowired
	private FileMapper fileMapper;
	@Autowired
	private RecipeMapper recipeMapper;
	@Autowired
	private Paging paging;
	
	@RequestMapping("/shop/recipe")
	public ModelAndView recipe(ModelAndView mv, HttpServletRequest request, RecipeDTO rdto) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		List<Integer> list2=null;
		if(rdto.getCtno()==null)
		{
			if(rdto.getTitle()==null) {				
				//			mv.addObject("rlist", recipeMapper.getAll());			
				paging.setPaging(page, recipeMapper.getTotal(null,null),"/shop/recipe");			
				mv.addObject("rlist", recipeMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), null, null));				
				list2 =recipeMapper.getFno();
			}else {
				paging.setPaging(page, recipeMapper.getSearchTotal("where title like '%'||#{title}||'%'", rdto.getTitle()),"/shop/recipe?title="+rdto.getTitle());			
				mv.addObject("rlist", recipeMapper.getSearchPaging(paging.getStartRow(), paging.getViewCnt(), "where title like '%'||#{title}||'%'", rdto.getTitle()));								
				list2 =recipeMapper.getFnoSearch("where title like '%'||#{title}||'%'", rdto.getTitle());
			}
			mv.addObject("hd",1);
		}
		else {
			if(rdto.getTitle()==null) {		
//				mv.addObject("rlist", recipeMapper.getChoice("where ctno = #{ctno}",rdto.getCtno()));			
				paging.setPaging(page, recipeMapper.getTotal("where ctno = #{ctno}", rdto.getCtno()), "/admin/recipe?ctno=" + rdto.getCtno());
				mv.addObject("rlist", recipeMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), "where ctno = #{ctno}", rdto.getCtno()));
				mv.addObject("hd",rdto.getHd());
				list2 =recipeMapper.getFnoChoice("where ctno = #{ctno}",rdto.getCtno());
			}else {
				paging.setPaging(page, recipeMapper.getSearchTotal("where title like '%'||#{title}||'%'", rdto.getTitle()),"/shop/recipe?title="+rdto.getTitle());			
				mv.addObject("rlist", recipeMapper.getSearchPaging(paging.getStartRow(), paging.getViewCnt(), "where title like '%'||#{title}||'%'", rdto.getTitle()));								
				list2 =recipeMapper.getFnoSearch("where title = #{title}",rdto.getTitle());
				mv.addObject("hd",1);
			}
			
		}
		System.out.println(list2);
		ArrayList<FileDTO> flist=new ArrayList<FileDTO>();
		for(int i:list2)
		{
			System.out.println(i);
			FileDTO fdto= fileMapper.getOne("where fno=#{fno}", Integer.toString(i));
//			System.out.println(fdto);
//			System.out.println();
			flist.add(fdto);
		}
		mv.addObject("flist",flist);
//		System.out.println(rdto.getHd());
		mv.addObject("i", paging.getStartRow());
		mv.addObject("ctno", rdto.getCtno() != null ? rdto.getCtno() : "");
		mv.addObject("url", "/shop/recipe");
		mv.addObject("paging", paging.getPageHtml());
		mv.setViewName("/front/shop/recipe/recipe_list");
		return mv;
	}

	@RequestMapping("/shop/recipe/readnum")
	public String recipe_readnum(RecipeDTO rdto)
	{
		recipeMapper.setReadnum(rdto.getRno());
		return "redirect:/shop/recipe/content?rno="+rdto.getRno();
	}
	
	@RequestMapping("/shop/recipe/content")
	public String recipe_content(@RequestParam("rno") int rno, Model model) {
		RecipeDTO rdto = recipeMapper.getOne(rno);
		RecipeDTO npdto = recipeMapper.getPN(rno);
		model.addAttribute("rdto", rdto);
		model.addAttribute("npdto", npdto);
		model.addAttribute("url", "/shop/recipe/content");
		return "/front/shop/recipe/recipe_content";
	}
	
}
