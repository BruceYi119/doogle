<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/static/front/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/static/front/img/favicon.ico" type="image/x-icon" />
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
<script defer type="text/javascript" src="/static/core/js/jquery-3.5.1.min.js"></script>
<script defer src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script defer type="text/javascript" src="/static/core/js/bootstrap.min.js"></script>
<script defer type="text/javascript" src="/static/core/js/axios.min.js"></script>
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
<sitemesh:write property="head" /></head>
<body>
	<div id="wrap">
		<div id="main-banner">
			<div class="wrap-container">
				<a href="#">지금 가입하고 인기상품 <b>100원에 받아가세요!</b><img src="/static/front/img/shop/ico_arrow.webp" /></a>
				<button type="button" id="btn-main-banner-close">가입하고 혜택받기</button>
			</div>
		</div>
		<header>
			<div class="wrap-container">
				<div id="top-banner"><a href="#"><img src="/static/front/img/shop/img_courier.webp" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송" /></a></div>
				<h1 id="home"><a href="/shop"><img src="/static/front/img/shop/doogle_shopping.png" /></a></h1>
				<ul id="member-menu">
					<li><a href="/terms">회원가입</a></li>
					<li></li>
					<li><a href="/login">로그인</a></li>
					<li></li>
					<li>
						<a href="#" class="before">고객센터</a>
						<ul class="sub hide">
							<li><a href="#">공지사항</a></li>
							<li><a href="#">자주하는 질문</a></li>
							<li><a href="#">1:1 문의</a></li>
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
											<c:forEach items="${clist}" var="dto"><li><a href="#" ctno="${dto.ctno}">${dto.name}</a></li></c:forEach>
										</ul>
									</li>
									<li class="hide" id="product-sub-wrap">
										<div id="sub-loading"><div class="spinner-border text-muted"></div></div>
		<!-- 								<ul id="product-sub-menu"><li><a href="#">상품</a></li></ul> -->
									</li>
								</ul>
							</li>
							<li><a href="#">신상품</a></li>
							<li><a href="#">베스트</a></li>
							<li><a href="#">알뜰쇼핑</a></li>
							<li><a href="#">금주혜택</a></li>
							<li>
								<form action="/shop/search" method="post">
									<input type="text" id="shop-search" name="search" placeholder="내 맘대로 골라담는 식단조절 도시락" />
									<button type="submit" id="btn-shop-search"></button>
									<button type="button" id="btn-shop-search-del" class="hide"></button>
								</form>
							</li>
							<li class="pl20 pr20"><a href="#"><img src="/static/front/img/shop/ico_delivery_setting.svg" /></a></li>
							<li class="pr20"><a href="#" data-toggle="tooltip" data-placement="bottom" data-original-title="" id="btn-basket"><img src="/static/front/img/shop/ico_cart.svg" /></a></li>
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
					<li><a href="#">등급별 혜택</a></li>
					<li><a href="#">레시피</a></li>
					<li><a href="#">베스트후기</a></li>
				</ul>
			</div>
			<div id="latest" class="hide">
				<button type="button" id="btn-latest-up">최근 본 상품 위로 올리기</button>
				<strong>최근 본 상품</strong>
				<div class="latest-wrap">
					<ul>
						<li><a href="#"><img src="/static/upload/img/shop/product/감자.jpg" /></a></li>
						<li><a href="#"><img src="/static/upload/img/shop/product/감자.jpg" /></a></li>
						<li><a href="#"><img src="/static/upload/img/shop/product/감자.jpg" /></a></li>
						<li><a href="#"><img src="/static/upload/img/shop/product/버섯.png" /></a></li>
						<li><a href="#"><img src="/static/upload/img/shop/product/정직한훈제란6구.PNG" /></a></li>
					</ul>
				</div>
				<button type="button" id="btn-latest-down">최근 본 상품 아래로 내리기</button>
			</div>
		</div>
		<a href="#" id="btn-page-top"><button type="button">맨 위로가기</button></a>
	</div>
</body>
</html>