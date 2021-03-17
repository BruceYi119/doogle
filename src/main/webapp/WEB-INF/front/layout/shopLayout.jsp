<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/static/front/img/favicon.ico" type="image/x-icon">
<link rel="icon" href="/static/front/img/favicon.ico" type="image/x-icon">
<title>Doogle</title>
<link rel="stylesheet" href="/static/core/css/bootstrap.min.css">
<c:if test="${edit eq 'edit'}"><link rel="stylesheet" href="/static/core/css/summernote-bs4.min.css"></c:if>
<link rel="stylesheet" href="/static/front/css/global.css">
<link rel="stylesheet" href="/static/front/css/shopLayout.css">
<link rel="stylesheet" href="/static/front/css/shop.css">
<c:if test="${url eq '/shop/bulkOrder'}"><link rel="stylesheet" href="/static/front/css/bulkOrder.css"></c:if>
<c:if test="${url eq '/shop/propositionList'}"><link rel="stylesheet" href="/static/front/css/proposition-list.css"></c:if>
<c:if test="${url eq '/shop/propositionWrite'}"><link rel="stylesheet" href="/static/front/css/proposition-write.css"></c:if>
<c:if test="${url eq '/shop/propositionUpdate'}"><link rel="stylesheet" href="/static/front/css/proposition-write.css"></c:if>
<c:if test="${url eq '/shop/ecoList'}"><link rel="stylesheet" href="/static/front/css/proposition-list.css"></c:if>
<c:if test="${url eq '/shop/ecoWrite'}"><link rel="stylesheet" href="/static/front/css/proposition-write.css"></c:if>
<c:if test="${url eq '/shop/ecoUpdate'}"><link rel="stylesheet" href="/static/front/css/proposition-write.css"></c:if>
<c:if test="${url eq '/shop/event/basket'}"><link rel="stylesheet" href="/static/front/css/event_basket.css"></c:if>
<c:if test="${url eq '/shop/event/benefit'}"><link rel="stylesheet" href="/static/front/css/event_benefit.css"></c:if>
<c:if test="${url eq '/shop/event/friend'}"><link rel="stylesheet" href="/static/front/css/event_friend.css"></c:if>
<c:if test="${url eq '/shop/event/lover'}"><link rel="stylesheet" href="/static/front/css/event_lover.css"></c:if>
<c:if test="${url eq '/shop/event/total'}"><link rel="stylesheet" href="/static/front/css/event_total.css"></c:if>
<c:if test="${url eq '/shop/event/collection'}"><link rel="stylesheet" href="/static/front/css/event_collection.css"></c:if>
<c:if test="${url eq '/shop/event/my_benefit'}"><link rel="stylesheet" href="/static/front/css/event_my_benefit.css"></c:if>
<c:if test="${url eq '/shop/event'}"><link rel="stylesheet" href="/static/front/css/event_list.css"></c:if>
<c:if test="${url eq '/shop/recipe'}"><link rel="stylesheet" href="/static/front/css/recipe_list.css"></c:if>
<c:if test="${url eq '/shop/recipe/content'}"><link rel="stylesheet" href="/static/front/css/recipe_content.css"></c:if>
<c:if test="${url eq '/shop/deliveryList'}"><link rel="stylesheet" href="/static/front/css/deliveryList.css"></c:if>
<c:if test="${url eq '/shop/notice'}"><link rel="stylesheet" href="/static/front/css/notice.css"></c:if>
<c:if test="${url eq '/shop/notice_view'}"><link rel="stylesheet" href="/static/front/css/notice_view.css"></c:if>
<c:if test="${url eq '/shop/qna'}"><link rel="stylesheet" href="/static/front/css/qna.css"></c:if>
<c:if test="${url eq '/shop/qnaUpdate'}"><link rel="stylesheet" href="/static/front/css/qnaUpdate.css"></c:if>
<c:if test="${url eq '/shop/questionList'}"><link rel="stylesheet" href="/static/front/css/questionList.css"></c:if>
<c:if test="${url eq '/shop/order'}"><link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap"></c:if>
<c:if test="${url eq '/shop/order'}"><link rel="stylesheet" href="/static/front/css/order.css"></c:if>
<c:if test="${url eq '/shop/end'}"><link rel="stylesheet" href="/static/front/css/orderend.css"></c:if>
<c:if test="${url eq '/mypage/orderSumm'}"><link rel="stylesheet" href="/static/front/css/orderSumm.css"></c:if>
<c:if test="${url eq '/mypage/orderSumm_detail'}"><link rel="stylesheet" href="/static/front/css/orderSumm_detail.css"></c:if>
<c:if test="${url eq '/shop/basket'}"><link rel="stylesheet" href="/static/front/css/basket.css"></c:if>
<c:if test="${url eq '/shop/living'}"><link rel="stylesheet" href="/static/front/css/living.css"></c:if>
<c:if test="${url eq '/shop/event/product'}"><link rel="stylesheet" href="/static/front/css/event_product.css"></c:if>
<script defer type="text/javascript" src="/static/core/js/jquery-3.5.1.min.js"></script>
<script defer src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script defer type="text/javascript" src="/static/core/js/bootstrap.min.js"></script>
<script defer type="text/javascript" src="/static/core/js/axios.min.js"></script>
<c:if test="${url eq '/shop/event/collection'}"><script defer type="text/javascript" src="/static/front/js/event_collection.js"></script><link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"><script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script></c:if>
<script defer type="text/javascript" src="/static/front/js/shopGlobal.js"></script>
<c:if test="${edit eq 'edit'}"><script defer type="text/javascript" src="/static/core/js/summernote-bs4.min.js"></script></c:if>
<c:if test="${edit eq 'edit'}"><script defer type="text/javascript" src="/static/core/js/summernote-ko-KR.min.js"></script></c:if>
<c:if test="${edit eq 'edit'}"><script defer type="text/javascript" src="/static/front/js/edit.js"></script></c:if>
<c:if test="${url eq 'main'}"><script defer type="text/javascript" src="/static/front/js/shop.js"></script></c:if>
<c:if test="${url eq '/shop/product/form'}"><script defer type="text/javascript" src="/static/front/js/form.js"></script></c:if>
<c:if test="${url eq '/shop/bulkOrder'}"><script defer type="text/javascript" src="/static/front/js/bulk.js"></script></c:if>
<c:if test="${url eq '/shop/bulkOrder'}"><script defer type="text/javascript" src="/static/front/js/bulklist.js"></script></c:if>
<c:if test="${url eq '/shop/propositionList'}"><script defer type="text/javascript" src="/static/front/js/propositionList.js"></script></c:if>
<c:if test="${url eq '/shop/propositionWrite'}"><script defer type="text/javascript" src="/static/front/js/bulklist.js"></script></c:if>
<c:if test="${url eq '/shop/propositionUpdate'}"><script defer type="text/javascript" src="/static/front/js/bulklist.js"></script></c:if>
<c:if test="${url eq '/shop/propositionWrite'}"><script defer type="text/javascript" src="/static/front/js/propositionWrite.js"></script></c:if>
<c:if test="${url eq '/shop/propositionUpdate'}"><script defer type="text/javascript" src="/static/front/js/propositionWrite.js"></script></c:if>
<c:if test="${url eq '/shop/ecoList'}"><script defer type="text/javascript" src="/static/front/js/ecoList.js"></script></c:if>
<c:if test="${url eq '/shop/ecoWrite'}"><script defer type="text/javascript" src="/static/front/js/bulklist.js"></script></c:if>
<c:if test="${url eq '/shop/ecoUpdate'}"><script defer type="text/javascript" src="/static/front/js/bulklist.js"></script></c:if>
<c:if test="${url eq '/shop/ecoWrite'}"><script defer type="text/javascript" src="/static/front/js/propositionWrite.js"></script></c:if>
<c:if test="${url eq '/shop/ecoUpdate'}"><script defer type="text/javascript" src="/static/front/js/propositionWrite.js"></script></c:if>
<c:if test="${url eq '/shop/event/basket'}"><script defer type="text/javascript" src="/static/front/js/event_nav.js"></script></c:if>
<c:if test="${url eq '/shop/event/benefit'}"><script defer type="text/javascript" src="/static/front/js/event_nav.js"></script></c:if>
<c:if test="${url eq '/shop/event/friend'}"><script defer type="text/javascript" src="/static/front/js/event_nav.js"></script></c:if>
<c:if test="${url eq '/shop/event/lover'}"><script defer type="text/javascript" src="/static/front/js/event_lover.js"></script></c:if>
<c:if test="${url eq '/shop/event/total'}"><script defer type="text/javascript" src="/static/front/js/event_nav.js"></script></c:if>
<c:if test="${url eq '/shop/event/collection'}"><script defer type="text/javascript" src="/static/front/js/event_collection.js"></script></c:if>
<c:if test="${url eq '/shop/event/my_benefit'}"><script defer type="text/javascript" src="/static/front/js/event_my_benefit.js"></script></c:if>
<c:if test="${url eq '/shop/recipe'}"><script defer type="text/javascript" src="/static/front/js/recipe_list.js"></script></c:if>
<c:if test="${url eq '/deliveryPop'}"><script defer type="text/javascript" src="/static/front/js/deliveryPop.js"></script></c:if>
<c:if test="${url eq '/shop/deliveryList'}"><script defer type="text/javascript" src="/static/front/js/delivery.js"></script></c:if>
<c:if test="${url eq '/shop/notice'}"><script defer type="text/javascript" src="/static/front/js/notice.js"></script></c:if>
<c:if test="${url eq '/notice_insert'}"><script defer type="text/javascript" src="/static/front/js/notice_insert.js"></script></c:if>
<c:if test="${url eq '/notice_update'}"><script defer type="text/javascript" src="/static/front/js/notice_update.js"></script></c:if>
<c:if test="${url eq '/shop/qna'}"><script defer type="text/javascript" src="/static/front/js/qna.js"></script></c:if>
<c:if test="${url eq '/shop/qnaUpdate'}"><script defer type="text/javascript" src="/static/front/js/qnaRegister.js"></script></c:if>
<c:if test="${url eq '/qna_register'}"><script defer type="text/javascript" src="/static/front/js/qnaRegister.js"></script></c:if>
<c:if test="${url eq '/questionRegister'}"><script defer type="text/javascript" src="/static/front/js/questionRegister.js"></script></c:if>
<c:if test="${url eq '/questionUpdate'}"><script defer type="text/javascript" src="/static/front/js/questionUpdate.js"></script></c:if>
<c:if test="${url eq '/shop/order'}"><script defer type="text/javascript" src="/static/front/js/order.js"></script></c:if>
<c:if test="${url eq '/shop/basket'}"><script defer type="text/javascript" src="/static/front/js/basket.js"></script></c:if>
<c:if test="${url eq '/shop/living'}"><script defer type="text/javascript" src="/static/front/js/living.js"></script></c:if>
<c:if test="${url eq '/shop/product/detail'}"><script defer type="text/javascript" src="/static/front/js/productDetail.js"></script></c:if>
<sitemesh:write property="head" /></head>
<body>
	<div id="wrap">
		<!-- s:팝업 -->
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />		
		<c:forEach items="${pulist}" var="pudto">
			<c:if test="${today >= pudto.start_date && today <= pudto.end_date && pudto.type == 'y'}">
				<input type="hidden" name="popup_no" value="${pudto.puno}"/>
				<input type="hidden" name="popup_title" value="${dto.title}"/>
				<input type="hidden" name="popup_left" value="${pudto.left}"/>
				<input type="hidden" name="popup_top" value="${pudto.top}"/>
				<input type="hidden" name="popup_width" value="${pudto.width}"/>
				<input type="hidden" name="popup_height" value="${pudto.height}"/>
			</c:if>
		</c:forEach>
		<!-- e:팝업 -->
		<div id="main-banner">
			<div class="wrap-container">
				<a href="/shop/event/collection">지금 가입하고 인기상품 <b>100원에 받아가세요!</b><img src="/static/front/img/shop/ico_arrow.webp" /></a>
				<button type="button" id="btn-main-banner-close">가입하고 혜택받기</button>
			</div>
		</div>
		<header>
			<div class="wrap-container">
				<div id="top-banner"><a href="#"><img src="/static/front/img/shop/img_courier.webp" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송" /></a></div>
				<h1 id="home"><a href="/shop"><img src="/static/front/img/shop/doogle_shopping.png" /></a></h1>
				<ul id="member-menu">
					<c:if test="${not empty id}">
						<li class="main">
							<a href="#">${name} 님</a>
							<ul class="sub hide">
								<li><a href="/shop/mypage/orderSumm">주문내역</a></li>
								<li><a href="/shop/deliveryList">배송지 관리</a></li>
								<li><a href="/shop/living">늘 사는것</a></li>
								<li><a href="#">상품 후기</a></li>
								<li><a href="/shop/mypage/mysaving">적립금</a></li>
								<li><a href="/shop/mypage/mycoupon">쿠폰</a></li>
								<li><a href="/member/info">개인 정보 수정</a></li>
								<li><a href="/logout">로그아웃</a></li>
							</ul>
						</li>
					</c:if>
					<c:if test="${empty id}">
						<li><a href="/terms">회원가입</a></li>
						<li></li>
						<li><a href="/login">로그인</a></li>
					</c:if>
					<li></li>
					<li class="main">
						<a href="/shop/notice" class="before">고객센터</a>
						<ul class="sub hide">
							<li><a href="/shop/notice">공지사항</a></li>
							<li><a href="/shop/questionList">자주하는 질문</a></li>
							<li><a href="/shop/qna">1:1 문의</a></li>
							<li><a href="/shop/bulkOrder">대량주문 문의</a></li>
							<li><a href="/shop/propositionList">상품 제안</a></li>
							<li><a href="/shop/ecoList">에코포장 피드백</a></li>
						</ul>
					</li>
				</ul>
				<nav>
					<div class="wrap-container">
						<ul id="main-menu">
							<li>
								<a href="#">전체 카테고리</a>
								<ul id="product-menu"  class="hide">
									<li>
										<ul id="product-main-wrap">	
											<c:forEach items="${clist}" var="dto"><li><a href="/shop/product/${dto.ctno}" ctno="${dto.ctno}">${dto.name}</a></li></c:forEach>
										</ul>
									</li>
									<li class="hide" id="product-sub-wrap">
										<div id="sub-loading"><div class="spinner-border text-muted"></div></div>
		<!-- 								<ul id="product-sub-menu"><li><a href="#">상품</a></li></ul> -->
									</li>
								</ul>
							</li>
							<li><a href="/shop/product/new">신상품</a></li>
							<li><a href="/shop/product/best">베스트</a></li>
							<li><a href="/shop/product/dis">알뜰쇼핑</a></li>
							<li><a href="/shop/event">금주혜택</a></li>
							<li>
								<form action="/shop/product/search" method="post">
									<input type="text" id="shop-search" name="search" placeholder="내 맘대로 골라담는 식단조절 도시락" />
									<button type="submit" id="btn-shop-search"></button>
									<button type="button" id="btn-shop-search-del" class="hide"></button>
								</form>
							</li>
							<li class="pl20 pr20"><a href="/shop/deliveryList"><img src="/static/front/img/shop/ico_delivery_setting.svg" /></a></li>
							<li class="pr20"><a href="/shop/basket" data-toggle="tooltip" data-placement="bottom" data-original-title="" id="btn-basket"><img src="/static/front/img/shop/ico_cart.svg" /></a></li>
						</ul>
					</div>
				</nav>
			</div>
		</header>
		<main>
			<sitemesh:write property="body" />
		</main>
		<footer>
			<div class="wrap-container">
				<div class="footer-top">
					<div class="help">
						<h2>고객행복센터</h2>
						<div class="call">
							<h3>0000-0000</h3>
							<dl>
								<dt>365고객센터</dt>
								<dd>오전 7시 - 오후 7시</dd>
							</dl>
						</div>
						<div class="kakao mt12">
							<a href="#"><h3>카톡오톡 문의</h3></a>
							<dl>
								<dt>365고객센터</dt>
								<dd>오전 7시 - 오후 7시</dd>
							</dl>
						</div>
						<div class="qna mt12">
							<a href="#"><h3>1:1 문의</h3></a>
							<dl>
								<dt>24시간 접수 가능</dt>
								<dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
							</dl>
						</div>
					</div>
					<div class="company">
						<ul class="list">
							<li><a href="#">두글소개</a></li>
							<li><a href="https://www.youtube.com/embed/WEep7BcboMQ?rel=0&amp;showinfo=0&amp;wmode=opaque&amp;enablejsapi=1" onclick="window.open(this.href, 'pop', 'width=1330,height=660,scrollbars=yes');return false;">두글소개영상</a></li>
							<li><a href="#">인재채용</a></li>
							<li><a href="#">이용약관</a></li>
							<li><a href="#"><strong>개인정보처리방침</strong></a></li>
							<li><a href="#">이용안내</a></li>
						</ul>
						<p>법인명 (상호):주식회사 두글 | 사업자등록번호:000-00-00000 사업자정보 확인</p>
						<p>통신판매업:제 0000-서울구로-00000 호 | 개인정보보호책임자:홍길동</p>
						<p>주소:서울특별시 구로구 구로중앙로34길 33-4(구로동, 경영기술개발원빌딩) | 대표이사:홍길동</p>
						<p>입점문의:입점문의하기 | 제휴문의:business@doogle.com</p>
						<p>채용문의:recruit@doogle.com</p>
						<p>팩스:000-0000-0000 | 이메일:help@doogle.com</p>
						<p class="copy">© KURLY CORP. ALL RIGHTS RESERVED</p>
						<ul class="list-sns">
							<li><a href="https://instagram.com/marketkurly" class="link_sns" target="_blank"><img src="/static/front/img/shop/ico_instagram.webp" alt="마켓컬리 인스타그램 바로가기"></a></li>
							<li><a href="https://www.facebook.com/marketkurly" class="link_sns" target="_blank"><img src="/static/front/img/shop/ico_fb.webp" alt="마켓컬리 페이스북 바로가기"></a></li>
							<li><a href="http://blog.naver.com/marketkurly" class="link_sns" target="_blank"><img src="/static/front/img/shop/ico_blog.webp" alt="마켓컬리 네이버블로그 바로가기"></a></li>
							<li><a href="https://m.post.naver.com/marketkurly" class="link_sns" target="_blank"><img src="/static/front/img/shop/ico_naverpost.webp" alt="마켓컬리 유튜브 바로가기"></a></li>
							<li><a href="https://www.youtube.com/channel/UCfpdjL5pl-1qKT7Xp4UQzQg" class="link_sns lst" target="_blank"><img src="/static/front/img/shop/ico_youtube.webp" alt="마켓컬리 유튜브 바로가기"></a></li>
						</ul>
					</div>
				</div>
				<div class="authentication">
					<a href="#">
						<img src="/static/front/img/shop/logo_isms.webp" />
						<p>[인증범위] 두글 쇼핑몰 서비스 개발 · 운영</p>
						<p>[유효기간] 2019.04.01 ~ 2022.03.31</p>
					</a>
					<a href="#">
						<img src="/static/front/img/shop/logo_eprivacyplus.webp" />
						<p>개인정보보호 우수 웹사이트 ·</p>
						<p>개인정보처리시스템 인증 (ePRIVACY PLUS)</p>
					</a>
					<a href="#">
						<img src="/static/front/img/shop/logo_payments.webp" />
						<p>고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한</p>
						<p>토스 페이먼츠 구매안전(에스크로) 서비스를 이용하실 수 있습니다.</p>
					</a>
				</div>
			</div>
		</footer>
		<div id="qnb">
			<div class="pb7">
				<a href="#"><img src="/static/front/img/shop/img_qnb.webp" /></a>
			</div>
			<div class="pb7">
				<ul>
					<li><a href="/">Doogle</a></li>
					<li><a href="/shop/event/lover">등급별 혜택</a></li>
					<li><a href="/shop/recipe">레시피</a></li>
					<li><a href="#">베스트후기</a></li>
				</ul>
			</div>
			<div id="latest" class="hide">
				<button type="button" id="btn-latest-up">최근 본 상품 위로 올리기</button>
				<strong>최근 본 상품</strong>
				<div class="latest-wrap">
					<ul id="latest-list"></ul>
				</div>
				<button type="button" id="btn-latest-down">최근 본 상품 아래로 내리기</button>
			</div>
		</div>
		<a href="#" id="btn-page-top"><button type="button">맨 위로가기</button></a>
	</div>
</body>
</html>