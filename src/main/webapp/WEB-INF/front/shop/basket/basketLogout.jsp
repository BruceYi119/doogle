<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<div class="base wrap">
	<div id="pkc">
		<span id="scroll"></span>
	</div>
	<div id="cartItemList" class="only_pc">
		<div class="tit-page">
			<h2 class="tit">장바구니</h2>
		</div>
		<div class="">
			<div class="cart-item ">
				<div class="cart-select">
					<div class="inner_select">
						<label class="check"><input type="checkbox" class="check-all" name="check-all" checked>
							<span class="ico"></span>전체선택(<span class="check-num">${sellableSize }</span>/${sellableSize })
						</label>
						<input type="button" class="btn-delete" value="선택삭제"/>
					</div>
				</div>
				<c:if test="${cList.size() ne 0 }">
				<div class="box cold">
					<div class="tit-box">
						<h4 class="tit">
							<span class="inner_tit"><span class="ico" ></span>냉장 상품</span>
						</h4>
						<button type="button" class="btn_dropup ">접기 / 펼치기</button>
					</div>
					<ul class="list ">
					<c:forEach items="${cList}" var="bdto">
						<li>
							<div class="item">
								<label class="check" for="bno${bdto.bno}">
									<input type="checkbox" id="bno${bdto.bno}" name="bno" value="${bdto.bno }" checked>
									<span class="ico"></span>
								</label>
								<div class="name">
									<div class="inner_name">
									<c:if test="${bdto.pono ne 0 }">
										<a href="../product/product?pno=${bdto.pno }" class="package ">${bdto.brand } ${bdto.oname }</a>
										<a href="../product/product?pno=${bdto.pno }" class="product ">${bdto.brand } ${bdto.pname }</a>
									</c:if>
									<c:if test="${bdto.pono eq 0 }">
										<a href="../product/product?pno=${bdto.pno }" class="package ">${bdto.brand } ${bdto.pname }</a>
									</c:if>
										<div class="info"></div>
									</div>
								</div>
								<div class="goods">
									<a href="#" class="thumb "
									style="background-image: url('/static/upload/img/shop/product/${bdto.fname}');">상품이미지</a>
									<div class="price">
										<div class="in-price">
										<!-- 상품옵션 있을때 -->
										<c:if test="${bdto.pono ne 0 }">
										 <c:if test="${bdto.dis_not eq 'y' }">
											<span class="selling"><fmt:formatNumber value="${bdto.oprice*bdto.quantity*(1-bdto.discount/100) }" type="number"/><span class="won">원</span></span>
											<span class="cost"><fmt:formatNumber value="${bdto.oprice*bdto.quantity }" type="number"/><span class="won">원</span></span>
										 </c:if>
										 <c:if test="${bdto.dis_not ne 'y'}">
											<span class="selling"><fmt:formatNumber value="${bdto.pprice*bdto.quantity }" type="number"/><span class="won">원</span></span>
										 </c:if>
										</c:if>
										<!-- 상품옵션 없을때 -->
										<c:if test="${bdto.pono eq 0 }">
										 <c:if test="${bdto.dis_not eq 'y' }">
											<span class="selling"><fmt:formatNumber value="${bdto.pprice*bdto.quantity*(1-bdto.discount/100) }" type="number"/><span class="won">원</span></span>
											<span class="cost"><fmt:formatNumber value="${bdto.pprice*bdto.quantity }" type="number"/><span class="won">원</span></span>
										 </c:if>
										 <c:if test="${bdto.dis_not ne 'y'}">
											<span class="selling"><fmt:formatNumber value="${bdto.pprice*bdto.quantity }" type="number"/><span class="won">원</span></span>
										 </c:if>
										</c:if>
										</div>
										<div class="stamper count">
											<input type="hidden" name="stock" value="${btdo.stock }" class="stock">
											<button type="button" class="btn minus off" data-option="decrease" data-item-id="${bdto.bno }" data-item-value="${bdto.quantity}"> - </button>
											<input type="number" id="stepperCounter" class="num" readonly="" value="${bdto.quantity}">
											<button type="button" class="btn plus" data-option="increase" data-item-id="${bdto.bno }" data-item-value="${bdto.quantity}"> + </button>
										</div>
									</div>
								</div>
								<input type="button" class="btn-delete" value="${bdto.bno}">
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
				</c:if>
				<c:if test="${fList.size() ne 0 }">
				<div class="box frozen">
					<div class="tit-box">
						<h4 class="tit">
							<span class="inner_tit"><span class="ico"></span>냉동 상품</span>
						</h4>
						<button type="button" class="btn_dropup ">접기 / 펼치기</button>
					</div>
					<ul class="list ">
						<c:forEach items="${fList}" var="bdto">
						<li>
							<div class="item">
								<label class="check" for="bno${bdto.bno}">
									<input type="checkbox" id="bno${bdto.bno}" name="bno" value="${bdto.bno }" checked>
									<span class="ico"></span>
								</label>
								<div class="name">
									<div class="inner_name">
									<c:if test="${bdto.pono ne 0 }">
										<a href="../product/product?pno=${bdto.pno }" class="package ">${bdto.brand } ${bdto.oname }</a>
										<a href="../product/product?pno=${bdto.pno }" class="product ">${bdto.brand } ${bdto.pname }</a>
									</c:if>
									<c:if test="${bdto.pono eq 0 }">
										<a href="../product/product?pno=${bdto.pno }" class="package ">${bdto.brand } ${bdto.pname }</a>
									</c:if>
										<div class="info"></div>
									</div>
								</div>
								<div class="goods">
									<a href="#" class="thumb "
									style="background-image: url('/static/upload/img/shop/product/${bdto.fname}');">상품이미지</a>
									<div class="price">
										<div class="in-price">
										<!-- 상품옵션 있을때 -->
										<c:if test="${bdto.pono ne 0 }">
										 <c:if test="${bdto.dis_not eq 'y' }">
											<span class="selling"><fmt:formatNumber value="${bdto.oprice*bdto.quantity*(1-bdto.discount/100) }" type="number"/><span class="won">원</span></span>
											<span class="cost"><fmt:formatNumber value="${bdto.oprice*bdto.quantity }" type="number"/><span class="won">원</span></span>
										 </c:if>
										 <c:if test="${bdto.dis_not ne 'y'}">
											<span class="selling"><fmt:formatNumber value="${bdto.pprice*bdto.quantity }" type="number"/><span class="won">원</span></span>
										 </c:if>
										</c:if>
										<!-- 상품옵션 없을때 -->
										<c:if test="${bdto.pono eq 0 }">
										 <c:if test="${bdto.dis_not eq 'y' }">
											<span class="selling"><fmt:formatNumber value="${bdto.pprice*bdto.quantity*(1-bdto.discount/100) }" type="number"/><span class="won">원</span></span>
											<span class="cost"><fmt:formatNumber value="${bdto.pprice*bdto.quantity }" type="number"/><span class="won">원</span></span>
										 </c:if>
										 <c:if test="${bdto.dis_not ne 'y'}">
											<span class="selling"><fmt:formatNumber value="${bdto.pprice*bdto.quantity }" type="number"/><span class="won">원</span></span>
										 </c:if>
										</c:if>
										</div>
										<div class="stamper count">
											<input type="hidden" name="stock" value="${btdo.stock }" class="stock">
											<button type="button" class="btn minus off" data-option="decrease" data-item-id="${bdto.bno }"> - </button>
											<input type="number" id="stepperCounter" class="num" readonly="" value="${bdto.quantity}">
											<button type="button" class="btn plus" data-option="increase" data-item-id="${bdto.bno }"> + </button>
										</div>
									</div>
								</div>
								<input type="button" class="btn-delete" value="${bdto.bno}">
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
				</c:if>
				<c:if test="${rList.size() ne 0 }">
				<div class="box room">
					<div class="tit-box">
						<h4 class="tit">
							<span class="inner_tit"><span class="ico"></span>상온 상품</span>
						</h4>
						<button type="button" class="btn_dropup ">접기 / 펼치기</button>
					</div>
					<ul class="list ">
					<c:forEach items="${rList}" var="bdto">
						<li>
							<div class="item">
								<label class="check" for="bno${bdto.bno}">
									<input type="checkbox" id="bno${bdto.bno}" name="bno" value="${bdto.bno }" checked>
									<span class="ico"></span>
								</label>
								<div class="name">
									<div class="inner_name">
									<c:if test="${bdto.pono ne 0 }">
										<a href="../product/product?pno=${bdto.pno }" class="package ">${bdto.brand } ${bdto.oname }</a>
										<a href="../product/product?pno=${bdto.pno }" class="product ">${bdto.brand } ${bdto.pname }</a>
									</c:if>
									<c:if test="${bdto.pono eq 0 }">
										<a href="../product/product?pno=${bdto.pno }" class="package ">${bdto.brand } ${bdto.pname }</a>
									</c:if>
										<div class="info"></div>
									</div>
								</div>
								<div class="goods">
									<a href="#" class="thumb "
									style="background-image: url('/static/upload/img/shop/product/${bdto.fname}');">상품이미지</a>
									<div class="price">
										<div class="in-price">
										<!-- 상품옵션 있을때 -->
										<c:if test="${bdto.pono ne 0 }">
										 <c:if test="${bdto.dis_not eq 'y' }">
											<span class="selling"><fmt:formatNumber value="${bdto.oprice*bdto.quantity*(1-bdto.discount/100) }" type="number"/><span class="won">원</span></span>
											<span class="cost"><fmt:formatNumber value="${bdto.oprice*bdto.quantity }" type="number"/><span class="won">원</span></span>
										 </c:if>
										 <c:if test="${bdto.dis_not ne 'y'}">
											<span class="selling"><fmt:formatNumber value="${bdto.pprice*bdto.quantity }" type="number"/><span class="won">원</span></span>
										 </c:if>
										</c:if>
										<!-- 상품옵션 없을때 -->
										<c:if test="${bdto.pono eq 0 }">
										 <c:if test="${bdto.dis_not eq 'y' }">
											<span class="selling"><fmt:formatNumber value="${bdto.pprice*bdto.quantity*(1-bdto.discount/100) }" type="number"/><span class="won">원</span></span>
											<span class="cost"><fmt:formatNumber value="${bdto.pprice*bdto.quantity }" type="number"/><span class="won">원</span></span>
										 </c:if>
										 <c:if test="${bdto.dis_not ne 'y'}">
											<span class="selling"><fmt:formatNumber value="${bdto.pprice*bdto.quantity }" type="number"/><span class="won">원</span></span>
										 </c:if>
										</c:if>
										</div>
										<div class="stamper count">
											<input type="hidden" name="stock" value="${btdo.stock }" class="stock">
											<button type="button" class="btn minus off" data-option="decrease" data-item-id="${bdto.bno }"> - </button>
											<input type="number" id="stepperCounter" class="num" readonly="" value="${bdto.quantity}">
											<button type="button" class="btn plus" data-option="increase" data-item-id="${bdto.bno }"> + </button>
										</div>
									</div>
								</div>
								<input type="button" class="btn-delete" value="${bdto.bno}">
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
				</c:if>
				<c:if test="${dList.size() ne 0 }">
				<div class="box sold-out">
					<div class="tit-box">
						<h4 class="tit">
							<span class="inner_tit"><span class="ico"></span>구매불가 상품</span>
						</h4>
					</div>
					<ul class="list ">
					<c:forEach var="bdto" items="${dList }">
						<li><div class="item">
								<input type="checkbox" id="bno${bdto.bno}" name="disBno" value="${bdto.bno }">
								<div class="name">
									<div class="inner_name">
									<c:if test="${bdto.pono ne 0 }">
										<a href="#none" class="package none">
											<c:if test="${bdto.stock eq 0}">(품절)</c:if>${bdto.brand } ${bdto.oname }</a>
										<a href="#none">${bdto.pname }</a>
									</c:if>
									<c:if test="${bdto.pono eq 0 }">
										<a href="#none" class="package none">
											<c:if test="${bdto.stock eq 0}">(품절)</c:if>${bdto.brand } ${bdto.pname }</a>
									</c:if>
										<div class="info"></div>
									</div>
								</div>
								<div class="goods">
									<div class="price">
										<div class="in-price">
											<span class="selling"><fmt:formatNumber value="${bdto.pprice*bdto.quantity }" type="number"/><span class="won">원</span></span>
										</div>
										<div class="stamper count">
											<input type="hidden" name="stock" value="${btdo.stock }" class="stock">
											<button type="button" class="btn minus off" data-option="decrease" data-item-id="${bdto.bno }"> - </button>
											<input type="number" id="stepperCounter" class="num" readonly="" value="${bdto.quantity}">
											<button type="button" class="btn plus" data-option="increase" data-item-id="${bdto.bno }"> + </button>
										</div>
									</div>
									<c:if test="${bdto.sel_not eq 'n'}">
									<p class="msg">배송불가 또는 판매종료 상품</p>
									</c:if>
								</div>
								<input type="button" class="btn-delete" value="${bdto.bno}">
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
				</c:if>
				<div class="cart-select">
					<div class="inner_select">
						<label class="check"><input type="checkbox" class="check-all" name="check-all" checked>
							<span class="ico"></span>전체선택(<span class="check-num">${sellableSize }</span>/${sellableSize })
						</label>
						<input type="button" class="btn-delete" value="선택삭제"/>
						<c:if test="${dList.size() ne 0 }">
						<input type="button" class="btn_shown" value="구매불가 상품 삭제">
						</c:if>
					</div>
				</div>
			</div>
			<div class="cart_result">
				<div class="inner_result" >
					<div class="cart-delivery">
						<h3 class="tit">배송지</h3>
						<c:if test="${ddto.default_yn eq 'n' }">
						<div class="no_address">
						<span class="emph">배송지를 입력</span>하고<br>배송유형을 확인해 보세요!
							<a href="#" class="btn default"><span class="ico"></span>주소 검색</a>
						</div>
						</c:if>
						<c:if test="${ddto.default_yn eq 'y'}">
						<div class="address">
							<p class="addr">${ddto.addr } ${ddto.addr_detail }</p>
							<span class="delivery star">
								<c:if test="${ddto.type eq 't'}">택배배송</c:if>
								<c:if test="${ddto.type eq 's'}">샛별배송</c:if>
							</span>
							<a href="#" class="btn default">배송지 변경</a>
						</div>
						</c:if>
					</div>
					<div class="amount-view">
						<dl class="amount">
							<dt class="tit">상품금액</dt>
							<dd class="price">
								<span class="num"><fmt:formatNumber value="${totalPrice }" type="number"/></span><span class="won">원</span>
							</dd>
						</dl>
						<dl class="amount">
							<dt class="tit">상품할인금액</dt>
							<dd class="price">
								<span class="num minus"><fmt:formatNumber value="${totalDisPrice }" type="number"/></span><span class="won">원</span>
							</dd>
						</dl>
						<c:if test="${mno eq null }"><!-- 로그아웃 -->
						<div class="no_sale">로그인 후 할인 금액 적용</div>
						</c:if>
						<c:if test="${totalPrice<40000}">
						<dl class="amount">
							<dt class="tit">배송비</dt>
							<dd class="price">
								<span class="num">+<fmt:formatNumber value="3000" type="number"/></span><span class="won">원</span>
							</dd>
						</dl>
						<!-- 로그인 -->
						<p class="free-limit"><fmt:formatNumber value="${40000-totalPrice }" type="number"/>원 추가주문 시, <strong>무료배송</strong></p>
						<!--  -->
						<dl class="amount lst">
							<dt class="tit">결제예정금액</dt>
							<dd class="price">
								<span class="num"><fmt:formatNumber value="${payment+3000 }" type="number"/></span><span class="won">원</span>
							</dd>
						</dl>
						</c:if>
						<c:if test="${totalPrice>=40000}">
						<dl class="amount">
							<dt class="tit">배송비</dt>
							<dd class="price">
								<span class="num"><fmt:formatNumber value="0" type="number"/></span><span class="won">원</span>
							</dd>
						</dl>
						<dl class="amount lst">
							<dt class="tit">결제예정금액</dt>
							<dd class="price">
								<span class="num"><fmt:formatNumber value="${payment }" type="number"/></span><span class="won">원</span>
							</dd>
						</dl>
						</c:if>
						<div class="reserve">
							<span class="bage">적립</span>
							<c:if test="${mno eq null}">		<!-- 로그아웃상태 -->
							로그인 후 회원등급에 따라 적립
							</c:if>
							<c:if test="${mno ne null}">
							구매 시 <span class="emph"><fmt:formatNumber value="${totalDisPrice*earn/100 }" type="number"/>원 적립</span>
							</c:if>
						</div>
						
					</div>
					<div class="btn-submit">
						<button type="submit" class="btn active" id="submit">주문하기</button>
					</div>
					<div class="notice">
						<span class="txt"><span class="ico">·</span>쿠폰/적립금은 주문서에서 사용 가능합니다</span>
						<span class="txt"><span class="ico">·</span>‘입금확인’ 상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.</span>
						<span class="txt"><span class="ico">·</span>‘입금확인’ 이후 상태에는 고객센터로 문의해주세요.</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>