<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="absolute_div"></div>
<div class="base_wrap" align="center">
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="MM" var="today" />
	<c:forEach items="${list}" var="dto">	
		<input type="hidden" name="vpayment" value="${dto.payment }"/>	
		<input type="hidden" name="vsaving" value="${dto.saving }"/>	
		<input type="hidden" name="vpaymentdate" value="${dto.paymentdate }">
		<input type="hidden" name="vto_day" value="${today }">
	</c:forEach>
	<div id="container" align="center">
		<div class="my_grades">
			<div class="my_grade grade1">
				<h4>다음 달 나의 예상 등급</h4>
				<div class="my_grade_box general">일반</div>
				<p><span id="datum1">150000</span> 원 추가 구매시, 프렌즈 달성</p>
				<span>(누적 결제액:<span class="mpayment"></span>원, 누적 적립금 사용액:<span class="msaving"></span>원)</span>
				<p class="p_txt" align="left">*전월 실적은 전월 결제액과 적림금을 사용액 합계입니다.</p>
			</div>
			<div class="my_grade grade2">
				<h4>다음 달 나의 예상 등급</h4>
				<div class="my_grade_box friends">프렌즈</div>
				<p><span id="datum2">300000</span> 원 추가 구매시, 화이트 달성</p>
				<span>(누적 결제액:<span class="mpayment"></span>원, 누적 적립금 사용액:<span class="msaving"></span>원)</span>
				<p class="p_txt" align="left">*전월 실적은 전월 결제액과 적림금을 사용액 합계입니다.</p>		</div>
			<div class="my_grade grade3">
				<h4>다음 달 나의 예상 등급</h4>
				<div class="my_grade_box white">화이트</div>
				<p><span id="datum3">500000</span> 원 추가 구매시, 라벤더 달성</p>
				<span>(누적 결제액:<span class="mpayment"></span>원, 누적 적립금 사용액:<span class="msaving"></span>원)</span>
				<p class="p_txt" align="left">*전월 실적은 전월 결제액과 적림금을 사용액 합계입니다.</p>		</div>
			<div class="my_grade grade4">
				<h4>다음 달 나의 예상 등급</h4>
				<div class="my_grade_box lavender">라벤더</div>
				<p><span id="datum4">1000000</span> 원 추가 구매시, 퍼플 달성</p>
				<span>(누적 결제액:<span class="mpayment"></span>원, 누적 적립금 사용액:<span class="msaving"></span>원)</span>
				<p class="p_txt" align="left">*전월 실적은 전월 결제액과 적림금을 사용액 합계입니다.</p>		</div>
			<div class="my_grade grade5">
				<h4>다음 달 나의 예상 등급</h4>
				<div class="my_grade_box purple">퍼플</div>
				<p><span id="datum5">1500000</span> 원 추가 구매시, 퍼플 달성</p>
				<span>(누적 결제액:<span class="mpayment"></span>원, 누적 적립금 사용액:<span class="msaving"></span>원)</span>
				<p class="p_txt" align="left">*전월 실적은 전월 결제액과 적림금을 사용액 합계입니다.</p>	
			</div>
			<div class="my_grade grade6">
				<h4>다음 달 나의 예상 등급</h4>
				<div class="my_grade_box the_purple">더퍼플</div>
				<p>이미 더퍼플 등급이십니다!!</p>
				<span>(누적 결제액:<span class="mpayment"></span>원, 누적 적립금 사용액:<span class="msaving"></span>원)</span>
				<p class="p_txt" align="left">*전월 실적은 전월 결제액과 적림금을 사용액 합계입니다.</p>	
			</div>
		</div>
		<div class="div_center" align="center">
			<div class="all_grade">
				<ul class="list next_grade" id="list_grade1">
					<li class="name">
						<div class="div_center" align="center">
							<div class="all_grade_box general">일반</div>
						</div> <span class="desc_grade">전월 실적<br>15만원 미만
					</span>
					</li>
					<li class="point"><img
						src="../../static/front/img/shop/event/default/kurlylovers_won.png"><br>
						<span class="info">0.5% 적립</span></li>
				</ul>
				<ul class="list" id="list_grade2">
					<li class="name">
						<div class="div_center" align="center">
							<div class="all_grade_box friends">프렌즈</div>
						</div> <span class="desc_grade">전월 실적<br>15만원 이상
					</span>
					</li>
					<li class="point"><img
						src="../../static/front/img/shop/event/default/kurlylovers_won.png"><br>
						<span class="info">1% 적립</span></li>
					<li class="coupon"><span class="txt">1,000원 할인</span> <span
						class="sub">5만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="coupon"><span class="txt">2,000원 할인</span> <span
						class="sub">5만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="coupon"><span class="txt">3,000원 할인</span> <span
						class="sub">6만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
				</ul>
				<ul class="list" id="list_grade3">
					<li class="name">
						<div class="div_center" align="center">
							<div class="all_grade_box white">화이트</div>
						</div> <span class="desc_grade">전월 실적<br>30만원 이상
					</span>
					</li>
					<li class="point"><img
						src="../../static/front/img/shop/event/default/kurlylovers_won.png"><br>
						<span class="info">3% 적립</span></li>
					<li class="coupon"><span class="txt">1,000원 할인</span> <span
						class="sub">5만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="coupon"><span class="txt">2,000원 할인</span> <span
						class="sub">5만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="coupon"><span class="txt">3,000원 할인</span> <span
						class="sub">6만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
				</ul>
				<ul class="list" id="list_grade4">
					<li class="name">
						<div class="div_center" align="center">
							<div class="all_grade_box lavender">라벤더</div>
						</div> <span class="desc_grade">전월 실적<br>50만원 이상
					</span>
					</li>
					<li class="point"><img
						src="/static/front/img/shop/event/default/kurlylovers_won.png"><br>
						<span class="info">5% 적립</span></li>
					<li class="coupon"><span class="txt">1,000원 할인</span> <span
						class="sub">5만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="coupon"><span class="txt">2,000원 할인</span> <span
						class="sub">5만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="coupon"><span class="txt">3,000원 할인</span> <span
						class="sub">7만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="coupon"><span class="txt">4,000원 할인</span> <span
						class="sub">8만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
				</ul>
				<ul class="list" id="list_grade5">
					<li class="name">
						<div class="div_center" align="center">
							<div class="all_grade_box purple">퍼플</div>
						</div> <span class="desc_grade">전월 실적<br>100만원 이상
					</span>
					</li>
					<li class="point"><img
						src="/static/front/img/shop/event/default/kurlylovers_won.png"><br>
						<span class="info">7% 적립</span></li>
					<li class="coupon"><span class="txt">1,000원 할인</span> <span
						class="sub">5만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="coupon"><span class="txt">2,000원 할인</span> <span
						class="sub">5만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="coupon"><span class="txt">3,000원 할인</span> <span
						class="sub">7만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="coupon"><span class="txt">4,000원 할인</span> <span
						class="sub">8만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="write" id="write_id"><img
						src="/static/front/img/shop/event/default/kurlylovers_write.png"><br>
						<span class="info">더블 후기 적립금</span></li>
				</ul>
				<ul class="list" id="list_grade6">
					<li class="name">
						<div class="div_center" align="center">
							<div class="all_grade_box the_purple">더퍼플</div>
						</div> <span class="desc_grade">전월 실적<br>150만원 이상
					</span>
					</li>
					<li class="point"><img
						src="/static/front/img/shop/event/default/kurlylovers_won.png"><br>
						<span class="info">7% 적립</span></li>
					<li class="coupon"><span class="txt">1,000원 할인</span> <span
						class="sub">5만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="coupon"><span class="txt">2,000원 할인</span> <span
						class="sub">5만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="coupon"><span class="txt">3,000원 할인</span> <span
						class="sub">7만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="coupon"><span class="txt">4,000원 할인</span> <span
						class="sub">8만원 이상 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="coupon"><span class="txt">10% 할인</span> <span
						class="sub">신상품 구매시</span> <img
						src="/static/front/img/shop/event/default/kurlylovers_coupon.png">
					</li>
					<li class="write"><img
						src="/static/front/img/shop/event/default/kurlylovers_write.png"><br>
						<span class="info">더블 후기 적립금</span></li>
					<li class="gift"><img
						src="/static/front/img/shop/event/default/kurlylovers_gift.png"><br>
						<a href="/shop/event/lover"><span class="info">월별 기프트 ></span></a>
					</li>
				</ul>
				<div class="clear_div"></div>
			</div>
		</div>
		<div class="end_info"></div>
	</div>
</div>