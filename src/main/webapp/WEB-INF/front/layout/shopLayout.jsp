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
<script defer type="text/javascript" src="/static/core/js/jquery-3.5.1.min.js"></script>
<c:if test="${edit eq 'edit'}"><script defer src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script></c:if>
<script defer type="text/javascript" src="/static/core/js/bootstrap.min.js"></script>
<script defer type="text/javascript" src="/static/core/js/axios.min.js"></script>
<script defer type="text/javascript" src="/static/front/js/shopGlobal.js"></script>
<c:if test="${edit eq 'edit'}"><script defer type="text/javascript" src="/static/core/js/summernote-bs4.min.js"></script></c:if>
<c:if test="${edit eq 'edit'}"><script defer type="text/javascript" src="/static/core/js/summernote-ko-KR.min.js"></script></c:if>
<c:if test="${edit eq 'edit'}"><script defer type="text/javascript" src="/static/front/js/edit.js"></script></c:if>
<c:if test="${url eq '/shop/product/form'}"><script defer type="text/javascript" src="/static/front/js/form.js"></script></c:if>
<c:if test="${url eq 'main'}"><script defer type="text/javascript" src="/static/front/js/shop.js"></script></c:if>
<sitemesh:write property="head" /></head>
<body>
	<div id="wrap">
		<header>
			<div id="main-banner">
				<div class="wrap-container">
					<a href="#">지금 가입하고 인기상품 <b>100원에 받아가세요!</b><img src="/static/front/img/shop/ico_arrow.webp" /></a>
					<button type="button" id="btn-main-banner-close">가입하고 혜택받기</button>
				</div>
			</div>
			<div class="wrap-container">
				<div id="top-banner"><a href="#"><img src="/static/front/img/shop/img_courier.webp" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송" /></a></div>
				<h1 id="home"><a href="/shop">Doogle 쇼핑</a></h1>
				<ul id="member-menu">
					<li><a href="/terms">회원가입</a></li>
					<li></li>
					<li><a href="/login">로그인</a></li>
					<li></li>
					<li><a href="#" class="before">고객센터</a></li>
				</ul>
				<nav>
					<div class="wrap-container">
						<ul id="main-menu">
							<li>
								<a href="#">전체 카테고리</a>
								<ul id="product-menu"  class="hide">
									<li>
										<ul>	
											<c:forEach items="${clist}" var="dto"><li><a href="#">${dto.name}</a></li></c:forEach>
										</ul>
									</li>
									<li class="hide">
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
									<button type="button" id="btn-shop-search-del"></button>
								</form>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</header>
		<main>
			<sitemesh:write property="body" />
			<div id="qnb">
				<div class="pb7">
					<a href="#"><img src="/static/front/img/shop/img_qnb.webp" /></a>
				</div>
				<div class="pb7">
					<ul>
						<li><a href="#">등급별 혜택</a></li>
						<li><a href="#">레시피</a></li>
						<li><a href="#">베스트후기</a></li>
					</ul>
				</div>
				<div id="latest">
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
		</main>
		<footer>
			풋터
		</footer>
		<a href="#" id="btn-page-top"><button type="button">맨 위로가기</button></a>
	</div>
</body>
</html>