<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/static/front/css/mycoupon.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<div id="main">
<div id="content">
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
<div class="user"><strong class="name">${name}</strong> <span class="txt"> 고객님</span></div> <!----> 
<div class="benefit"><strong class="tit"></strong>적립 5%</div> 
<div class="benefit"><strong class="tit"></strong>최초 1회 무료배송</div> 
<div class="benefit"></div>
</div>
</div> 
<div class="next">
<a href="/shop/event/lover" class="total_grade">전체등급 보기</a> 
<a href="/shop/event/my_benefit" class="next_month">다음 달 예상등급 보기</a>
</div>
</div> 
<ul class="list_mypage">

<li class="user_reserve">
<div class="link">
<div class="tit">적립금</div> 
<a href="/shop/mypage/mysaving" class="info"> ${saving.credit} 원<img src="https://res.kurly.com/pc/service/common/1905/ico_arrow_56x56.png" alt="자세히 보기"> 
<span class="date">소멸예정 ${saving.exp_credit} 원</span></a></div>
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

<div class="bg_loading" id="bgLoading" style="display: none;">
<div class="loading_show"></div>
</div>
<div class="page_aticle aticle_type2">
<div id="snb" class="snb_my">
<h2 class="tit_snb">마이컬리</h2>
<div class="inner_snb">
<ul class="list_menu">
	<li><a href="/shop/mypage/orderSumm">주문 내역</a></li>
	<li><a href="/shop/deliveryList" >배송지관리</a></li>
	<li><a href="/shop/living">늘 사는 것</a></li>
	<li><a href="#">상품 후기</a></li>
	<li><a href="/shop/mypage/mysaving">적립금</a></li>
	<li class="on"><a href="/shop/mypage/mycoupon">쿠폰</a></li>
	<li><a href="/member/info">개인 정보 수정</a></li>
</ul>
</div>
<a href="/shop/mypage/mypage_qna_register.php?mode=add_qna" class="link_inquire"><span class="emph">도움이 필요하신가요 ?</span> 1:1 문의하기</a>
</div>
<div class="page_section section_point">
<div class="head_aticle">
<h2 class="tit">적립금 <span class="tit_sub">보유하고 계신 적립금의 내역을 한 눈에 확인 하실 수 있습니다.</span></h2>
</div>
<div id="viewPointList">

<div class="point_header">
<div class="point_view"><h3 class="tit">현재 적립금</h3> 
<strong class="point">${saving.credit}<span class="won"> 원</span></strong></div> 
<span class="disappear">
	<span class="subject">소멸예정 적립금 
		<span class="date">${exp}</span>
	</span> 
	<span class="num">${saving.exp_credit} 원</span>
</span>
</div>
 
<table class="tbl tbl_type1">
<caption style="display: none;">적립 사용 내역 상세보기</caption> 
<colgroup>
<col style="width: 120px;"> 
<col style="width: auto;"> 
<col style="width: 122px;"> 
<col style="width: 140px;">
</colgroup> 
<tbody>
<tr></tr> 
</tbody>
<!--  적립금액 상세 리스트 -->
			<caption>적립금등록 내역 상세보기</caption>
			<thead>
				<tr>
					<th>날짜</th>
					<th class="info">내용</th>
					<th>유효기간</th>
					<th>금액</th>
				</tr>
			</thead>
			
			<!-- saving_list 리스트 출력 -->
			<tbody>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td><fmt:parseDate value="${dto.writedate}" var="writedate" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${writedate}" pattern="yyyy.MM.dd" />
					</td>
					<td class="info">
					[적립금] ${dto.credit} 원 적립되었습니다.
					</td>
					<td>
						<fmt:parseDate value="${dto.expiry}" var="expiry" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${expiry}" pattern="yyyy.MM.dd" />
					</td>
					<td class="point">${dto.credit} 원</td>
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
</div>
</div>
</div>