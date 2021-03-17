<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!-- 제목 -->
<div id="header">
	<div class="tit_page">
		<h2 class="tit">주문서</h2>
	</div>
</div>

<!-- 메인 부분 -->
<div id="main">
	<div id="content">
		<div class="user_form">
			<!-- 상품 출력 부분 -->
			<h2 class="tit_section fst">
				주문상품
				<div id="upDown" class="upDown">
					<img
						src="https://res.kurly.com/pc/service/cart/2007/ico_dropup.svg">
				</div>
			</h2>
			<div id="itemList" class="page_aticle order_goodslist">
				<!-- 간략한 구매 상품 정보 -->
				<c:if test="${fn:length(basketArr) eq 1}">
				<c:forEach items="${basketArr}" var="dto">
				<div class="info_product">
					<c:if test="${dto.pono gt 0}">
					<div class="short_info">${dto.brand}${dto.oname} 상품을 주문합니다.</div>
					</c:if>
					<c:if test="${dto.pono eq 0}">
					<div class="short_info">${dto.brand}${dto.pname} 상품을 주문합니다.</div>
					</c:if>
				</div>
				</c:forEach>
				</c:if>
				
				<c:if test="${fn:length(basketArr) gt 1}">
				<c:forEach items="${basketArr}" var="dto" begin="0" end="0">
				<div class="info_product">
					<c:if test="${dto.pono gt 0}">
					<div class="short_info">
					${dto.brand}${dto.oname}외 
					<span class="num">${fn:length(basketArr)-1}개</span>의 상품을 주문합니다.</div>
					</c:if>
					<c:if test="${dto.pono eq 0}">
					<div class="short_info">
					${dto.brand}${dto.pname}외 
					<span class="num">${fn:length(basketArr)-1}개</span>의 상품을 주문합니다.</div>
					</c:if>
				</div>
				</c:forEach>
				</c:if>
				<!-- 자세한 구매 상품 정보 -->
				<c:forEach items="${basketArr}" var="dto">
				<ul class="list_product">
					<li>
						<div class="thumb">
							<img src="${dto.loc}${dto.fname }" alt="상품이미지">
						</div>
						<div class="name">
							<div class="inner_name">
								<!-- 옵션 상품이 없다면 -->
								<c:if test="${dto.pono eq 0}">
								${dto.brand}${dto.pname}
								</c:if>
								<!-- 옵션 상품이 있다면 -->
								<c:if test="${dto.pono gt 0}">
								${dto.oname}
								<strong class="package">${dto.brand}${dto.pname}</strong>
								</c:if>
							</div>
						</div>
						<!-- 장바구니 수량 -->
						<div class="ea">${dto.quantity}개</div>
						<div class="info_price">
							<!-- 할인이 없을때 -->
							<c:if test="${dto.discount eq 0}">
								<!-- 옵션이 없을때 -->
								<c:if test="${dto.pono eq 0}">
								<span class="num"> <span class="price"><fmt:formatNumber value="${dto.pprice*dto.quantity}" pattern="#,###"/>원</span>
								</c:if>
								<!-- 옵션이 있을때 -->
								<c:if test="${dto.pono gt 0}">
								<span class="num"> <span class="price"><fmt:formatNumber value="${dto.oprice*dto.quantity}" pattern="#,###"/>원</span>
								</c:if>
							</c:if>
							
							<!-- 할인이 있을때 -->
							<c:if test="${dto.discount gt 1}">
								<!-- 옵션이 없을때 -->
								<c:if test="${dto.pono eq 0}">
								<span class="num"> <span class="price"><fmt:formatNumber value="${(dto.pprice - (dto.pprice*(dto.discount/100)))*dto.quantity}" pattern="#,###"/>원</span>
								<span class="cost"><fmt:formatNumber value="${dto.pprice*dto.quantity}" pattern="#,###"/>원</span></span>
								</c:if>
								<!-- 옵션이 있을때 -->
								<c:if test="${dto.pono gt 0}">
								<span class="num"> <span class="price"><fmt:formatNumber value="${(dto.oprice - (dto.oprice*(dto.discount/100)))*dto.quantity}" pattern="#,###"/>원</span>
								<span class="cost"><fmt:formatNumber value="${dto.oprice*dto.quantity}" pattern="#,###"/>원</span></span>
								</c:if>
							</c:if>
						</div>
					</li>
				</ul>
				</c:forEach>
			</div>
			
			<form id="form" name="frmOrder" action="/shop/order/ok" method="post" class="order_view" onsubmit="return validate()">
				<c:forEach items="${basketArr }" var="basketDTO">
				<input type="hidden" name="bno" value="${basketDTO.bno}">
				</c:forEach>
				<input type="hidden" id="mcnoHidden" name="mcnoSelected" value="0">
				<h2 class="tit_section" id="titFocusOrderer">주문자 정보</h2>
				<div class="order_section data_orderer">
					<table class="goodsinfo_table ">
						<tr class="fst">
							<th>보내는 분</th>
							<td>${mdto.name }</td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td>${mdto.phone }</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${mdto.email }
								<p class="txt_guide">
									<span class="txt txt_case1">이메일을 통해 주문처리과정을 보내드립니다. </br>
									</bt></span> <span class="txt txt_case2">정보 변경은 <span
										class="txt_desc">마이컬리 &gt; 개인정보 수정</span> 메뉴에서 가능합니다.
									</span>
								</p>
							</td>
						</tr>
					</table>
				</div>
				<h2 class="tit_section" id="divAddressWrapper">
					배송 정보 <span class="desc">배송 휴무일: 샛별배송(휴무없음), 택배배송(일요일)</span>
					<div id="btnLayerInfo" class="desc">
						<span>배송지 변경 안내</span> <img
							src="https://res.kurly.com/pc/service/order/2011/ico_question.svg?v=1">
					</div>
					<div class="address_info">
						<div class="layer_info" id="layerInfo">
							<strong class="emph">장바구니, 홈</strong>에서 <br> 배송지를 변경할 수 있어요.
							<div id="addrMsgClose">X</div>
						</div>
					</div>
				</h2>
				<div class="order_section order_address" id="dataDelivery">
					<h3 href="#none" class="section_crux">배송지</h3>
					<div class="section_full">
						<span class="address" id="divDestination"> <span
							class="default on" id="addrDefault" data-text="기본배송지">기본배송지</span>
							<span class="addr" id="addrInfo">${ddto.addr } ${ddto.addr_detail }</span>
							<c:if test="${ddto.type eq 't' }">
							<span class="tag" id="addrTags"> <span class="badge star" id="addrBadge">택배배송</span>
							</c:if>
							<c:if test="${ddto.type eq 's' }">
							<span class="tag" id="addrTags"> <span class="badge star" id="addrBadge">샛별배송</span>
							</c:if>
						</span>
						</span>
					</div>
				</div>
				<div class="order_section order_reception" id="divReception">
					<h3 class="section_crux">상세 정보</h3>
					<div class="section_full">

						<div class="receiving" id="receiverInfo">
							${ddto.receive_name },${ddto.phone}
						</div>
						<c:if test="${ddto.pickuptype eq null}">
						<div class="way" id="wayPlace">
							<span class="place" id="areaInfo"></span>
							<span class="txt" id="meanType">받으실 장소를 입력해 주세요</span>
							<div class="message" id="deliveryMessage">
								<span class="place" id="deliveryMessageTitle"></span> 
								<span class="txt" id="deliveryMessageDetail"></span>
							</div>
						</div>
						<button type="button" id="btnUpdateSubAddress" data-address-no="" class="btn default" onclick="centeredPopup()">수정
						</button>
						</c:if>
						<c:if test="${ddto.pickuptype ne null}">
						<div class="way" id="wayPlace">
							<span class="place" id="areaInfo">${ddto.pickuptype}</span>
							<span class="txt" id="meanType">${ddto.pickuptype_content}</span>
							<div class="message" id="deliveryMessage">
								<span class="place" id="deliveryMessageTitle">배송완료 메시지</span> 
								<span class="txt" id="deliveryMessageDetail">${ddto.delivery_msg}</span>
							</div>
						</div>
						<button type="button" id="btnUpdateSubAddress" data-address-no="" class="btn default" onclick="centeredPopup()">수정
						</button>
						</c:if>
						

					</div>
				</div>
				<div id="bnrOrder" class="bnr_order" style="display: block;">
					<a href="#layerShow" class="btn_layershow"> <img
						src="https://res.kurly.com/pc/service/order/2012/bnr_allpaper.png"
						alt="All Paper Challenge">
					</a>
					<p class="screen_out">사람에게도 환경에도 더 이로운 배송 친환경 포장재 자세히 보기</p>
				</div>
				
				<!-- 주문 요약창 -->
				<div class="tax_absolute">
					<div class="inner_sticky" id="sticky" style="top: 0px;">
						<h2 class="tit_section">결제금액</h2>
						<div id="orderitem_money_info">
							<dl class="amount fst">
								<dt class="tit">주문금액</dt>
								<dd class="price">
									<!-- 총 가격과 할인이 상품에 적용된 가격이 동일할 경우 할인이 없으므로 총 합한 가격 출력 -->
									<c:if test="${totalPrice eq totalPriceWithDiscount}">
									<span id="productsTotalPrice"><fmt:formatNumber value="${totalPrice }" pattern="#,###"/>원</span>
									</c:if>
									<!-- 총 가격과 할인이 상품에 적용된 가격을 비교했을때 총 가격이 높을 경우 할인이 있으므로 할인이 적용된 합의 가격 출력-->
									<c:if test="${totalPrice gt totalPriceWithDiscount}">
									<span id="productsTotalPrice"><fmt:formatNumber value="${totalPriceWithDiscount }" pattern="#,###"/>원</span>
									</c:if>
								</dd>
							</dl>
							<dl class="amount sub">
								<dt class="tit">상품금액</dt>
								<dd class="price">
									<span id="paper_goodsprice"><fmt:formatNumber value="${totalPrice }" pattern="#,###"/></span> 원
									<input type="hidden" name="product_total_price" value="${totalPrice }">
								</dd>
							</dl>
							<dl class="amount sub">
								<dt class="tit">상품할인금액</dt>
								<dd class="price sales_area">
									<span class="pm_sign normal" style="display: inline;">-</span>
									<span id="special_discount_amount" class="normal"><fmt:formatNumber value="${totalDiscount }" pattern="#,###"/></span>
									<input type="hidden" name="product_dis_price" value="${totalDiscount }">
									원
								</dd>
								<dd id="paper_sale" class="screen_out">11700</dd>
							</dl>
							<dl class="amount">
								<dt class="tit">배송비</dt>
								<dd class="price delivery_area">
									<c:if test="${totalPrice ge 40000}">
									<div id="paper_delivery_msg1" style="display: block;">
										<span id="paper_delivery" class="">0</span>원
										<input type="hidden" name="delivery_price" value="0">
									</div>
									</c:if>
									<c:if test="${totalPrice lt 40000}">
									<div id="paper_delivery_msg1" style="display: block;">
										<span class="pm_sign" style="display: inline;">+</span>
										<span id="paper_delivery" class="">3,000</span>
										<span id="paper_delivery2" style="display: none">0</span> 원
										<input type="hidden" name="delivery_price" value="3000">
									</div>
									</c:if>
								</dd>
							</dl>
							<dl class="amount">
								<dt class="tit">쿠폰할인금액</dt>
								<dd class="price coupon_area">
									<span class="pm_sign" style="display: none;">-</span>
									<span id="apr_coupon_data">0</span> 원 
									<input type="hidden" name="coupon_dis_price" id="coupon_hidden" value="0">
								</dd>
							</dl>
							<dl class="amount">
								<dt class="tit">적립금사용</dt>
								<dd class="price">
									<span class="num pay_sum" id="paper_reserves">0 </span>원
									<input type="hidden" id="credit_hidden" size="12" value="0">
								</dd>
							</dl>
							<dl class="amount lst">
								<dt class="tit">최종결제금액</dt>
								<dd class="price">
									<c:if test="${totalPrice eq totalPriceWithDiscount && totalPrice lt 40000 }">
									<span id="paper_settlement"><fmt:formatNumber value="${totalPrice + 3000}" pattern="#,###"/></span> <span class="won">원</span>
									<input type="hidden" id="paper_settlement_hidden" value="${totalPrice + 3000 }">
									<input type="hidden" id="totalFinal" name="payment" value="${totalPrice + 3000 }">
									</c:if>
									<c:if test="${totalPrice gt totalPriceWithDiscount && totalPriceWithDiscount lt 40000 }">
									<span id="paper_settlement"><fmt:formatNumber value="${totalPriceWithDiscount + 3000}" pattern="#,###"/></span> <span class="won">원</span>
									<input type="hidden" id="paper_settlement_hidden" value="${totalPriceWithDiscount + 3000 }">
									<input type="hidden" id="totalFinal" name="payment" value="${totalPriceWithDiscount + 3000 }">
									</c:if>
									<c:if test="${totalPrice eq totalPriceWithDiscount && totalPrice gt 40000 }">
									<span id="paper_settlement"><fmt:formatNumber value="${totalPrice}" pattern="#,###"/></span> <span class="won">원</span>
									<input type="hidden" id="paper_settlement_hidden" value="${totalPrice }">
									<input type="hidden" id="totalFinal" name="payment" value="${totalPrice }">
									</c:if>
									<c:if test="${totalPrice gt totalPriceWithDiscount && totalPriceWithDiscount gt 40000 }">
									<span id="paper_settlement"><fmt:formatNumber value="${totalPriceWithDiscount}" pattern="#,###"/></span> <span class="won">원</span>
									<input type="hidden" id="paper_settlement_hidden" value="${totalPriceWithDiscount }">
									<input type="hidden" id="totalFinal" name="payment" value="${totalPriceWithDiscount }">
									</c:if>
								</dd>
							</dl>
							<p class="reserve" style="display: block;">
								<span class="ico">적립</span>
								구매 시 <span class="emph">
								<span id="expectAmount"><fmt:formatNumber value="${calcEarn }" pattern="##,###"/></span> 원 ( <span class="ratio">${mDTOEarn.earn }</span> %) 적립</span>
								<input type="hidden" id="calcEarn" name="calc_earn" value="${calcEarn }">
							</p>
						</div>
					</div>
				</div>
				
				
				<div class="data_payment">
					<div class="tbl_left">
						<h2 class="tit_section">쿠폰 / 적립금</h2>
						<table class="goodsinfo_table">
							<tr>
								<th>쿠폰 적용</th>
								<td>
									<div id="view_popselbox" class="view_popselbox">
										<!-- 쿠폰이 없을때 -->
										<c:if test="${myCouponCnt eq 0}">
										<div id="popselboxView" class="select_box off">
											사용 가능 쿠폰
											<span id="useCoupon">0</span> 개 / 전체
											<span id="haveCoupon">0</span> 개
										</div>
										</c:if>
										
										<!-- 쿠폰이 있을때 -->
										<c:if test="${myCouponCnt ge 1}">
										<div id="popselboxView" class="select_box">
											사용 가능 쿠폰 
											<span id="useCoupon">${couponOkCnt }</span> 개 / 전체
											<span id="haveCoupon">${myCouponCnt }</span>개
											(중복적용 불가)
										</div>
										<!-- 사용가능 쿠폰 적용시 펼침 -->
										<div id="popSelbox" class="layer_coupon">
											<ul id="addpopSelList" class="list">
												<li class="fst">
													<div class="inner_item">
														<span class="txt_tit default">쿠폰 적용 안 함</span>
													</div>
												</li>
												<!-- 모두 적용 가능한 쿠폰 출력 -->
												<c:if test="${fn:length(allOkCoupon) gt 0 }">
												<c:forEach items="${allOkCoupon }" var="allOkCoupon">
												<li class="fst" >
													<div class="inner_item">
														<div class="item_row">
															<div class="item_td left">
																<span class="txt_apr coupon_na">사용가능</span>
																<c:if test="${allOkCoupon.dis_type eq 'd'}">
																<span class="txt_is_dc"><fmt:formatNumber value="${allOkCoupon.discount }" minFractionDigits="0" maxFractionDigits="0" />% 할인</span>
																</c:if>
																<c:if test="${allOkCoupon.dis_type eq 'p'}">
																<span class="txt_is_dc"><fmt:formatNumber value="${allOkCoupon.dis_price }" pattern="#,###"/>원 할인</span>
																</c:if>
															</div>
															<div class="item_td">
																<span class="txt_tit coupon_na">${allOkCoupon.content }</span>
																<span class="txt_expire coupon_na">유효기간 : ${allOkCoupon.end_expiry } 까지</span>
															</div>
														</div>
													</div>
												</li>
												</c:forEach>
												</c:if>
												
												<!-- 특정 상품에만 적용 가능한 쿠폰 출력 -->
												<c:if test="${fn:length(productOkCoupon) gt 0 }">
												<c:forEach items="${productOkCoupon }" var="productOkCoupon">
												<li class="fst" >
													<div class="inner_item">
														<div class="item_row">
															<div class="item_td left">
																<span class="txt_apr coupon_na">사용가능</span>
																<c:if test="${productOkCoupon.dis_type eq 'd'}">
																<span class="txt_is_dc"><fmt:formatNumber value="${productOkCoupon.discount }" minFractionDigits="0" maxFractionDigits="0" />% 할인</span>
																</c:if>
																<c:if test="${productOkCoupon.dis_type eq 'p'}">
																<span class="txt_is_dc"><fmt:formatNumber value="${productOkCoupon.dis_price }" pattern="#,###"/>원 할인</span>
																</c:if>
															</div>
															<div class="item_td">
																<span class="txt_tit coupon_na">${productOkCoupon.content }</span>
																<span class="txt_expire coupon_na">유효기간 : ${productOkCoupon.end_expiry } 까지</span>
															</div>
														</div>
													</div>
												</li>
												</c:forEach>
												</c:if>
												
												
												
												<!-- 사용 불가능한 쿠폰 출력 -->
												<c:if test="${fn:length(naCoupon) gt 0 }">
												<c:forEach items="${naCoupon }" var="naCoupon">
												<li class="fst" >
													<div class="inner_item">
														<div class="item_row">
															<div class="item_td left">
																<span class="txt_apr coupon_na">사용불가능</span>
																<c:if test="${naCoupon.dis_type eq 'd'}">
																<span class="txt_is_dc">${naCoupon.discount } % 할인</span>
																</c:if>
																<c:if test="${naCoupon.dis_type eq 'p'}">
																<span class="txt_is_dc">${naCoupon.dis_price } 원 할인</span>
																</c:if>
															</div>
															<div class="item_td">
																<span class="txt_tit coupon_na">${naCoupon.content }</span>
																<span class="txt_expire coupon_na">유효기간 : ${naCoupon.end_expiry } 까지</span>
															</div>
														</div>
													</div>
												</li>
												</c:forEach>
												</c:if>
												<input type="hidden" class="discountPrice" name="allDiscount" value="0">
												<c:if test="${fn:length(allOkCouponDiscount) gt 0 }">
												<c:forEach items="${allOkCouponDiscount }" var="allOkCouponDiscount">
													<input type="hidden" class="discountPrice" name="allDiscount" value="${allOkCouponDiscount }">
												</c:forEach>
												</c:if>
												<c:if test="${fn:length(pnoAppDiscountPriceArr) gt 0 }">
												<c:forEach items="${pnoAppDiscountPriceArr }" var="pnoAppDiscountPriceArr">
												<input type="hidden" class="discountPrice" name="productDiscount" value="${pnoAppDiscountPriceArr }">
												</c:forEach>
												</c:if>
												<c:forEach begin="1" end="${fn:length(naCoupon)}">
												<input type="hidden" class="discountPrice" name="productDiscount" value="0">
												</c:forEach>
												<input type="hidden" class="getMcno" value="0">
												<c:if test="${fn:length(allOkCoupon) gt 0 }">
												<c:forEach items="${allOkCoupon }" var="allOkCoupon">
												<input type="hidden" class="getMcno" value="${allOkCoupon.mcno }">
												</c:forEach>
												</c:if>
												<c:if test="${fn:length(productOkCoupon) gt 0 }">
												<c:forEach items="${productOkCoupon }" var="productOkCoupon">
												<input type="hidden" class="getMcno" value="${productOkCoupon.mcno }">
												</c:forEach>
												</c:if>
											</ul>
										</div>
										</c:if>
									</div>
									<p class="txt_inquiry">
										<a href="https://accounts.kakao.com/login?continue=https%3A%2F%2Fbizmessage.kakao.com%2Fchat%2F9rqXqh1Em2nHAlJZgAVJYAf8qH_smEtv_c_acLTkgmU%3Frf%3Dhttps%3A%2F%2Fapi.happytalk.io%2F" class="link" id="happyTalk">쿠폰사용문의(카카오톡)</a>
									</p>
								</td>
							</tr>
							<tr class="emoney_use ">
								<th class="no_emoney">적립금 적용</th>
								<td>
									<div id="ondealCheck">
										<div class="emoney_reg">
											
											<c:if test="${sdto.credit lt 1000 && sdto.credit ge 1 }">
											<input type="text" name="saving" id="emoney" class="number_only" placeholder="적립금은 1,000원 이상부터 사용 가능합니다." disabled>
											</c:if>
											<c:if test="${sdto.credit gt 1000 }">
											<input type="text" name="saving" id="emoney" class="number_only"  value="0">
											</c:if>
										</div>
										<c:if test="${sdto.credit lt 1000 && sdto.credit ge 1}">
										<p class="possess">보유 적립금 : <strong class="emph"><fmt:formatNumber value="${sdto.credit }" pattern="#,###"/></strong>원
										<input type="hidden" id="emoney_hidden" name="emoney_max" value="${sdto.credit }">
										</p>
										</c:if>
										<c:if test="${sdto.credit gt 1000 }">
										<p class="possess">보유 적립금 : <strong class="emph"><fmt:formatNumber value="${sdto.credit }" pattern="#,###"/></strong>원
										<input type="hidden" id="emoney_hidden" name="emoney_max" value="${sdto.credit }">
										</p>
										</c:if>
										<c:if test="${sdto.credit eq 0 }">
										<p class="possess">사용 가능한 적립금이 없습니다.
										<input type="hidden" id="emoney_hidden" name="emoney_max" value="0">
										</p>
										</c:if>
										<ul class="list_notice">
										<li>· 보유 적립금 1천원 이상부터 사용가능</li>
										<li>· 적립금 내역: 마이컬리 &gt; 적립금</li>
										</ul>
									</div>
								</td>
								
							</tr>
						</table>
					</div>
				</div>
				
				<div class="data_method">
					<h2 class="tit_section" id="titFocusMethod">결제수단</h2>
					<table class="goodsinfo_table tbl_left">
						<tr>
							<th>일반결제</th>
							<td class="noline" style="position: relative">
								<label class="label_radio" id="settlekindCard" style="padding-bottom: 4px;" >
									<input type="radio" name="settlekind" value="card" checked>
									<span class="checkmark"></span>
									신용카드
								</label>
							</td>
						</tr>
						<tr class="card_detail">
							<th></th>
							<td>
								<div id="cardSelect">
									<div>
										<div class="card_select">
											<!-- 5만원 이하일때 -->
											<c:if test="${totalPrice-totalDiscount lt 50000 }">
											<div class="select_box">
												<select id="cardsSelector" name="cardName" class="list" onchange="cardMonthChange(this);">
													<option value="미선택">카드를 선택해주세요</option>
													<c:forEach items="${ltFiveCards }" var="ltFiveCards">
													<option value="${ltFiveCards.name }">${ltFiveCards.name }</option>
													</c:forEach>
												</select>
											</div>
											<div class="select_box">
												<select id="months" name="month" class="list">
													<option value="">할부기간을 선택해주세요</option>
												</select>
											</div>
											</c:if>
											
											<!-- 5만원 이상일때 -->
											<c:if test="${totalPrice-totalDiscount gt 50000 }">
											<div class="select_box">
												<select id="cardsSelector" name="cardName" class="list" onchange="cardMonthChange(this);">
													<option value="">카드를 선택해주세요</option>
													<c:forEach items="${mtFiveCards }" var="mtFiveCards">
													<option value="${mtFiveCards.name}">${mtFiveCards.name }</option>
													</c:forEach>
												</select>
											</div>
											<div class="select_box">
												<select id="months" name="month" class="list">
													<option value="0">할부기간을 선택해주세요</option>
												</select>
											</div>
											</c:if>
										</div>
										<!---->
										<div class="card_event">
											<div></div>
											<div class="inner_card">
												<div>
													<strong class="emph">· 무이자할부 유의사항</strong>
													은행계열/체크/기프트/선불/법인/개인사업자 기업카드는 제외
												</div>
												<div>
													<strong class="emph">· 삼성 앱카드</strong>
													6만원 이상 결제 시 3천원
													청구할인, 2/15 0시 ~ 2/18 24시, 기간 내 1회, 선착순<br>&nbsp;&nbsp;
													삼성 &gt; 앱카드 선택하여 결제 시 적용
												</div>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>CHAI 결제</th>
							<td><label class="label_radio" id="cardBenefitChai">
									<input type="radio" name="settlekind" value="chai"> 
									<span class="checkmark"></span>
									<img src="https://res.kurly.com/pc/service/order/2001/logo_chi_x2.png" height="18" alt="Chai 결제">
									<img class="img_benefit" src="https://res.kurly.com/pc/service/order/2101/bubble_chai_0215.png" height="20">
									<div class="info_benefit" style="display:none">
										<span class="info">·2/1 0시 ~ 2/28 24시, 차이 ID당 1회</span>
										</br><span class="info">·매 결제 1.5% 차이머니 적립</span>
									</div>
							</label></td>
						</tr>
						<tr>
							<th>토스 결제</th>
							<td><label class="label_radio" id="cardBenefitToss">
									<input type="radio" name="settlekind" value="toss"> 
									<span class="checkmark"></span>
									<img src="https://res.kurly.com/pc/service/order/1912/toss-logo-signature.svg" height="18" alt="토스 결제">
									<img class="img_benefit" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP4zwAAAgEBAKEeXHUAAAAASUVORK5CYII=" height="20">
									<div class="info_benefit" style="display:none"></div>
							</label></td>
						</tr>
						<tr>
							<th>네이버페이 결제</th>
							<td class="noline">
								<label class="label_radio" id="cardBenefitNaverpay">
									<input type="radio" name="settlekind" value="naver">
									<span class="checkmark"></span>
									<img src="//res.kurly.com/pc/service/order/1710/ico_naverpay_v3.png" height="20" alt="네이버 페이 로고">
									<img class="img_benefit" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP4zwAAAgEBAKEeXHUAAAAASUVORK5CYII=" height="20">
									<div class="info_benefit" style="display:none"></div>
								</label>
							</td>
						</tr>
						<tr>
							<th>PAYCO 결제</th>
							<td>
								<label class="label_radio" id="cardBenefitPayco">
									<input type="radio" name="settlekind" value="payco">
									<span class="checkmark"></span>
									<img src="https://static-bill.nhnent.com/payco/checkout/img/v2/btn_checkout2.png" alt="PAYCO 간편결제" height="18">
									<img class="img_benefit" src="https://res.kurly.com/pc/service/order/2011/bubble_payco_1221.png" height="20">
									<div class="info_benefit" style="display:none">
										<span class="info">·12/21 0시 ~ 02/28 24시</span>
										</br><span class="info">·기본 2% + 추가 1.5% 페이코 포인트 적립</span>
									</div>
								</label>
							</td>
						</tr>
						<tr>
							<th>스마일페이 결제</th>
							<td>
								<label class="label_radio" id="cardBenefitSmilepay">
									<input type="radio" name="settlekind" value="smile">
									<span class="checkmark"></span>
									<img src="//res.kurly.com/pc/service/order/1712/ico_smilepay_v2.png" alt="스마일페이" height="18"> <img class="img_benefit" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP4zwAAAgEBAKEeXHUAAAAASUVORK5CYII=" height="20">
									<div class="info_benefit" style="display:none"></div>
								</label>
							</td>
						</tr>
						<tr>
							<th>휴대폰 결제</th>
							<td>
								<label class="label_radio"> 
									<input type="radio" name="settlekind" value="phone">
									<span class="checkmark" ></span>
									휴대폰
								</label>
							</td>
						</tr>
						<tr>
							<td class="txt_notice" colspan="2">
								<ul>
									<li>※ 페이코, 네이버페이, 토스, 차이 결제는 결제 시 결제하신 수단으로만 환불되는 점
										양해부탁드립니다.</li>
									<li>※ 고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 토스 페이먼츠의
										구매안전(에스크로) 서비스를 이용하실 수 있습니다.</li>
									<li>※ 보안강화로 Internet Explorer 8 미만 사용 시 결제창이 뜨지 않을 수 있습니다.
										<a href="/shop/board/view.php?id=notice&amp;no=207"
										target="_blank">공지 보러가기</a>
									</li>
									<li id="coupon_typinfo" style="display: none">※ 무통장입금에서만
										사용가능한 쿠폰을 선택하였습니다. 다른 결제 수단을 선택하시려면 쿠폰을 제거 하여 주십시오.</li>
								</ul>
							</td>
						</tr>
					</table>
				</div>
				<h2 class="tit_section" id="titFocusAgree">개인정보 수집/제공</h2>
				<table class="goodsinfo_table">
					<tr>
						<td class="reg_agree">
							<div class="bg_dim"></div>
							<div class="check type_form">
								<label class="agree_check"> 
									<input type="checkbox" name="ordAgree" value="y">
									<span class="ico"></span> 결제 진행 필수 동의
								</label>
								<ul class="list_agree">
									<li><span class="subject">개인정보 수집 · 이용 및 위탁 동의 <span
											class="emph">(필수)</span></span> <a href="#terms" class="link_terms">약관보기</a>
									</li>
									<li id="pgTerms" style="display: list-item;"><span
										class="subject">결제대행 서비스 약관 동의 <span class="emph">(필수)</span></span>
										<a href="#pgTerms" class="link_terms">약관보기</a></li>
								</ul>
								<div class="layer layer_agree">
									<div class="choice_agree view_terms">
										<div class="inner_layer">
											<div class="in_layer" id="viewTerms"></div>
											<button type="button" class="btn_ok">확인</button>
											<button type="button" class="btn_close">
												<span class="screen_out">레이어 닫기</span>
											</button>
										</div>
									</div>
									<div class="choice_agree view_pg">
										<div class="inner_layer">
											<div class="in_layer" id="viewPg"></div>
											<button type="button" class="btn_ok">확인</button>
											<button type="button" class="btn_close">
												<span class="screen_out">레이어 닫기</span>
											</button>
										</div>
									</div>
									<div class="choice_agree view_layer">
										<div class="inner_layer">
											<div class="in_layer in_allpaper">
												<img
													src="https://res.kurly.com/pc/service/order/2012/bnr_allpaper_big_v2.png"
													alt="샛별배송은 왜 종이 포장재를 사용할까요?">
												<p class="screen_out">샛별배송을 사용하는 것만으로도 지구를 위하는 일에 함께하실 수
													있어요. 신선함을 지키는 보냉력과 내구성은 그대로! 다른 어떤 소재보다도 재활용성이 우수하니까! 폐기해도
													빠르게 분해되니까!</p>
											</div>
											<button type="button" class="btn_ok">확인</button>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</table>
				<div id="paymentMethodResult">
					<input type="hidden" name="payment_method">
					<input type="submit" value="결제하기" class="btn_payment">
				</div>
			</form>
			<ul class="notice_order">
				<li>직접 주문취소는 <span class="emph">‘입금확인’</span> 상태에서만 가능합니다.
				</li>
				<li>미성년자가 결제 시 법정대리인이 거래를 취소할 수 있습니다.</li>
				<li class="emph">상품 미 배송시, 결제수단으로 환불됩니다.</li>
			</ul>
		</div>
	</div>
</div>
<!-- 약관 첫번쨰 -->
<div id="orderAgreeOne" class="orderAgreeOne">
    <div class="orderAgreeOne-content">
        <p class="img"><img src="/static/front/img/shop/order/orderagreementone.png"></p>
        <p>
 	       <button class="close" type="button">확인</button>
        </p>
    </div>
</div>
<div id="orderAgreeTwo" class="orderAgreeTwo">
    <div class="orderAgreeTwo-content">
        <p class="img"><img src="/static/front/img/shop/order/orderagreementtwo.png"></p>
        <p class="btnWrapper">
 	       <button class="close" type="button">확인</button>
        </p>
    </div>
</div>
<script>
var areaInfo = document.getElementById("areaInfo").textContent;
if(areaInfo == '')
{
	opener.document.getElementById("areaInfo").innerText="${pickUpType}";
	opener.document.getElementById("deliveryMessageTitle").innerText="배송완료 메시지";
	opener.document.getElementById("deliveryMessageDetail").innerText="${deliveryMsg}";
	opener.document.getElementById("meanType").innerText="${pickUpTypeView}";
	opener.document.getElementById("receiverInfo").innerText="${receive_name},${phone}";
	close();
}
</script>