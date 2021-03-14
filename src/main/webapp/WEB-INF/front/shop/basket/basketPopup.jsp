<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

.inner_option{
	line-height: 1;
	font-size: 12px;
	box-sizing: border-box;
	margin: 0;
	word-break: break-all;
	color: #333;
	letter-spacing: 0;
	padding: 0 30px;
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
.inner_option .in_option .list_goods{
	width: 380px;
}
.inner_option .list{
	padding-bottom: 1px;
	overflow: hidden;
	overflow-y: auto;
	width: 400px;
	max-height: 355px;
	min-height: 120px;
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
.inner_option .on .btn_position{
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
	line-height: 1;
	text-align: right;
	float: left;
	padding: 7px 0 0;
	font-size: 14px;
	font-weight: 700;
}
.inner_option .option .price .dc_price{
	padding-right: 4px;
	font-weight: 800;
}

.inner_option .count .btn.down.on{
	border-radius: 0;
	text-transform: none;
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


.inner_option .count .btn.up.on{
	border-radius: 0;
	text-transform: none;
	cursor: pointer;
	max-width: 100%;
	outline: none;
	font-family: noto sans;
	letter-spacing: 0;
	overflow: hidden;
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
.inner_option .count .inp{
	list-style-type: none;
	word-break: break-all;
	box-sizing: border-box;
	max-width: 100%;
	width: 30px;
	height: 30px;
	margin-right: -1px;
	padding: 0 0 4px;
	border: 0;
	background-color: #fff;
	font-size: 14px;
	color: #000;
	line-height: 18px;
	text-align: center;
}

.inner_option .total{
	line-height: 1;
	font-size: 12px;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	padding-top: 20px;
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
	text-align: right;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	letter-spacing: 0;
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
	word-break: break-all;
	font-family: noto sans;
	color: #333;
	font-weight: 700;
	padding-left: 0;
	font-size: 16px;
	line-height: 24px;
	letter-spacing: -.67px;
	vertical-align: 3px;
}
.inner_option .price .txt_point{
	box-sizing: border-box;
	display: block;
	font-size: 14px;
	color: #666;
	line-height: 20px;
	text-align: right;
	padding-top: 6px;
}
.inner_option .price .txt_point .ico{
	word-break: break-all;
	margin: 0;
	padding: 0;
	letter-spacing: 0;
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
.inner_option .price .txt_point .no_login{
	font-size: 14px;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	color: #333;
	letter-spacing: 0;
}
</style>
<script>


</script>
</head>
<!-- Button to Open the Modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#basketModal">
  Open modal
</button>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<form id="cartLayer">
	<div class="modal " id="basketModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body modal-dialog-centered">
					<div class="inner_option">
						<button type="button" class="btn_close1">레이어닫기</button>
						<c:if test="${option ne 0 }">
						<strong class="tit_cart">${name }</strong>
						</c:if>
						<div class="in_option">
							<div class="list_goods">
								<c:if test="${option ne 0 }">
								<ul class="list">
								<c:forEach var="bdto" items="${list }">
									<li class="on">
										<span class="btn_position">
											<button type="button" class="btn_del">
												<span class="txt">삭제하기</span>
											</button>
										</span> 
										<span class="name"> ${bdto.brand } ${bdto.oname } </span> 
										<div class="option">
											<span class="count">
											<button type="button" class="btn down on">수량내리기</button>
											<input type="number" readonly="readonly" onfocus="this.blur()" class="inp">
											<button type="button" class="btn up on">수량올리기</button></span> 
											<span class="price">
												<span class="dc_price"><fmt:formatNumber value="${bdto.oprice }" type="number"/></span>
											</span>
										</div>
									</li>
								</c:forEach>
								</ul>
								</c:if>
								<c:if test="${pdto.pono eq 0 }">
									<ul class="list list_nopackage">
										<li class="on">
											<span class="btn_position">
												<button type="button" class="btn_del">
													<span class="txt">삭제하기</span>
												</button>
											</span>
											<span class="name"> ${bdto.brand } ${bdto.pname }</span>
											<div class="option">
												<span class="count">
												<button type="button" class="btn down on">수량내리기</button>
												<input type="number" readonly="readonly" onfocus="this.blur()" class="inp">
												<button type="button" class="btn up on">수량올리기</button></span>
												<span class="price">
													<span class="dc_price"><fmt:formatNumber value="${bdto.pprice }" type="number"/></span>
												</span>
											</div>
										</li>
									</ul>
								</c:if>
							</div>
							<div class="total">
								<div class="price">
									<strong class="tit">합계</strong>
									<span class="sum"><span class="num">0</span> 
									<span class="won">원</span></span>
								</div>
								<p class="txt_point">
									<span class="ico">적립</span>
									<span class="point"> 구매 시 
										<strong class="emph">0원 적립</strong>
									</span>
									<c:if test="">
									<span class="no_login"> <span>로그인 후, 적립혜택 제공</span></span>
									</c:if>
								</p>
							</div>
						</div>
						<div class="group_btn off layer_btn2">
							<span class="btn_type2"><button type="button" class="txt_type">취소</button></span> 
							<span class="btn_type1"><button type="button" class="txt_type">장바구니 담기</button></span>
s						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
