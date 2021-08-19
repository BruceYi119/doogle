package kr.co.doogle.front.controller.shop;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doogle.dto.BasketProductProdctOptionFileDTO;
import kr.co.doogle.dto.CategoryDTO;
import kr.co.doogle.dto.DeliveryDTO;
import kr.co.doogle.dto.GradeMemberDTO;
import kr.co.doogle.dto.MemberDTO;
import kr.co.doogle.dto.MyCouponCouponDTO;
import kr.co.doogle.dto.SavingDTO;
import kr.co.doogle.mapper.BasketMapper;
import kr.co.doogle.mapper.CategoryMapper;
import kr.co.doogle.mapper.DeliveryMapper;
import kr.co.doogle.mapper.GradeMapper;
import kr.co.doogle.mapper.MemberMapper;
import kr.co.doogle.mapper.MyCouponMapper;
import kr.co.doogle.mapper.OrderListMapper;
import kr.co.doogle.mapper.OrdersMapper;
import kr.co.doogle.mapper.PaymentMapper;
import kr.co.doogle.mapper.SavingListMapper;
import kr.co.doogle.mapper.SavingMapper;
import kr.co.doogle.member.Member;

@Controller
public class OrderController {

	@Autowired
	private BasketMapper basketMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private DeliveryMapper deliveryMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private MyCouponMapper myCouponMapper;
	@Autowired
	private SavingMapper savingMapper;
	@Autowired
	private SavingListMapper savingListMapper;
	@Autowired
	private OrdersMapper ordersMapper;
	@Autowired
	private OrderListMapper orderListMapper;
	@Autowired
	private PaymentMapper paymentMapper;
	@Autowired
	private GradeMapper gradeMapper;
	@Autowired
	private Member member;

	@RequestMapping("/shop/order")
	public String order(Model model, HttpServletRequest request, HttpSession session) {
		if (member.isLogin(session) == false)
			return "redirect:/login";
		String id = session.getAttribute("id").toString();
		String mno = session.getAttribute("mno").toString();

		String[] bnos = request.getParameterValues("bno");
		String jbno = "'" + String.join("','", bnos) + "'";

		ArrayList<BasketProductProdctOptionFileDTO> basketArr = basketMapper.getBasketJoin(jbno, mno);
		model.addAttribute("basketArr", basketArr);
		model.addAttribute("url", "/shop/order");
		System.out.println("mno = " + mno);

		// 가격 출력
		double pprice = 0;
		double ppriceDisc = 0;
		double oprice = 0;
		double opriceDisc = 0;
		double ppriceWithDiscount = 0;
		double opriceWithDiscount = 0;
		double pdiscount = 0;
		double odiscount = 0;
		for (int i = 0; i < basketArr.size(); i++) {
			// 옵션이 없으면
			if (basketArr.get(i).getPono() == 0) {
				// 할인이 있으면
				if (basketArr.get(i).getDiscount() > 0) {
					ppriceDisc += basketArr.get(i).getPprice() * basketArr.get(i).getQuantity();
					pdiscount += (basketArr.get(i).getPprice() * ((basketArr.get(i).getDiscount() / 100)))
							* basketArr.get(i).getQuantity();
					ppriceWithDiscount += ((basketArr.get(i).getPprice()
							- (basketArr.get(i).getPprice() * ((basketArr.get(i).getDiscount() / 100)))))
							* basketArr.get(i).getQuantity();
				}
				// 할인이 없으면
				else {
					pprice += basketArr.get(i).getPprice() * basketArr.get(i).getQuantity();
				}
			}
			// 옵션이 있으면
			else if (basketArr.get(i).getPono() > 0) {
				// 할인이 있으면
				if (basketArr.get(i).getDiscount() > 0) {
					opriceDisc += basketArr.get(i).getOprice() * basketArr.get(i).getQuantity();
					odiscount += (basketArr.get(i).getOprice() * ((basketArr.get(i).getDiscount() / 100)))
							* basketArr.get(i).getQuantity();
					opriceWithDiscount += ((basketArr.get(i).getOprice()
							- (basketArr.get(i).getOprice() * ((basketArr.get(i).getDiscount() / 100)))))
							* basketArr.get(i).getQuantity();
				} else {
					oprice += basketArr.get(i).getOprice() * basketArr.get(i).getQuantity();
				}
			}
		}
		double totalPrice = Math.round(ppriceDisc + pprice + opriceDisc + oprice);
		double totalDiscount = Math.round(pdiscount + odiscount);
		double totalPriceWithDiscount = Math.round(ppriceWithDiscount + pprice + opriceWithDiscount + oprice);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("totalDiscount", totalDiscount);
		model.addAttribute("totalPriceWithDiscount", totalPriceWithDiscount);

		// 회원별 적립률 가져와서 계산하기
		GradeMemberDTO mDTOEarn = gradeMapper.getEarn(id);
		int calcEarn = 0;

		// 만약에 상품 합계 금액과 할인적용 금액이 같으면 할인이 없기 때문에...
		if (totalPrice == totalPriceWithDiscount) {
			// 적립율을 가져와서 상품합계 금액과 할인율과 계산
			double earn = mDTOEarn.getEarn();
			calcEarn = (int) Math.round(totalPrice * (earn / 100));
		}
		// 만약에 할인적용금액과 합계 금액이 같지 않으면 할인이 있기 때문에
		else if (totalPrice != totalPriceWithDiscount) {
			// 적립률 가져와서 할인이 적용된 값과 할인율을 적용해서 계산
			double earn = mDTOEarn.getEarn();
			calcEarn = (int) Math.round(totalPriceWithDiscount * (earn / 100));
		}
		// 계산된 적립금액 보내주기
		model.addAttribute("calcEarn", calcEarn);
		// 적립율 값 보내주기
		model.addAttribute("mDTOEarn", mDTOEarn);

		// 주문자 정보 가져오기
		MemberDTO mdto = memberMapper.getOne(id);
		model.addAttribute("mdto", mdto);

		// 기본 배송지 가져오기
		DeliveryDTO ddto = deliveryMapper.getDefault(mno);
		model.addAttribute("ddto", ddto);

		// 쿠폰 정보 가져오기
		// 나의 쿠폰에서 필요한 정보 가져오기
		ArrayList<MyCouponCouponDTO> myCouponArr = myCouponMapper.getCouponDetails(mno);
		// 상품에 대한 할인 조건이 있는 mcno를 저장할 수 있는 Set 생성
		Set<Integer> mcnoProductOkSet = new TreeSet<>();
		// 모든 상품에 대한 할인 조건이 있는 mcno를 저장할 수 있는 Set 생성
		Set<Integer> mcnoAllOkSet = new TreeSet<>();
		// 적용할 수 있는 쿠폰의 mcno를 저장할 수 있는 Set 생성
		Set<Integer> mccSetNA = new TreeSet<>();
		// 적용할 수 있는 쿠폰의 mcno를 저장할 수 있는 Set 생성
		Set<Integer> pnoSet = new TreeSet<>();
		// 적용 가능한 pno만 추가할 수 있는 ArrayList
		ArrayList<String> pnoAppArr = new ArrayList<>();

		// 마이쿠폰에 존재하는 모든 쿠폰 가져와서 for문으로 확인
		for (int i = 0; i < myCouponArr.size(); i++) {
			// 마이쿠폰의 pno 컬럼에 데이터가 있는지 없는지 확인 번호 가져오기
			String pnoColumn = myCouponArr.get(i).getPno();
			// pno 컬럼에 데이터가 존재하지 않는다면 존재하지 않는다면
			if (pnoColumn == null) {
				// mccOkList Set에 mcno 번호 추가 [모두 적용 가능한 쿠폰]
				mcnoAllOkSet.add(myCouponArr.get(i).getMcno());
			}
			// pno 컬럼에 데이터가 존재한다면
			else {
				// pno값을 split해서 ArrayList로 만들어주고
				String[] pnoArr = pnoColumn.split(","); // String Array
				// ArrayList를 List로 만들어주고
				List<String> pnoList = Arrays.asList(pnoArr); // List
				// 장바구니에 있는 pno 갯수 만큼 for문을 통해 확인
				for (int j = 0; j < basketArr.size(); j++) {
					// 만약에 쿠폰에서 가져온 pnoList 값들이 장바구니 pno 번호와 동일 하다면
					if (pnoList.contains(Integer.toString(basketArr.get(j).getPno()))) {
						// mccOkProductList Set에 mcno번호 추가 [특정 상품에만 적용 가능한 쿠폰]
						mcnoProductOkSet.add(myCouponArr.get(i).getMcno());

						// 장바구니에 있는 pno 번호 가져와서 추가
						pnoSet.add(basketArr.get(j).getPno());
					} else {
						// 적용 불가능한 쿠폰
						mccSetNA.add(myCouponArr.get(i).getMcno());
					}

				}
				pnoAppArr.add(pnoSet.toString());
				pnoSet.clear();
			}
		}
		List<Integer> mccSetNaCheck = new ArrayList<>(mccSetNA);
		List<Integer> mcnoProductOkSetCheck = new ArrayList<>(mcnoProductOkSet);
		for (int u = 0; u < mccSetNaCheck.size(); u++) {
			for (int t = 0; t < mcnoProductOkSetCheck.size(); t++) {
				if (mccSetNaCheck.contains(mcnoProductOkSetCheck.get(t))) {
					mccSetNA.remove(mccSetNaCheck.get(u));
				}
			}
		}

		// [모두 적용 가능 쿠폰] mcno데이터가 담긴 mccOkSet을 List로 변환
		List<Integer> mcnoAllOkList = new ArrayList<>(mcnoAllOkSet);
		// [모두 적용 가능 쿠폰] DTO를 담을 ArrayList 만들기
		ArrayList<MyCouponCouponDTO> allOkCoupon = new ArrayList<>();
		// 마이쿠폰에 있는 모든 쿠폰 가져와서 확인
		for (int k = 0; k < myCouponArr.size(); k++) {
			// [모두 적용 가능 쿠폰] mcnoList 데이터의 갯수 만큼 for문 실행하면서
			for (int l = 0; l < mcnoAllOkList.size(); l++) {
				// 만약에 mcnoList의 데이터가 마이쿠폰에서 가져온 mccArr의 mcno 데이터와 같으면
				if (mcnoAllOkList.get(l) == myCouponArr.get(k).getMcno()) {
					// 해당 mcno쿠폰 번호가 있는 쿠폰을 allOkCoupon ARR에 추가
					allOkCoupon.add(myCouponArr.get(k));
				}
			}
		}
		// 모두 적용이 가능한 쿠폰 List
		model.addAttribute("allOkCoupon", allOkCoupon);

		ArrayList<Integer> allOkCouponDiscount = new ArrayList<>();
		// 계산된 할인가를 담을 변수 선언
		int allOkCouponDiscountPrice = 0;
		// 모두 적용 가능한 쿠폰의 수 만큼 for문 돌려서
		for (int a = 0; a < allOkCoupon.size(); a++) {
			// 만약에 쿠폰의 타입이 d 일 경우에는
			if (allOkCoupon.get(a).getDis_type().equals("d")) {
				// 그리고 만약에 결제 가격의 합이 기존 할인가가 포함된 결제 값과 같다면
				if (totalPrice == totalPriceWithDiscount) {
					// 총 상품의 합의 값을 가져와서 할인율을 적용
					allOkCouponDiscountPrice = (int) Math.round(totalPrice * (allOkCoupon.get(a).getDiscount() / 100));
				}
				// 만약에 할인가가 포함된 결제 값이 가격의 기존 합의 가격보다 작다면
				else if (totalPrice > totalPriceWithDiscount) {
					// 할인가가 포함된 결제 값의 가격을 가져와서 할인가 적용
					allOkCouponDiscountPrice = (int) Math
							.round(totalPriceWithDiscount * (allOkCoupon.get(a).getDiscount() / 100));
				}
			}
			// 만약에 할인의 type이 p일 경우
			else if (allOkCoupon.get(a).getDis_type().equals("p")) {
				// 그리고 만약에 결제 가격의 합이 기존 할인가가 포함된 결제 값과 같다면
				if (totalPrice == totalPriceWithDiscount) {
					// 해당의 할인 가격을 변수에 저장
					allOkCouponDiscountPrice = allOkCoupon.get(a).getDis_price();
				}
				// 만약에 할인가가 포함된 결제 값이 가격의 기존 합의 가격보다 작다면
				else if (totalPrice > totalPriceWithDiscount) {
					// 해당의 할인 가격을 변수에 저장
					allOkCouponDiscountPrice = allOkCoupon.get(a).getDis_price();
				}
			}
			// 이렇게
			allOkCouponDiscount.add(allOkCouponDiscountPrice);
		}

		// 모두 적용 가능한 쿠폰의 할인 값과 할인가를 쿠폰의 순서대로 저장함
		// allOkCoupon 의 순서대로 같이 출력하면 된다
		model.addAttribute("allOkCouponDiscount", allOkCouponDiscount);
		// [특정 상품에만 적용 가능 쿠폰] mcno데이터가 담긴 mccOkSet을 List로 변환
		List<Integer> mcnoProductList = new ArrayList<>(mcnoProductOkSet);
		// [특정 상품에만 적용 가능 쿠폰] DTO를 담을 ArrayList 만들기
		ArrayList<MyCouponCouponDTO> productOkCoupon = new ArrayList<>();
		// 마이쿠폰에 있는 모든 쿠폰 가져와서 확인
		for (int m = 0; m < myCouponArr.size(); m++) {
			// [특정 상품에만 적용가능한 쿠폰] mcnoProductList 데이터의 갯수 만큼 for문 실행하면서
			for (int n = 0; n < mcnoProductList.size(); n++) {
				// 만약에 mcnoProductList의 데이터가 마이쿠폰에서 가져온 mcno 데이터와 같으면
				if (mcnoProductList.get(n) == myCouponArr.get(m).getMcno()) {
					// productOkCouponDTO에 출력할 쿠폰 추가
					productOkCoupon.add(myCouponArr.get(m));
				}
			}
		}
		// 특정 상품에만 적용되는 쿠폰
		model.addAttribute("productOkCoupon", productOkCoupon);
		// 쿠폰별로 적용 가능한 상품의 가격의 합을 순서대로 저장할 Arr
		ArrayList<Integer> pnoAppTotalPriceArr = new ArrayList<>();
		// 옵션이 있을 경우 상품 가격의 합을 저장할 변수
		int pnoAppOpriceTotal = 0;
		int pnoAppPpriceTotal = 0;

		// 코펀에 적용될 상품이 쿠폰 순서대로 저장된 상품 번호 ARR
		for (int g = 0; g < pnoAppArr.size(); g++) {
			// 비교를 하기 위해서 ARR를 리스트로 만들어주고
			List<String> pnoAppList = Arrays.asList(pnoAppArr.get(g));
			// 2차원 배열이기 때문에 상품번호가 담긴 리스트를 String 으로 바꿔준다
			String pnoAppListStr = pnoAppList.toString();
			// 내 장바구니에 담긴 상품의 수 만큼 가져와서
			for (int b = 0; b < basketArr.size(); b++) {
				// 장바구니에 담긴 상품의 상품번호와 위에서 String으로 변환해준 숫자를 비교해 같으면 할인 계산 진행
				if (pnoAppListStr.contains(Integer.toString(basketArr.get(b).getPno()))) {
					// 상품에 옵션이 있으면
					if (basketArr.get(b).getPono() > 0) {
						// 총 상품의 합 저장
						pnoAppOpriceTotal += basketArr.get(b).getOprice();
					}
					// 상품에 옵션이 없으면
					else {
						// 총 상품의 합 저장
						pnoAppPpriceTotal += basketArr.get(b).getPprice();
					}
				}
			}
			// 상품별로 옵션이 있을수도 있고 없을수도 있기 떄문에 모두 값을 더해줘서 변수에 저장
			int pnoAppPriceTotal = pnoAppPpriceTotal + pnoAppOpriceTotal;
			// 더해준 값을 배열에 저장하고
			pnoAppTotalPriceArr.add(pnoAppPriceTotal);
			// 다음 배열에 저장할 값을 위해 값 변수들 초기화
			pnoAppOpriceTotal = 0;
			pnoAppPpriceTotal = 0;
			pnoAppPriceTotal = 0;
		}

		// 쿠폰별로 할인율이 적용된 값을 저장할 Arr
		ArrayList<Integer> pnoAppDiscountPriceArr = new ArrayList<>();
		// 할인율이 적용된 값을 저장할 변수
		int pnoAppDiscountPrice = 0;
		// 특정 상품에 적용되는 쿠폰의 수 만큼 값을 계산해서 최종 할인 값 계산하기
		for (int e = 0; e < productOkCoupon.size(); e++) {
			// 대부분 특정 상품에 적용되는 할인쿠폰은 %로 할인을 적용 하지만 만약의 상황을 대비해서 if 문 사용해서 type=d 일때만 진행
			if (productOkCoupon.get(e).getDis_type().equals("d")) {
				// 순서대로 쿠폰 별로 적용이 되는 상품의 가격의 합이 저장되어 있는 Arr의 값을 하나씩 가져와서 할인율을 계산
				pnoAppDiscountPrice = (int) Math
						.round(pnoAppTotalPriceArr.get(e) * (productOkCoupon.get(e).getDiscount() / 100));
			}
			pnoAppDiscountPriceArr.add(pnoAppDiscountPrice);
		}

		// 특정 상품에만 해당하는 쿠폰의 할인 값 쿠폰 순서대로 저장됨
		// productOkCoupon 순서대로 풀력하면 됨
		model.addAttribute("pnoAppDiscountPriceArr", pnoAppDiscountPriceArr);

		// [적용불가능한 쿠폰] mcno데이터가 담긴 mccOkSet을 List로 변환
		List<Integer> mcnoNaList = new ArrayList<>(mccSetNA);
		// [적용 불가능한 쿠폰] DTO를 담을 ArrayList 만들기
		ArrayList<MyCouponCouponDTO> naCoupon = new ArrayList<>();
		// 마이쿠폰에 있는 모든 쿠폰 가져와서 확인
		for (int o = 0; o < myCouponArr.size(); o++) {
			// [모두 적용 가능 쿠폰] mcnoList 데이터의 갯수 만큼 for문 실행하면서
			for (int p = 0; p < mcnoNaList.size(); p++) {
				// 만약에 mcnoList의 데이터가 마이쿠폰에서 가져온 mccArr의 mcno 데이터와 같으면
				if (mcnoNaList.get(p) == myCouponArr.get(o).getMcno()) {
					naCoupon.add(myCouponArr.get(o));
				}
			}
		}
		// 사용 불가능한 쿠폰 보내주기
		model.addAttribute("naCoupon", naCoupon);

		// 사용 가능한 쿠폰 갯수 구하기
		int couponOkCnt = (allOkCoupon.size()) + (productOkCoupon.size());
		// 총 나의 쿠폰 갯수 구하기
		int myCouponCnt = myCouponArr.size();
		model.addAttribute("couponOkCnt", couponOkCnt);
		model.addAttribute("myCouponCnt", myCouponCnt);

		// 적립금 가져오기
		SavingDTO sdto = savingMapper.getCredit(mno);
		model.addAttribute("sdto", sdto);

		// 카드 5만원 이하 가져오기
		String typec = "c";
		ArrayList<CategoryDTO> ltFiveCards = categoryMapper.getCards(typec);
		model.addAttribute("ltFiveCards", ltFiveCards);

		// 카드5 5만원 이상 가져오기
		String typed = "d";
		ArrayList<CategoryDTO> mtFiveCards = categoryMapper.getCards(typed);
		model.addAttribute("mtFiveCards", mtFiveCards);

		return "/front/shop/order/order";
	}

	@RequestMapping("/order/addrUpdate")
	public String addrUpdate(Model model, HttpSession session) {
		if (member.isLogin(session) == false)
			return "redirect:/login";
		String mno = session.getAttribute("mno").toString();
		// 기본 배송지 가져오기
		DeliveryDTO ddto = deliveryMapper.getDefault(mno);
		model.addAttribute("ddto", ddto);
		model.addAttribute("url", "/shop/order/btnUpdateSubAddress");
		return "front/shop/order/addrUpdate";
	}

	@RequestMapping("/order/addrUpdate/ok")
	public String addrUpdateok(Model model, HttpServletRequest request, HttpSession session) {
		String mno = session.getAttribute("mno").toString();
		String receive_name = request.getParameter("receive_name") != null ? request.getParameter("receive_name") : ""; // 이름
																														// 가져오기
		String phone = request.getParameter("phone") != null ? request.getParameter("phone") : ""; // 전화번호 가져오기
		String pickUpType = request.getParameter("pickUpType") != null ? request.getParameter("pickUpType") : ""; // 받으실
																													// 장소
																													// 가져오기
		// 받으실 장소 분류

		String meansType = request.getParameter("meansType") != null ? request.getParameter("meansType") : ""; // 문앞 선택시
																												// 옵션
		// 문앞 선택시 분류

		String doorPin = request.getParameter("doorPinDoorstepDoor") != null
				? request.getParameter("doorPinDoorstepDoor")
				: ""; // 현관문 비밀번호 가져오기
		String doorMeans = request.getParameter("means") != null ? request.getParameter("means") : ""; // 기타선택시 내용 가져오기

		String pickUpDetailSec = request.getParameter("pickUpDetailSec") != null
				? request.getParameter("pickUpDetailSec")
				: ""; // 경비실 선택시
		String pickUpDetailPost = request.getParameter("pickUpDetailPost") != null
				? request.getParameter("pickUpDetailPost")
				: ""; // 택배함 택배함 정보
		String pickUpDetailOther = request.getParameter("pickUpDetailOther") != null
				? request.getParameter("pickUpDetailOther")
				: ""; // 기타장소 선택시

		// 택배함 선택시
		String meansTypePost = request.getParameter("meansTypePost") != null ? request.getParameter("meansTypePost")
				: "";

		String doorPinPost = request.getParameter("doorPinDoorstepPost") != null
				? request.getParameter("doorPinDoorstepPost")
				: ""; // 비밀번호
		String meansPost = request.getParameter("meansPost") != null ? request.getParameter("meansPost") : ""; // 내용

		// 배송메시지
		String deliveryMsg = request.getParameter("deliveryMessageSendAt") != null
				? request.getParameter("deliveryMessageSendAt")
				: "";
		if (deliveryMsg.equals("1")) {
			deliveryMsg = "배송직후";
		}
		if (deliveryMsg.equals("2")) {
			deliveryMsg = "오전 7시";
		}

		String pickUpTypeContent = null;
		String pickUpTypeDetail = null;
		String pickUpTypeView = null;
		if (pickUpType.equals("1")) {
			pickUpType = "문앞";
			if (meansType.equals("1")) {
				meansType = "공동현관비밀번호";
				pickUpTypeContent = meansType;
				pickUpTypeDetail = doorPin;
				model.addAttribute("pickUpTypeView", pickUpTypeContent);
			}
			if (meansType.equals("2")) {
				meansType = "자유출입가능";
				pickUpTypeContent = meansType;
				pickUpTypeDetail = "NA";
				model.addAttribute("pickUpTypeView", pickUpTypeContent);
			}
			if (meansType.equals("3")) {
				meansType = "기타";
				pickUpTypeContent = meansType;
				pickUpTypeDetail = doorMeans;
				pickUpTypeView = pickUpTypeContent + "(" + pickUpTypeDetail + ")";
				model.addAttribute("pickUpTypeView", pickUpTypeView);
			}
		}

		if (pickUpType.equals("2")) {
			pickUpType = "경비실";
			pickUpTypeContent = "";
			pickUpTypeDetail = pickUpDetailSec;
			model.addAttribute("pickUpTypeView", pickUpDetailSec);
		}
		if (pickUpType.equals("3")) {
			pickUpType = "택배함";
			if (meansTypePost.equals("1")) {
				meansTypePost = "공동현관비밀번호";
				pickUpTypeContent = meansTypePost + "," + " 택배함 : " + pickUpDetailPost;
				pickUpTypeDetail = doorPinPost;
				model.addAttribute("pickUpTypeView", meansTypePost);
			}
			if (meansTypePost.equals("2")) {
				meansTypePost = "자유출입가능";
				pickUpTypeContent = meansTypePost;
				pickUpTypeDetail = pickUpDetailPost;
				model.addAttribute("pickUpTypeView", meansTypePost);
			}
			if (meansTypePost.equals("3")) {
				meansTypePost = "기타";
				pickUpTypeContent = meansTypePost + "," + " 택배함 : " + pickUpDetailPost;
				pickUpTypeDetail = meansPost;
				pickUpTypeView = meansTypePost + "(" + pickUpTypeDetail + ")";
				model.addAttribute("pickUpTypeView", pickUpTypeView);
			}
		}
		if (pickUpType.equals("4")) {
			pickUpType = "기타장소";
			pickUpTypeContent = pickUpDetailOther;
			pickUpTypeDetail = pickUpDetailOther;
			model.addAttribute("pickUpTypeView", pickUpTypeDetail);
		}
		deliveryMapper.updateAddr(receive_name, phone, pickUpType, pickUpTypeContent, pickUpTypeDetail, deliveryMsg,
				mno);
		model.addAttribute("pickUpType", pickUpType);
		model.addAttribute("pickUpTypeContent", pickUpTypeContent);
		model.addAttribute("deliveryMsg", deliveryMsg);
		model.addAttribute("receive_name", receive_name);
		model.addAttribute("phone", phone);

		return "/front/shop/order/order";
	}

	@RequestMapping("/shop/order/ok")
	@Transactional(timeout = 10)
	public String orderOk(Model model, HttpServletRequest request, HttpSession session) {
		if (member.isLogin(session) == false)
			return "redirect:/login";
		String id = session.getAttribute("id").toString();
		String mno = session.getAttribute("mno").toString();

		MemberDTO mdto = memberMapper.getOne(id);
		GradeMemberDTO gDTO = gradeMapper.getOne(id);

		String[] bnos = request.getParameterValues("bno");
		String jbno = "'" + String.join("','", bnos) + "'";

		// 주문한 장바구니의 내용을 가져와 주문목록 테이블에 삽입
		ArrayList<BasketProductProdctOptionFileDTO> basketArr = basketMapper.getBasketJoin(jbno, mno);
		int count = basketArr.size();
		
		// 시퀀스 조회 변수에 할당
		int ono = ordersMapper.getSeq();

		// 결제가 완료되면 주문 테이블 정보 입력
		ordersMapper.insertOrders(ono, mno, count);

		// 적립률 계산 이후 적립금 가져오기
		String creditEarned = request.getParameter("calc_earn") != null ? request.getParameter("calc_earn") : "";

		// 주문이 완료되면 결제 테이블에 정보 삽입
		String type = request.getParameter("settlekind") != null ? request.getParameter("settlekind") : ""; // 결제 방법
																											// 가져오기
		if (type.equals("card")) {
			type = "c";
		}
		if (type.equals("chai")) {
			type = "h";
		}
		if (type.equals("toss")) {
			type = "t";
		}
		if (type.equals("naver")) {
			type = "n";
		}
		if (type.equals("payco")) {
			type = "o";
		}
		if (type.equals("smile")) {
			type = "s";
		}
		if (type.equals("phone")) {
			type = "p";
		}
		String payment = request.getParameter("payment"); // 최종 결제금액 가져오기
		String creditUsed = request.getParameter("saving"); // 사용한 적립금 가져오기
		if (payment == null) {
			payment = "0";
		}
		if (creditUsed == null) {
			creditUsed = "0";
		}
		String productTotalPrice = request.getParameter("product_total_price") != null
				? request.getParameter("product_total_price")
				: ""; // 상품금액 가져오기
		String deliveryPrice = request.getParameter("delivery_price") != null ? request.getParameter("delivery_price")
				: ""; // 배송비 가져오기
		String productDisPrice = request.getParameter("product_dis_price") != null
				? request.getParameter("product_dis_price")
				: ""; // 상품할인금액 가져오기
		String couponDisPrice = request.getParameter("coupon_dis_price") != null
				? request.getParameter("coupon_dis_price")
				: ""; // 쿠폰할인금액 가져오기
		String cardName = request.getParameter("cardName") != null ? request.getParameter("cardName") : ""; // 카드이름 가져오기
		String cardMonth = request.getParameter("month") != null ? request.getParameter("month") : ""; // 할부기간 가져오기

//		savingMapper.creditSub(creditUsed, mno);
		savingListMapper.insertCreditUsed(mno, creditUsed);
		// 결제 테이블에 내용 삽입
		paymentMapper.insertPayment(mno, ono, type, payment, creditUsed, productTotalPrice, deliveryPrice,
				productDisPrice, couponDisPrice, creditEarned, cardName, cardMonth);

		for (int i = 0; i < basketArr.size(); i++) {
			// 만약에 상품의 옵션이 없다면 pno 번호를 가져와 정보 입력 * 삭제
			if (basketArr.get(i).getPono() == 0) {
				int pno = basketArr.get(i).getPno();
				int quantity = basketArr.get(i).getQuantity();

				// 주문 목록에 정보 삽입
				orderListMapper.insertProductOrderList(mno, ono, pno, quantity);
				// 장바구니에서 결제한 상품들 지워주기
				basketMapper.deleteProductOrders(pno, mno);
			}
			// 만약에 상품의 옵션이 있다면 pono 번호를 가져와 정보 입력 * 삭제
			else if (basketArr.get(i).getPono() > 0) {
				int pno = basketArr.get(i).getPno();
				int pono = basketArr.get(i).getPono();
				int quantity = basketArr.get(i).getQuantity();
				// 주문 목록에 정보 삽입
				orderListMapper.insertOptionOrderList(mno, ono, pno, pono, quantity);
				// 장바구니에서 결제한 상품들 지워주기
				basketMapper.deleteOptionOrders(pono, mno);
			}
		}
		
		// 사용한 적립금 나의 적립금 테이블에서 빼주기
		String creditExpUsed = creditUsed;
//		savingMapper.creditSub(creditUsed,creditExpUsed,mno);
		// 선택된 쿠폰번호 마이쿠폰에서 지워주기
		System.out.println("creditExpUsed = " + creditExpUsed);
		System.out.println("creditUsed = " + creditUsed);
		String mcno = request.getParameter("mcnoSelected") != null ? request.getParameter("mcnoSelected") : "";
		myCouponMapper.deleteSelectedCoupon(mno, mcno);

		// 페이지로 넘어갈 값 보내주기
		model.addAttribute("name", mdto.getName());
		model.addAttribute("payment", payment);
		model.addAttribute("creditEarned", creditEarned);
		model.addAttribute("gDTO", gDTO);
		model.addAttribute("url", "/shop/end");
		model.addAttribute("bnos", bnos);

		return "/front/shop/order/end";
	}

	@RequestMapping("/shop/order/end")
	public String end(Model model, HttpSession session,HttpServletRequest request) {
		if (member.isLogin(session) == false)
			return "redirect:/login";
		int mno = Integer.parseInt(request.getAttribute("mno").toString());
		String bno = request.getParameter("bnos");
		String[] bnos =  bno.split(",");
		for(String b:bnos) {
			basketMapper.deleteBasket(mno, Integer.parseInt(b));
		}
		model.addAttribute("url", "/shop/end");
		return "/front/shop/order/end";
	}

	@RequestMapping("/shop/order/test_one")
	public String test_one() {

		return "/front/shop/order/test_one";
	}

	@RequestMapping("/shop/order/test_two")
	public void test_two(HttpServletRequest request, PrintWriter out, HttpSession session) {
		String mno = session.getAttribute("mno").toString();
//		String[] bnos = request.getParameterValues("bno");
//		String jbno = "'" + String.join("','", bnos) + "'";
//		ArrayList<BasketProductProdctOptionFileDTO> basketArr = basketMapper.getBasketJoin(jbno,mno);
//		out.print(basketArr.toString());
//		out.print("\n");
//		out.print("jbno = "+jbno);
		out.print("\n");
		out.print("mno = " + mno);
	}
}
