<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="absolute_div"></div>
<div class="base_wrap" align="center">
	<div id="container">
		<div id="con_nav">
			<div id="con_nav2">
				<ul>
					<li><a href="/shop/event/total">전체보기</a></li>
					<li><a href="/shop/event/lover" id="font_color">회원혜택</a></li>
					<li><a href="/shop/event/friend">친구초대</a></li>
					<li><a href="/shop/event/basket">장바구니</a></li>
					<li><a href="/shop/event/benefit">결제혜택</a></li>
				</ul>
			</div>
		</div>
		<div id="incon" align="left">
			<div class="event_tit">
				<h2 class="tit_event">두글쇼핑 러버스 혜택</h2>
				<p class="txt_event">고객님께 받은 사랑을 혜택으로 돌려드려요. 매월 실적에 따라 달라지는
					실용적이고 다채로운 혜택을 확인해보세요.</p>
			</div>
			<div class="grade_list">
				<div id="grade_item1">
					<a class="a_grade" id="a_grade1"> <strong class="tit">더퍼플</strong>
						<p class="txt">
							<span class="num">7</span>%＞
						</p></a>
				</div>
				<div id="grade_item2">
					<a class="a_grade" id="a_grade2"> <strong class="tit">퍼플</strong>
						<p class="txt">
							<span class="num">7</span>%＞
						</p></a>
				</div>
				<div id="grade_item3">
					<a class="a_grade" id="a_grade3"> <strong class="tit">라벤더</strong>
						<p class="txt">
							<span class="num">5</span>%＞
						</p></a>
				</div>
				<div id="grade_item4">
					<a class="a_grade" id="a_grade4"> <strong class="tit">화이트</strong>
						<p class="txt">
							<span class="num">3</span>%＞
						</p></a>
				</div>
				<div id="grade_item5">
					<a class="a_grade" id="a_grade5"> <strong class="tit">프렌즈</strong>
						<p class="txt">
							<span class="num">1</span>%＞
						</p></a>
				</div>
				<div id="grade_item6">
					<a class="a_grade" id="a_grade6"> <strong class="tit">일반</strong>
						<p class="txt">
							<span class="num">0.5</span>%＞
						</p></a>
				</div>
			</div>
			<div class="item_on">
				<div id="item_img1">
					<img src="/static/front/img/shop/event/default/더퍼플.jpg">
				</div>
				<div id="item_img2">
					<img src="/static/front/img/shop/event/default/퍼플.jpg">
				</div>
				<div id="item_img3">
					<img src="/static/front/img/shop/event/default/라벤더.jpg">
				</div>
				<div id="item_img4">
					<img src="/static/front/img/shop/event/default/화이트.jpg">
				</div>
				<div id="item_img5">
					<img src="/static/front/img/shop/event/default/프렌즈.jpg">
				</div>
				<div id="item_img6">
					<img src="/static/front/img/shop/event/default/일반.jpg">
				</div>
			</div>
			<ul class="list_noti">
				<li>총 혜택 금액은 12개월간 동일 등급을 유지할 경우 받게 되는 적립, 쿠폰할인, 선물(더퍼플) 금액의
					총합계입니다.</li>
				<li>등급별 할인 쿠폰 혜택은 변경될 수 있습니다.</li>
			</ul>
			<div class="event_btn">
				<c:if test="${id!='' }">
				<a href="/shop/event/my_benefit"><img
					src="/static/front/img/shop/event/default/다음달혜택.jpg"></a>
				</c:if>
				<c:if test="${id=='' }">
				<a href="/login" id="to_login"><img
					src="/static/front/img/shop/event/default/다음달혜택.jpg"></a>
				</c:if>
			</div>
			<div class="event_gift">
				<img src="/static/front/img/shop/event/default/회원혜택.jpg">
			</div>
		</div>
	</div>
</div>