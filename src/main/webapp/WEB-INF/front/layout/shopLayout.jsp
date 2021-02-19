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
<script defer type="text/javascript" src="/static/core/js/jquery-3.5.1.min.js"></script>
<c:if test="${edit eq 'edit'}"><script defer src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script></c:if>
<script defer type="text/javascript" src="/static/core/js/bootstrap.min.js"></script>
<script defer type="text/javascript" src="/static/core/js/axios.min.js"></script>
<c:if test="${edit eq 'edit'}"><script defer type="text/javascript" src="/static/core/js/summernote-bs4.min.js"></script></c:if>
<c:if test="${edit eq 'edit'}"><script defer type="text/javascript" src="/static/core/js/summernote-ko-KR.min.js"></script></c:if>
<c:if test="${edit eq 'edit'}"><script defer type="text/javascript" src="/static/front/js/edit.js"></script></c:if>
<c:if test="${url eq '/shop/product/form'}"><script defer type="text/javascript" src="/static/front/js/form.js"></script></c:if>
<sitemesh:write property="head" /></head>
</head>
<body>
	<div id="wrap">
		<header>
			<div id="main-banner"></div>
			<div class="wrap-container">
				<div id="top-banner">베너</div>
				<h1 id="home"><a href="/shop">Doogle 쇼핑</a></h1>
				<ul id="member-menu">
					<li><a href="/terms">회원가입</a></li>
					<li></li>
					<li><a href="/login">로그인</a></li>
					<li></li>
					<li><a href="#">고객센터</a></li>
				</ul>
				<ul id="main-menu">
					<li><a href="#">전체 카테고리</a></li>
					<li><a href="#">신상품</a></li>
					<li><a href="#">베스트</a></li>
					<li><a href="#">알뜰쇼핑</a></li>
					<li><a href="#">금주혜택</a></li>
				</ul>
			</div>
		</header>
		<nav>
			<div class="wrap-container">
				nav
			</div>
		</nav>
		<main>
			<div class="wrap-container"><sitemesh:write property="body" /></div>
		</main>
		<footer>
			<div class="wrap-container">
				<a href="#"><img src="/static/front/img/shop/footer_banner.png" id="footer-banner" /></a>
			</div>
		</footer>
	</div>
</body>
</html>