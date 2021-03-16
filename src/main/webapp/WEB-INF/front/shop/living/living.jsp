<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<div class="base wrap">
	<div class="page-section section-wishlist">
		<div class="head_aticle">
			<h2 class="tit">
				늘 사는 것 <span class="tit_sub">늘 사는 것으로 등록하신 상품 목록 입니다</span>
			</h2>
		</div>
		<form name="livingFrm" id="livingFrm" method="post" action="deleteLiving">
			<input type="hidden" name="mode">
			<table class="tbl tbl-type1">
				<colgroup>
					<col style="width: 27px;">
					<col style="width: 150px;">
					<col style="width: auto;">
					<col style="width: 165px;">
				</colgroup>
				<thead>
					<tr>
						<th>
						<label class="label-check " for="chkBox"> 
							<input type="checkbox" name="all_checked" id="chkBox">
							<span class="ico"></span>
						</label></th>
						<th><span class="screen-out">상품이미지</span></th>
						<th>상품정보</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="i" value="${i}" />
					<c:forEach items="${list }" var="ldto">
					<tr>
						<td>
							<input type="hidden" name="pno" value="${ldto.pno }">
							<input type="hidden" name="pono" value="${ldto.pono }">
							<input type="hidden" name="brand" value="${ldto.brand }">
							<input type="hidden" name="pname" value="${ldto.pname }">
							<input type="hidden" name="oname" value="${ldto.oname }">
							<input type="hidden" name="quantity" value="${ldto.quantity }">
							<input type="hidden" name="dis_yn" value="${ldto.dis_yn }">
							<input type="hidden" name="discount" value="${ldto.discount }">
							<input type="hidden" name="earn_yn" value="${ldto.earn_yn }">
							<input type="hidden" name="earn" value="${ldto.earn }">
							<input type="hidden" name="pprice" value="${ldto.pprice }">
							<input type="hidden" name="oprice" value="${ldto.oprice }">
							<label class="label-check" for="chkBox${ldto.lno }">
							<input type="checkbox" id="chkBox${ldto.lno }" name="lno" value="${ldto.lno }" class="ico_check">
								<span class="ico"></span>
							</label>
						</td>
						<td class="thumb">
							<a href="../product/product?&pno=${ldto.pno }">
								<img style="background-image: url('/static/upload/img/shop/product/${ldto.fname}');" width="126"/>
							</a>
						</td>
						<td class="info">
							<div class="name">
								<a href="../product/product?&pno=${ldto.pno }">${ldto.brand } ${ldto.pname }</a>
							</div>
							<dl>
								<dt class="screen-out">상품가격 </dt>
								<dd><fmt:formatNumber value="${ldto.pprice }" type="number"/>원</dd>
							</dl>
						</td>
						<td>
							<div class="group-btn">
								<button type="button" class="btn add-basket" data-toggle="modal" data-target="#basket-modal" data-whatever="${ldto.lno }" data-index> 장바구니 담기 </button>
								<%-- <button type="button" onclick="cartLayerOpenAction(${ldto.pno})" name="bno" class="btn btn-positive">장바구니 담기</button> --%>
								<a href="deleteOneLiving?lno=${ldto.lno }" class="btn delete-one" >삭제</a>
							</div>
						</td>
					</tr>
					<c:set var="i" value="${i + 1}" />
					</c:forEach>
				</tbody>
			</table>
			<div class="group-btn">
				<div class="inner_groupbtn">
					<input type="submit" class="btn delete-chked" value="늘 사는 것 비우기">
					<span class="space"></span>
				</div>
			</div>
		</form>
		<div><ul class="pagination justify-content-center" id="pageWrap">${paging}</ul></div>
	</div>
</div>
<form id="addBasket">
	<div class="modal" id="basket-modal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <!-- Modal body -->
	      <div class="modal-body">
	        <div class="inner_option">
					<c:if test="${option ne 0 }">
					<strong class="tit_cart">${name }</strong>
					</c:if>
					<div class="in_option">
						<div class="list_goods">
							<c:if test="${option ne 0 }">
							<ul class="list">
							<c:forEach var="dto" items="${pList }">
								<li class="on">
									<input type="hidden" name="mno" id="mno" value="${mno }">
									<input type="hidden" name="pno" id="pno" value="${dto.pno }">
									<input type="hidden" name="pono" id="pono"value="${dto.pono }">
									<input type="hidden" name="price" id="price" class="one-price" value="${dto.pprice }">
									<input type="hidden" name="earn" class="earn" value="${dto.earn }">
									<span class="btn_position">
										<button type="button" class="btn_del">
											<span class="txt">삭제하기</span>
										</button>
									</span> 
									<span class="name"> ${dto.brand } ${dto.oname } </span> 
									<div class="option">
										<span class="count">
										<button type="button" class="btn down on">수량내리기</button>
										<input type="number" readonly="readonly" value="0" onfocus="this.blur()" class="inp">
										<button type="button" class="btn up on">수량올리기</button></span> 
										<span class="price">
										<c:if test="${dis_yn eq 'y'}">
												<span class="dc_price"><span class="price-box">${dto.oprice }</span>원</span>
												<span class="original_price"><span class="price-box">${dto.oprice*(1-dto.discount/100) }</span>원</span>
											</c:if>
											<c:if test="${dto.dis_yn eq 'n'}">
												<span class="dc_price"><span class="price-box">${dto.oprice }</span>원</span>
										</c:if>
										</span>
									</div>
								</li>
							</c:forEach>
							</ul>
							</c:if>
							<c:if test="${option eq 0 }">
								<ul class="list list_nopackage">
									<li class="on">
										<input type="hidden" name="mno" id="mno" value="${mno }">
										<input type="hidden" name="pno" id="pno" value="${dto.pno }">
										<input type="hidden" name="pono" id="pono"value="${dto.pono }">
										<input type="hidden" name="price" id="price" class="one-price" value="${dto.pprice }">
										<input type="hidden" name="earn" class="earn" value="${dto.earn }">
										<span class="btn_position">
											<button type="button" class="btn_del">
												<span class="txt">삭제하기</span>
											</button>
										</span>
										<span class="name"> ${dto.brand } ${dto.pname }</span>
										<div class="option">
											<span class="count">
											<button type="button" class="btn down on">수량내리기</button>
											<input type="number" name="quantity" readonly="readonly" value="0" onchange="chgTotalPrice()" onfocus="this.blur()" class="inp">
											<button type="button" class="btn up on">수량올리기</button></span>
											<span class="price">
											<c:if test="${dto.dis_yn eq 'y'}">
												<span class="dc_price"><span class="price-box">${dto.pprice }</span>원</span>
												<span class="original_price"><span class="price-box">${dto.pprice*(1-dto.discount/100) }</span>원</span>
											</c:if>
											<c:if test="${dto.dis_yn eq 'n'}">
												<span class="dc_price"><span class="price-box">${dto.pprice }</span>원</span>
											</c:if>
											</span>
										</div>
									</li>
								</ul>
							</c:if>
						</div>
						<div class="total">
							<div class="price">
								<strong class="tit">합계</strong>
								<span class="sum">
									<span class="num">0</span> 
									<span class="won">원</span>
								</span>
							</div>
							<p class="txt_point">
								<span class="ico">적립</span>
								<span class="point"> 구매 시 
									<strong class="emph"><span id="saving">0</span>원 적립</strong>
								</span>
							</p>
						</div>
					</div>
				</div>
	      </div>
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <div class="group_btn off layer_btn2">
				<span class="btn_type2"><button type="button" class="txt_type" data-dismiss="modal">취소</button></span> 
				<span class="btn_type1"><button type="button" class="txt_type">장바구니 담기</button></span>
			</div>
	      </div>
	
	    </div>
	  </div>
	</div>
</form>

<!-- 늘사는것 추가 -->
<button type="button" class="btn add-living" data-toggle="modal" data-target="#living-Modal" data-whatever="1"> 늘 사는 것 </button>
<div class="modal" id="living-Modal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
	  <!-- Modal Header -->
      <div class="modal-header">
        <div class="notice-header">
        <div class="notice-tit">알림메세지</div>
        <div class="close-btn"><button type="button" class="notice-close-button" data-dismiss="modal">이 메세지를 닫기</button></div>
      </div>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
		<div class="notice-content">
			<p class="msg"></p>
		</div>
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <div class="footer-btn">
			<button type="button" class="ok-btn" data-dismiss="modal">확인</button> 
		</div>
      </div>
    </div>
  </div>
</div>