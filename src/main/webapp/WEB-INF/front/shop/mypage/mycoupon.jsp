<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<link rel="stylesheet" href="/static/front/css/mycoupon.css">

<div id="qnb" class="quick-navigation" style="top: 70px;">
<div class="bnr_qnb" id="brnQuick"><a href="/shop/board/view.php?id=notice&amp;no=64" id="brnQuickObj">
    <img class="thumb" src="https://res.kurly.com/pc/service/main/1904/bnr_quick_20190403.png" alt="퀄리티있게 샛별배송">
</a>
</div>


<div class="side_menu">
<a href="/shop/main/html.php?htmid=event/kurly.htm&amp;name=lovers" class="link_menu ">등급별 혜택</a>
<a href="/shop/board/list.php?id=recipe" class="link_menu ">레시피</a>
<a href="/shop/goods/goods_review_best.php" class="link_menu ">베스트 후기</a>
</div>

<div class="side_recent" style="display:none">
<strong class="tit">최근 본 상품</strong>
<div class="list_goods" data-height="209" style="height: 0px;">
<ul class="list"></ul>
</div>
<button type="button" class="btn btn_up off">최근 본 상품 위로 올리기</button>
<button type="button" class="btn btn_down off">최근 본 상품 아래로 내리기</button>
</div>
</div>
<div id="myPageTop" class="page_aticle mypage_top"><h2 class="screen_out">마이페이지</h2> 
<div class="mypagetop_user"><div class="inner_mypagetop">
<div class="grade_user">
<div class="grade"><span class="screen_out">등급</span> <span class="ico_grade class6">
<span class="inner_grade"><span class="in_grade">웰컴</span></span></span>
<div class="grade_bnenfit">
<div class="user"><strong class="name">${mno}</strong> <span class="txt">번 고객님</span></div> <!----> 
<div class="benefit"><strong class="tit"></strong>적립 5%</div> 
<div class="benefit"><strong class="tit"></strong>최초 1회 무료배송</div> 
<div class="benefit"></div>
</div>
</div> 
<div class="next">
<a href="/shop/event/lovers/lovers.php" class="total_grade">전체등급 보기</a> 
<a href="/shop/proc/my_benefit.php?id=benefit" class="next_month">다음 달 예상등급 보기</a>
</div>
</div> 
<ul class="list_mypage">

<li class="user_reserve">
<div class="link">
<div class="tit">적립금</div> 
<a href="/shop/mypage/mysaving" class="info">${saving.credit} 원<img src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png" alt="자세히 보기"> 
<span class="date"> 소멸예정 ${saving.exp_credit} 원</span></a></div>
</li> 

<li class="user_coupon">
<div class="link">
<div class="tit">쿠폰</div> 
<a href="/shop/mypage/mycoupon" class="info">${count} 개<img src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png" alt="자세히 보기"></a>
</div>
</li> 

<li class="user_kurlypass">
<div class="link">
<div class="tit">컬리패스</div> <!----> 
<a href="/shop/mypage/kurlypass.php" class="info info_link">알아보기<img src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png" alt="자세히 보기"></a></div></li></ul></div> 
<a href="https://www.kurly.com/shop/main/html.php?htmid=event/kurly.htm&amp;name=friend" class="bnr_event" style="background-image: url(&quot;//img-cf.kurly.com/shop/data/skin/designgj/img/banner/ae8763da478b227a3fdf0241c923f953.jpg&quot;);">
<img src="https://res.kurly.com/pc/service/common/1904/bg_1050x60.png" alt="할인혜택보러가기"></a>
</div>
</div>

<!--  쿠폰 리스트 나타내는란 -->
<div class="page_aticle aticle_type2">
	<div id="snb" class="snb_my">
		<h2 class="tit_snb">마이컬리</h2>
		<div class="inner_snb">
			<ul class="list_menu">
				<li><a href="">주문 내역</a></li>
				<li><a href="#none"
					onclick="KurlyTracker.setAction('select_shipping_address_list').sendData();location.href = '/shop/mypage/destination/list.php';">배송지
						관리</a></li>
				<li><a href="">늘 사는 것</a></li>
				<li><a href="">상품 후기</a></li>
				<li><a href="/shop/mypage/mysaving">적립금</a></li>
				<li class="on"><a href="/shop/mypage/mycoupon">쿠폰</a></li>
				<li><a href="">개인 정보 수정</a></li>
			</ul>
		</div>
		<a href="/shop/mypage/mypage_qna_register.php?mode=add_qna"
			class="link_inquire"><span class="emph">도움이 필요하신가요 ?</span> 1:1
			문의하기</a>
	</div>
	<div class="page_section section_coupon">
		<div class="head_aticle">
			<h2 class="tit">쿠폰</h2>
		</div>

		<div class="coupon_reg">
			<form method="post" action="/shop/mypage/mycoupon/add">
				<fieldset>
					<!-- 쿠폰 등록 란 -->
					<legend>쿠폰 등록 폼</legend>
					<div class="reg">
						<input type="text" name="cno" label="쿠폰번호" class="inp" placeholder="쿠폰을 입력해주세요">
						<button type="submit" class="btn">쿠폰 등록</button>
					</div>
					<p class="notice">쿠폰에 하이픈("-")이 포함되어 있을경우 하이픈("-")을 반드시 입력해주세요.</p>
				</fieldset>
			</form>
		</div>

		<!-- 보유쿠폰 나타내기 -->
		<div class="coupon_count">
			<span class="ico"></span>
			<p class="txt">쿠폰은 적용 가능한 상품이 따로 적용되어 있는 경우 해당 상품 구매 시에만 사용이
				가능합니다.</p>
			<p class="count">
				<span class="tit">사용가능쿠폰</span> : ${count} 개
			</p>
		</div>

		<!--  보유쿠폰 리스트 -->
		<table class="tbl tbl_type1">
			<caption>적립 사용 내역 상세보기</caption>
			<colgroup>
				<col style="width: auto;">
				<col style="width: 58px;">
				<col style="width: 101px;">
				<col style="width: 139px;">
				<col style="width: 101px;">
			</colgroup>
			<thead>
				<tr>
					<th class="name">쿠폰명</th>
					<th>기능</th>
					<th>할인/적립</th>
					<th>등록일</th>
					<th>만료일</th>
				</tr>
			</thead>
			
			<!-- 내 쿠폰 리스트 출력 -->
			<tbody>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td class="name">${dto.content}</td>
					<td class="name">할인</td>
					<td class="name">
						<c:if test="${dto.dis_type eq 'd'}">${dto.discount}%</c:if>
						<c:if test="${dto.dis_type eq 'p'}">${dto.dis_price}원</c:if>
						<c:if test="${dto.dis_type eq 'a'}">${dto.discount}%/${dto.dis_price}원</c:if>
					</td>
					<td class="name">${dto.srat_expiry}</td>
					<td class="name">${dto.end_expiry}</td>
				</tr>
	        </c:forEach>
		    </tbody>
		    <tfoot>
				<tr>					
					<td colspan="24" class="text-center">
						<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
<p></p>
<p></p>

