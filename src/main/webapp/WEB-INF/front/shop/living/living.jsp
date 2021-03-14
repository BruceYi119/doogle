<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
/* 장바구니 추가 모달 */
.modal-dialog{
	width:450px;
	padding:0;
}
.modal-footer{
	border:0;
}
.inner_option{
	line-height: 1;
	font-size: 12px;
	box-sizing: border-box;
	margin: 0;
	word-break: break-all;
	color: #333;
	letter-spacing: 0;
	padding: 0 20px;
}
.inner_option .btn_close1{
	padding: 0;
	font: inherit;
	overflow: visible;
	border-radius: 0;
	text-transform: none;
	cursor: pointer;
	font-size: 12px;
	max-width: 100%;
	outline: none;
	display: none;
}
.inner_option .tit_cart{
	word-break: break-all;
	box-sizing: border-box;
	font-weight: 700;
	display: block;
	padding: 30px 0 12px;
	border-bottom: 1px solid #333;
	font-size: 16px;
	line-height: 24px;
	letter-spacing: -.67px;
}
.inner_option .in_option{
	padding: 0;
}
.inner_option .list_goods{
	width: 380px;
}
.inner_option .list{
	padding-bottom: 1px;
	overflow: hidden;
	overflow-y: auto;
	width: 400px;
	max-height: 355px;
	min-height: 120px;
	padding-right:10px;
}
.inner_option .list.list_nopackage{
	padding: 0;
	list-style-type: none;
	padding-bottom: 1px;
	width: 400px;
	max-height: 355px;
	padding-top: 30px;
	min-height: 148px;
}
.inner_option .list .on{
	list-style-type: none;
	padding: 11px 0;
	border-bottom: 1px solid #f4f4f4;
}
.inner_option .list.list_nopackage .on{
	margin: 0;
	width: 380px;
	padding: 11px 0;
	border: 0;
}
.inner_option .btn_position{
	padding: 0;
	position: relative;
	display: none;
}

.inner_option .btn_position .btn_del{
	border-radius: 0;
	text-transform: none;
	cursor: pointer;
	max-width: 100%;
	outline: none;
	position: absolute;
	right: 0;
	top: -1px;
	width: 24px;
	height: 24px;
	border: 0;
	background: url(https://res.kurly.com/pc/ico/2010/ico_cartput_del_24x25.svg) no-repeat 50% 50%;
	background-size: 24px 25px;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
}
.inner_option .btn_del .txt{
	list-style-type: none;
	word-break: break-all;
	text-transform: none;
}

.inner_option .name{
	list-style-type: none;
	display: block;
	line-height: 20px;
	font-size: 14px;
}

.inner_option .option{
	line-height: 1;
	font-size: 12px;
	list-style-type: none;
	overflow: hidden;
	padding-top: 7px;
}

.inner_option .option .count{
	width: 88px;
	height: 30px;
	border: 1px solid #dddfe1;
	border-radius: 3px;
	float: right;
}
.inner_option .option .price{
	text-align: right;
	float: left;
	padding: 7px 0 0;
	font-size: 14px;
}
.inner_option .option .price .dc_price{
	padding-right: 4px;
	font-weight: 800;
}

.inner_option .btn.down.on{
	padding: 0;
	font: inherit;
	margin: 0;
	border-radius: 0;
	cursor: pointer;
	max-width: 100%;
	outline: none;
	float: left;
	width: 28px;
	height: 28px;
	border: 0;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
	background: #fff url(https://res.kurly.com/pc/ico/2010/ico_minus.svg) no-repeat 50% 50%;
	background-size: 30px 30px;
	background-image: url(https://res.kurly.com/pc/ico/2010/ico_minus_on.svg);
}
.inner_option .btn.up.on{
	padding: 0;
	font: inherit;
	margin: 0;
	border-radius: 0;
	cursor: pointer;
	max-width: 100%;
	outline: none;
	width: 28px;
	height: 28px;
	border: 0;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
	float: right;
	margin-left: -1px;
	background: #fff url(https://res.kurly.com/pc/ico/2010/ico_plus.svg) no-repeat 50% 50%;
	background-size: 30px 30px;
	background-image: url(https://res.kurly.com/pc/ico/2010/ico_plus_on.svg);
}
.inner_option .inp{
	list-style-type: none;
	word-break: break-all;
	box-sizing: border-box;
	margin: 0;
	max-width: 100%;
	width: 30px;
	height: 28px;
	margin-right: -1px;
	border: 0;
	background-color: #fff;
	font-size: 14px;
	color: black;
	line-height: 28px;
	text-align: center;
}
.inner_option .total{
	-webkit-text-size-adjust: 100%;
    line-height: 1;
    font-size: 12px;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    word-break: break-all;
    font-family: noto sans;
    color: #333;
    letter-spacing: 0;
    padding-top: 20px;
}
.inner_option .total .price{
    line-height: 1;
    overflow: hidden;
    text-align: right;
}
.inner_option .total .price .tit{
    text-align: right;
    font-weight: 700;
    float: left;
    font-size: 16px;
    line-height: 24px;
    letter-spacing: -.67px;
    vertical-align: 0;
}
.inner_option .total .price .sum{
    line-height: 1;
    font-size: 12px;
    float: right;
    margin-top: -1px;
}

.inner_option .total .price .sum .num{
    padding-left: 8px;
    font-weight: 800;
    font-size: 24px;
    line-height: 24px;
    letter-spacing: -1px;
}
.inner_option .total .price .sum .won{
	font-weight: 700;
	padding-left: 0;
	font-size: 16px;
	line-height: 24px;
	letter-spacing: -.67px;
	vertical-align: 3px;
}
.inner_option .total .txt_point{
	box-sizing: border-box;
	display: block;
	font-size: 14px;
	color: #666;
	line-height: 20px;
	text-align: right;
	padding-top: 6px;
}
.inner_option .total .txt_point .ico{
	display: inline-block;
	width: 38px;
	height: 20px;
	margin-right: 2px;
	border: 1px solid #e8a828;
	border-radius: 10px;
	background-color: #ffbf00;
	font-weight: 700;
	font-size: 11px;
	color: #fff;
	line-height: 18px;
	text-align: center;
	vertical-align: 1px;
}
.inner_option .total .txt_point .no_login{
    font-size: 14px;
    line-height: 20px;
    text-align: right;
    letter-spacing: 0;
}

.group_btn.off.layer_btn2{
	line-height: 1;
	font-size: 12px;
	box-sizing: border-box;
	text-align: center;
	color: #333;
	letter-spacing: 0;
	width: 100%;
	overflow: hidden;
	padding: 10px 15px 20px 15px;
}

.group_btn.off.layer_btn2 .btn_type2{
	border-radius: 3px;
	background-color: #fff;
	color: #333;
	float: left;
	width: 186px;
	height: 56px;
	border: 1px solid #ddd;
}
.group_btn.off.layer_btn2 .btn_type1{
	border-radius: 3px;
	border: 1px solid #5f0081;
	float: right;
	width: 186px;
	height: 56px;
	background-color: #5f0080;
	color: #fff;
}
.group_btn.off.layer_btn2 .btn_type2 .txt_type{
	overflow: visible;
	text-transform: none;
	cursor: pointer;
	max-width: 100%;
	outline: none;
	display: block;
	height: 100%;
	padding-bottom: 2px;
	font-weight: 700;
	font-size: 16px;
	line-height: 52px;
	letter-spacing: -.1px;
	color: #333;
	width: 100%;
	border: 0;
	border-radius: 3px;
	background: inherit ;
	border:none;
	box-shadow:none;
}

.group_btn.off.layer_btn2 .btn_type1 .txt_type{
	overflow: visible;
	text-transform: none;
	cursor: pointer;
	max-width: 100%;
	outline: none;
	display: block;
	height: 100%;
	padding-bottom: 2px;
	font-weight: 700;
	font-size: 16px;
	line-height: 52px;
	letter-spacing: -.1px;
	width: 100%;
	border: 0;
	border-radius: 3px;
	color: #fff;
	background: inherit ;
	border:none;
	box-shadow:none;
}


/* 알림메시지 모달 */
#living-Modal .modal-header {
	margin: 25px;
	height:50px;
	line-height:50px;
    box-sizing: border-box;
    font-size: 14px;
    font-weight: 700;
    letter-spacing: -.025em;
    color: #5f0080;
    padding:0;
    border-bottom: 1px solid #b2b2b2;
}

#living-Modal .modal-header .notice-tit{
	width:420px;
	float:left;
}

#living-Modal .notice-header .notice-close-button{
	margin:15px auto;
    box-sizing: border-box;
    font-size: 0;
    overflow: visible;
    text-transform: none;
    cursor: pointer;
    letter-spacing: -.05em;
    max-width: 100%;
    outline: none;
    width: 20px;
    height: 20px;
    background-image: url('/static/front/img/shop/living/notice-delete.JPG');
    text-indent: -9999px;
    position: absolute;
    border:none;
	box-shadow:none;
	float:right;
	background-repeat: no-repeat;
}

#living-Modal .notice-content {
    line-height: 1;
    letter-spacing: -.05em;
    color: #4c4c4c;
    font-size: 12px;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    display: table;
    width: 100%;
}

#living-Modal .notice-content .msg{
    letter-spacing: -.05em;
    color: #4c4c4c;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    word-break: break-all;
    height: 60px;
    display: table-cell;
    vertical-align: middle;
    font-size: 13px;
    line-height: 1.5;
    text-align: center;
    width: 100%;
}

#living-Modal .modal-footer{
    line-height: 1;
    letter-spacing: -.05em;
    color: #4c4c4c;
    font-size: 12px;
    margin: 0;
    background-color: #f5f5f5;
    padding: 30px 0;
}

#living-Modal .modal-footer .footer-btn{
	margin: 0 auto;
}

#living-Modal .modal-footer .footer-btn .ok-btn{
    border:none;
	box-shadow:none;
    overflow: visible;
    border-radius: 0;
    text-transform: none;
    cursor: pointer;
    letter-spacing: -.05em;
    max-width: 100%;
    outline: none;
    display: inline-block;
    border: 1px solid #5f0080;
    text-align: center;
    font-size: 13px;
    width: 150px;
    height: 45px;
    line-height: 45px;
    background-color: #5f0080;
    color: #fff;
	float:none;
}

</style>

<div class="base wrap">
	<div class="page-section section-wishlist">
		<div class="head_aticle">
			<h2 class="tit">
				늘 사는 것 <span class="tit_sub">늘 사는 것으로 등록하신 상품 목록 입니다</span>
			</h2>
		</div>
		<form name="livingFrm" method="post" action="deleteLiving">
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
					<c:forEach items="${list }" var="ldto">
					<tr>
						<td>
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
								<a href="../product/product?&pno=${ldto.pno }">[${ldto.brand }] ${ldto.pname }</a>
							</div>
							<dl>
								<dt class="screen-out">상품가격</dt>
								<dd><fmt:formatNumber value="${ldto.price }" type="number"/>원</dd>
							</dl>
						</td>
						<td>
							<div class="group-btn">
								<button type="button" class="btn add-basket" data-toggle="modal" data-target="#basket-modal" data-whatever="${ldto.pno }"> 장바구니 담기 </button>
								<%-- <button type="button" onclick="cartLayerOpenAction(${ldto.pno})" name="bno" class="btn btn-positive">장바구니 담기</button> --%>
								<a href="deleteOneLiving?lno=${ldto.lno }" class="btn delete-one" >삭제</a>
							</div>
						</td>
					</tr>
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
		<div class="layout-pagination">
			<div class="pagediv">
				<a href="/shop/mypage/mypage_wishlist.php?&amp;page=1"
					class="layout-pagination-button layout-pagination-first-page">
					맨 처음 페이지로 가기</a>
				<a href="/shop/mypage/mypage_wishlist.php?&amp;page=1"
					class="layout-pagination-button layout-pagination-prev-page">
					이전	페이지로 가기</a>
				<strong class="layout-pagination-button layout-pagination-number __active">1</strong>
				<a href="/shop/mypage/mypage_wishlist.php?&amp;page=1"
					class="layout-pagination-button layout-pagination-next-page">
					다음 페이지로 가기</a>
				<a href="/shop/mypage/mypage_wishlist.php?&amp;page=1"
					class="layout-pagination-button layout-pagination-last-page">
					맨 끝 페이지로 가기</a>
			</div>
		</div>
	</div>
</div>
<form id="cartPut">
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
										<input type="hidden" name="pno" value="${dto.pno }">
										<input type="hidden" name="pno" value="${dto.pono }">
										<input type="hidden" name="quantity" value="">
									<span class="btn_position">
										<button type="button" class="btn_del">
											<span class="txt">삭제하기</span>
										</button>
									</span> 
									<span class="name"> [${dto.brand }] ${dto.oname } </span> 
									<div class="option">
										<span class="count">
										<button type="button" class="btn down on">수량내리기</button>
										<input type="number" readonly="readonly" value="0" onfocus="this.blur()" class="inp">
										<button type="button" class="btn up on">수량올리기</button></span> 
										<span class="price">
											<span class="dc_price"><fmt:formatNumber value="${dto.oprice }" type="number"/>원</span>
										</span>
									</div>
								</li>
							</c:forEach>
							</ul>
							</c:if>
							<c:if test="${option eq 0 }">
								<ul class="list list_nopackage">
									<li class="on">
										<input type="hidden" name="pno" value="${dto.pno }">
										<input type="hidden" name="pno" value="${dto.pno }">
										<input type="hidden" name="quantity" value="">
										<span class="btn_position">
											<button type="button" class="btn_del">
												<span class="txt">삭제하기</span>
											</button>
										</span>
										<span class="name"> ${dto.brand } ${dto.pname }</span>
										<div class="option">
											<span class="count">
											<button type="button" class="btn down on">수량내리기</button>
											<input type="number" readonly="readonly" value="0" onfocus="this.blur()" value="0" class="inp">
											<button type="button" class="btn up on">수량올리기</button></span>
											<span class="price">
												<span class="dc_price"><fmt:formatNumber value="${dto.pprice }" type="number"/>원</span>
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
<button type="button" class="btn add-living" data-toggle="modal" data-target="#living-Modal" data-whatever="2"> 늘 사는 것 </button>
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