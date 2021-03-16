package kr.co.doogle.front.controller.shop;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.DeliveryDTO;
import kr.co.doogle.dto.GradeMemberDTO;
import kr.co.doogle.dto.MemberDTO;
import kr.co.doogle.dto.OrderListProductProductOptionDTO;
import kr.co.doogle.dto.OrdersDTO;
import kr.co.doogle.dto.OrdersPaymentDTO;
import kr.co.doogle.dto.PaymentDTO;
import kr.co.doogle.dto.SavingDTO;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.DeliveryMapper;
import kr.co.doogle.mapper.GradeMapper;
import kr.co.doogle.mapper.MemberMapper;
import kr.co.doogle.mapper.MyCouponMapper;
import kr.co.doogle.mapper.OrderListMapper;
import kr.co.doogle.mapper.OrdersMapper;
import kr.co.doogle.mapper.PaymentMapper;
import kr.co.doogle.mapper.SavingMapper;
import kr.co.doogle.member.Member;

@Controller
public class OrderSummController {

	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private GradeMapper gradeMapper;
	@Autowired
	private SavingMapper savingMapper;
	@Autowired
	private MyCouponMapper myCouponMapper;
	@Autowired
	private OrderListMapper orderListMapper;
	@Autowired
	private OrdersMapper ordersMapper;
	@Autowired
	private PaymentMapper paymentMapper;
	@Autowired
	private DeliveryMapper deliveryMapper;
	@Autowired
	private Member member;
	@Autowired
	private CategoryMapper categoryMapper;

	@RequestMapping("/shop/mypage/orderSumm")
	public String orderSumm(Model model, HttpSession session) {
		if (!member.isLogin(session))
			return "redirect:/login";

		String id = "henry";
		String mno = "1";
		model.addAttribute("url", "/mypage/orderSumm");

		// 사용자 정보 가져오기
		MemberDTO mdto = memberMapper.getOne(id);
		model.addAttribute("mdto", mdto);

		// 사용자 적립율 가져오기
		GradeMemberDTO gmDTO = gradeMapper.getEarn(id);
		model.addAttribute("gmDTO", gmDTO);

		// 사용자 적립금 내용 가져오기
		SavingDTO sDTO = savingMapper.getOne(Integer.parseInt(mno));
		model.addAttribute("sDTO", sDTO);

		// 사용자 쿠폰 내용 가져오기
		int couponCnt = myCouponMapper.myCouponCnt(mno);
		model.addAttribute("couponCnt", couponCnt);

		// 주문 내역 가져오기
		ArrayList<OrdersPaymentDTO> ordersPaymentArr = ordersMapper.getSumm(mno);
		model.addAttribute("ordersArr", ordersPaymentArr);

		// 각각의 주문번호에 해당하는 주문목록의 갯수를 가져오기
		List<Integer> orderListSizeList = new ArrayList<>();
		// 해당 주문번호의 첫 번쨰 상품 이룸 가지고 오기
		List<String> orderProductNamesList = new ArrayList<>();

		// 중복 없이 해당 회원의 주문번호 모두 가져오기

		for (int i = 0; i < ordersPaymentArr.size(); i++) {
			int ono = ordersPaymentArr.get(i).getOno();
			// 첫 추문 내용 가지고 오기
			ArrayList<OrderListProductProductOptionDTO> olpoArr = orderListMapper.getSumm(mno, ono);
			orderListSizeList.add(olpoArr.size());
			if (olpoArr.get(0).getPono() != 0) {
				orderProductNamesList.add(olpoArr.get(0).getPoname());
			} else {
				orderProductNamesList.add(olpoArr.get(0).getPname());
			}
			olpoArr.clear();
		}
		model.addAttribute("ordersSize", orderListSizeList);
		model.addAttribute("firstName", orderProductNamesList);
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));

		return "/front/shop/mypage/orderSumm";
	}

	@RequestMapping("/shop/mypage/orderSumm2021")
	public String orderSumm2021(Model model, HttpSession session) {
		if (!member.isLogin(session))
			return "redirect:/login";

		String id = "henry";
		String mno = "1";
		model.addAttribute("url", "/mypage/orderSumm");

		// 사용자 정보 가져오기
		MemberDTO mdto = memberMapper.getOne(id);
		model.addAttribute("mdto", mdto);

		// 사용자 적립율 가져오기
		GradeMemberDTO gmDTO = gradeMapper.getEarn(id);
		model.addAttribute("gmDTO", gmDTO);

		// 사용자 적립금 내용 가져오기
		SavingDTO sDTO = savingMapper.getOne(Integer.parseInt(mno));
		model.addAttribute("sDTO", sDTO);

		// 사용자 쿠폰 내용 가져오기
		int couponCnt = myCouponMapper.myCouponCnt(mno);
		model.addAttribute("couponCnt", couponCnt);

		// 주문 내역 가져오기
		ArrayList<OrdersPaymentDTO> ordersPaymentArr = ordersMapper.getSumm2021(mno);
		model.addAttribute("ordersArr", ordersPaymentArr);

		// 각각의 주문번호에 해당하는 주문목록의 갯수를 가져오기
		List<Integer> orderListSizeList = new ArrayList<>();
		// 해당 주문번호의 첫 번쨰 상품 이룸 가지고 오기
		List<String> orderProductNamesList = new ArrayList<>();

		// 중복 없이 해당 회원의 주문번호 모두 가져오기

		for (int i = 0; i < ordersPaymentArr.size(); i++) {
			int ono = ordersPaymentArr.get(i).getOno();
			// 첫 추문 내용 가지고 오기
			ArrayList<OrderListProductProductOptionDTO> olpoArr = orderListMapper.getSumm2021(mno, ono);
			orderListSizeList.add(olpoArr.size());
			if (olpoArr.get(0).getPono() != 0) {
				orderProductNamesList.add(olpoArr.get(0).getPoname());
			} else {
				orderProductNamesList.add(olpoArr.get(0).getPname());
			}
			olpoArr.clear();
		}
		model.addAttribute("ordersSize", orderListSizeList);
		model.addAttribute("firstName", orderProductNamesList);
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));

		return "/front/shop/mypage/orderSumm2021";
	}

	@RequestMapping("/shop/mypage/orderSumm2020")
	public String orderSumm2020(Model model, HttpSession session) {
		if (!member.isLogin(session))
			return "redirect:/login";

		String id = "henry";
		String mno = "1";
		model.addAttribute("url", "/mypage/orderSumm");

		// 사용자 정보 가져오기
		MemberDTO mdto = memberMapper.getOne(id);
		model.addAttribute("mdto", mdto);

		// 사용자 적립율 가져오기
		GradeMemberDTO gmDTO = gradeMapper.getEarn(id);
		model.addAttribute("gmDTO", gmDTO);

		// 사용자 적립금 내용 가져오기
		SavingDTO sDTO = savingMapper.getOne(Integer.parseInt(mno));
		model.addAttribute("sDTO", sDTO);

		// 사용자 쿠폰 내용 가져오기
		int couponCnt = myCouponMapper.myCouponCnt(mno);
		model.addAttribute("couponCnt", couponCnt);

		// 주문 내역 가져오기
		ArrayList<OrdersPaymentDTO> ordersPaymentArr = ordersMapper.getSumm2020(mno);
		model.addAttribute("ordersArr", ordersPaymentArr);

		// 각각의 주문번호에 해당하는 주문목록의 갯수를 가져오기
		List<Integer> orderListSizeList = new ArrayList<>();
		// 해당 주문번호의 첫 번쨰 상품 이룸 가지고 오기
		List<String> orderProductNamesList = new ArrayList<>();

		// 중복 없이 해당 회원의 주문번호 모두 가져오기

		for (int i = 0; i < ordersPaymentArr.size(); i++) {
			int ono = ordersPaymentArr.get(i).getOno();
			// 첫 추문 내용 가지고 오기
			ArrayList<OrderListProductProductOptionDTO> olpoArr = orderListMapper.getSumm2020(mno, ono);
			orderListSizeList.add(olpoArr.size());
			if (olpoArr.get(0).getPono() != 0) {
				orderProductNamesList.add(olpoArr.get(0).getPoname());
			} else {
				orderProductNamesList.add(olpoArr.get(0).getPname());
			}
			olpoArr.clear();
		}
		model.addAttribute("ordersSize", orderListSizeList);
		model.addAttribute("firstName", orderProductNamesList);
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));

		return "/front/shop/mypage/orderSumm2020";
	}

	@RequestMapping("/shop/mypage/orderSumm2019")
	public String orderSumm2019(Model model, HttpSession session) {
		if (!member.isLogin(session))
			return "redirect:/login";

		String id = "henry";
		String mno = "1";
		model.addAttribute("url", "/mypage/orderSumm");

		// 사용자 정보 가져오기
		MemberDTO mdto = memberMapper.getOne(id);
		model.addAttribute("mdto", mdto);

		// 사용자 적립율 가져오기
		GradeMemberDTO gmDTO = gradeMapper.getEarn(id);
		model.addAttribute("gmDTO", gmDTO);

		// 사용자 적립금 내용 가져오기
		SavingDTO sDTO = savingMapper.getOne(Integer.parseInt(mno));
		model.addAttribute("sDTO", sDTO);

		// 사용자 쿠폰 내용 가져오기
		int couponCnt = myCouponMapper.myCouponCnt(mno);
		model.addAttribute("couponCnt", couponCnt);

		// 주문 내역 가져오기
		ArrayList<OrdersPaymentDTO> ordersPaymentArr = ordersMapper.getSumm2019(mno);
		model.addAttribute("ordersArr", ordersPaymentArr);

		// 각각의 주문번호에 해당하는 주문목록의 갯수를 가져오기
		List<Integer> orderListSizeList = new ArrayList<>();
		// 해당 주문번호의 첫 번쨰 상품 이룸 가지고 오기
		List<String> orderProductNamesList = new ArrayList<>();

		// 중복 없이 해당 회원의 주문번호 모두 가져오기

		for (int i = 0; i < ordersPaymentArr.size(); i++) {
			int ono = ordersPaymentArr.get(i).getOno();
			// 첫 추문 내용 가지고 오기
			ArrayList<OrderListProductProductOptionDTO> olpoArr = orderListMapper.getSumm2019(mno, ono);
			orderListSizeList.add(olpoArr.size());
			if (olpoArr.get(0).getPono() != 0) {
				orderProductNamesList.add(olpoArr.get(0).getPoname());
			} else {
				orderProductNamesList.add(olpoArr.get(0).getPname());
			}
			olpoArr.clear();
		}
		model.addAttribute("ordersSize", orderListSizeList);
		model.addAttribute("firstName", orderProductNamesList);
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));

		return "/front/shop/mypage/orderSumm2019";
	}

	@RequestMapping("/shop/mypage/orderSumm_detail")
	public String orderSumm_detail(Model model, HttpServletRequest request, HttpSession session) {
		if (!member.isLogin(session))
			return "redirect:/login";

		String id = "henry";
		String mno = "1";
		String ono = request.getParameter("ono");

		model.addAttribute("url", "/mypage/orderSumm_detail");

		// 사용자 정보 가져오기
		MemberDTO mdto = memberMapper.getOne(id);
		model.addAttribute("mdto", mdto);

		// 사용자 적립율 가져오기
		GradeMemberDTO gmDTO = gradeMapper.getEarn(id);
		model.addAttribute("gmDTO", gmDTO);

		// 사용자 적립금 내용 가져오기
		SavingDTO sDTO = savingMapper.getOne(Integer.parseInt(mno));
		model.addAttribute("sDTO", sDTO);

		// 사용자 쿠폰 내용 가져오기
		int couponCnt = myCouponMapper.myCouponCnt(mno);
		model.addAttribute("couponCnt", couponCnt);

		// 배송 메세지 가져오기
		OrdersDTO oDTO = ordersMapper.getOne(mno, ono);
		model.addAttribute("oDTO", oDTO);

		// 각 상품의 가격과 이름 가져오기
		ArrayList<OrderListProductProductOptionDTO> summDetailArr = orderListMapper.getSummDetail(mno, ono);
		model.addAttribute("summDetailArr", summDetailArr);

		// 상세내역 가져오기
		PaymentDTO pDTO = paymentMapper.getOne(mno, ono);
		model.addAttribute("pDTO", pDTO);

		// 보내는분 내용 가져오기
		DeliveryDTO dvDTO = deliveryMapper.getDefault(mno);
		model.addAttribute("dvDTO", dvDTO);

		model.addAttribute("ono", ono);
		model.addAttribute("mno", mno);
		model.addAttribute("clist", categoryMapper.getAll("where type = #{type} and lv = #{lv}", "p", "0", null));

		return "/front/shop/mypage/orderSumm_detail";
	}

	@RequestMapping("/shop/mypage/orderSummDetails/cancel")
	public void orderCancel(HttpServletRequest request, PrintWriter out) {
		String ono = request.getParameter("ono");
		String mno = request.getParameter("mno");
		ordersMapper.cancelOrder(ono, mno);
		out.print("1");
	}

	@RequestMapping("/shop/order/test")
	public void test(HttpServletRequest request, PrintWriter out) {
		String ono = request.getParameter("ono");
		out.print(ono);
		out.print("\n");
		ono = "8";
		String mno = "1";
		ArrayList<OrderListProductProductOptionDTO> summDetailArr = orderListMapper.getSummDetail(mno, ono);
		for (int i = 0; i < summDetailArr.size(); i++) {
			out.print(summDetailArr.get(i).toString());
			out.print("\n");
		}
	}

}