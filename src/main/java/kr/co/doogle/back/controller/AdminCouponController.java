package kr.co.doogle.back.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.doogle.category.Category;
import kr.co.doogle.dto.CategoryDTO;
import kr.co.doogle.dto.CouponDTO;
import kr.co.doogle.dto.MyCouponDTO;
import kr.co.doogle.dto.ProductDTO;
import kr.co.doogle.file.File;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.CouponMapper;
import kr.co.doogle.mapper.FileMapper;
import kr.co.doogle.mapper.MyCouponMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class AdminCouponController {
	
	@Autowired
	private File file;
	@Autowired
	private Paging paging;
	@Autowired
	private CouponMapper couponMapper;
	@Autowired
	private MyCouponMapper myCouponMapper;
	
	
//	// 쿠폰 전체 리스트
//    @RequestMapping("/admin/coupon/list")
//    public String admin_coupon(Model model, HttpSession session)
//    {	
//		model.addAttribute("couponlist", couponMapper.getAll());
//    	return "/back/coupon/list";
//    }

	@RequestMapping("/admin/coupon")
	public ModelAndView adminCoupon(ModelAndView mv, HttpServletRequest request, CouponDTO dto) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		paging.setPaging(page, couponMapper.getTotal(null, null), "/admin/coupon");
		mv.addObject("i", paging.getStartRow());
		mv.addObject("url", "/admin/coupon/add");
		mv.addObject("couponlist", couponMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), null, null));
		mv.addObject("paging", paging.getPageHtml());
		mv.setViewName("/back/coupon/list");
		return mv;
	}
	
    // 쿠폰 추가
    @RequestMapping("/admin/coupon/add")
    public String adminCouponAdd(HttpSession session, CouponDTO dto)
    {	
    	return "/back/coupon/add";
    }
    
    // 쿠폰 추가 확인
    @RequestMapping("/admin/coupon/add_ok")
    public String adminCouponAddOk(HttpSession session, CouponDTO dto)
    {	
		couponMapper.couponAdd(dto);
    	return "redirect:/admin/coupon";
    }
    
    // 쿠폰 수정
	@RequestMapping("/admin/coupon/mod")
	public ModelAndView mod(ModelAndView mv, @RequestParam("cno") int cno) {
		CouponDTO dto = couponMapper.getOne(cno);
		mv.addObject("url", "/admin/coupon");
		mv.addObject("dto", dto);
		mv.setViewName("/back/coupon/mod");
		return mv;
	}
      
	// 쿠폰 수정 확인
	@RequestMapping("/admin/coupon/mod/ok")
	public String modOk(Model model, CouponDTO dto) {
		couponMapper.mod(dto);
		return "redirect:/admin/coupon";
	}
    
	// 쿠폰 삭제 확인
	// 쿠폰 수정 확인
	@RequestMapping("/admin/coupon/del")
	public String del(Model model, CouponDTO dto) {
		couponMapper.del(dto);
		return "redirect:/admin/coupon";
	}

}