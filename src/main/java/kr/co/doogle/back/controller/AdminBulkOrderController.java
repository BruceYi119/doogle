package kr.co.doogle.back.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.BulkOrderDTO;
import kr.co.doogle.mapper.BulkOrderMapper;
import kr.co.doogle.paging.Paging;

@Controller
public class AdminBulkOrderController {

	@Autowired
	private BulkOrderMapper bulkOrderMapper;
	@Autowired
	private Paging paging;

	@RequestMapping("/admin/bulkOrder")
	public String bulk_order(Model model,HttpServletRequest request) {
		int page = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		paging.setPaging(page, bulkOrderMapper.getTotal(null, null), "/admin/bulkOrder");
		List<BulkOrderDTO> dto=bulkOrderMapper.getAllPaging(paging.getStartRow(), paging.getViewCnt(), null, null);
		for(BulkOrderDTO d: dto) {
			switch(d.getType()){
				case "m" : d.setKtype("여러곳");break;
				case "o" : d.setKtype("한곳");break;
			}
		}
		model.addAttribute("list", dto);
		model.addAttribute("url", "/admin/bulkOrder");
		model.addAttribute("i", paging.getStartRow());
		model.addAttribute("paging", paging.getPageHtml());
		model.addAttribute("edit", "edit");
		model.addAttribute("url", "/admin/bulkOrder");
		return "/back/bulkOrder/list";
	}
	@RequestMapping("/admin/bulkOrder/detail")
	public String propositionUpdate(HttpServletRequest request,Model model) {
		int bono = Integer.parseInt(request.getParameter("bono"));
		BulkOrderDTO dto=bulkOrderMapper.getContent(bono);
		if(dto.getType()=="m") {
			dto.setType("다중배송");
		}else {
			dto.setType("단일배송");
		}
		model.addAttribute("url", "/admin/bulkOrder/detail");
		model.addAttribute("edit", "edit");
		model.addAttribute("dto", dto);
		// 조회
		return "/back/bulkOrder/write";
	}

//	@RequestMapping("/shop/bulkOrderOk")
//	public String bulkOrderOk(BulkOrderDTO dto) {
//		bulkOrderMapper.insert(dto);
//		return "redirect:/shop/bulkOrderT";
//	}

}
