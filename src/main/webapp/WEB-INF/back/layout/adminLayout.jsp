<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/static/front/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/static/front/img/favicon.ico" type="image/x-icon" />
<title>Doogle admin</title>
<link rel="stylesheet" href="/static/core/css/bootstrap.min.css">
<c:if test="${edit eq 'edit'}"><link rel="stylesheet" href="/static/core/css/summernote-bs4.min.css"></c:if>
<link rel="stylesheet" href="/static/back/css/global.css">
<link rel="stylesheet" href="/static/back/css/admin.css">
<c:if test="${url eq '/admin/product' || url eq '/admin/product/add'}"><link rel="stylesheet" href="/static/back/css/product.css"></c:if>
<script defer type="text/javascript" src="/static/core/js/jquery-3.5.1.min.js"></script>
<c:if test="${edit eq 'edit'}"><script defer src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script></c:if>
<script defer type="text/javascript" src="/static/core/js/bootstrap.min.js"></script>
<script defer type="text/javascript" src="/static/core/js/axios.min.js"></script>
<c:if test="${edit eq 'edit'}"><script defer type="text/javascript" src="/static/core/js/summernote-bs4.min.js"></script></c:if>
<c:if test="${edit eq 'edit'}"><script defer type="text/javascript" src="/static/core/js/summernote-ko-KR.min.js"></script></c:if>
<c:if test="${edit eq 'edit'}"><script defer type="text/javascript" src="/static/back/js/edit.js"></script></c:if>
<script defer type="text/javascript" src="/static/back/js/admin.js"></script>
<c:if test="${url eq '/paging'}"><script defer type="text/javascript" src="/static/back/js/pagination.js"></script></c:if>
<c:if test="${url eq '/admin/category'}"><script defer type="text/javascript" src="/static/back/js/categoryList.js"></script></c:if>
<c:if test="${url eq '/admin/product/add'}"><script defer type="text/javascript" src="/static/back/js/productAdd.js"></script></c:if>
<sitemesh:write property="head" /></head>
<body>
	<div id="wrap">
		<header>
			<nav class="navbar bg-dark navbar-dark navbar-expand-sm">
				<ul class="navbar-nav" id="menu">
					<li class="nav-item"><a class="nav-link" href="/">사이트 메인</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin">메인</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin/member">회원</a></li>
					<li>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"></button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/admin/member">회원</a>
								<a class="dropdown-item" href="/admin/member/add">회원추가</a>
							</div>
						</div>						
					</li>
					<li class="nav-item"><a class="nav-link" href="/admin/category">카테고리</a></li>
					<li>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"></button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/admin/category">카테고리</a>
								<a class="dropdown-item" href="/admin/category/add">추가</a>
								<a class="dropdown-item" href="/admin/category/init">기본카테고리등록</a>
							</div>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="/admin/product">상품</a></li>
					<li>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"></button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/admin/product">상품</a>
								<a class="dropdown-item" href="/admin/product/add">등록</a>
							</div>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="/admin/order">주문</a></li>
					<li>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"></button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/admin/order">주문</a>
							</div>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="/admin/payment">결제</a></li>
					<li>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"></button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/admin/payment">결제</a>
							</div>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="/admin/file">파일</a></li>
					<li>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"></button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/admin/file">파일</a>
							</div>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="/admin/recipe">레시피</a></li>
					<li>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"></button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/admin/recipe">레시피</a>
							</div>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="/admin/event">이벤트</a></li>
					<li>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"></button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/admin/event">이벤트</a>
								<a class="dropdown-item" href="/admin/event/add">추가</a>
							</div>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="/admin/popup">팝업</a></li>
					<li>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"></button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/admin/popup">팝업</a>
								<a class="dropdown-item" href="/admin/popup/add">추가</a>
							</div>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="/admin/notice">공지</a></li>
					<li>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"></button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/admin/notice">공지</a>
								<a class="dropdown-item" href="/admin/notice/add">추가</a>
							</div>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="/admin/coupon">쿠폰</a></li>
					<li>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"></button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/admin/coupon">쿠폰</a>
								<a class="dropdown-item" href="/admin/coupon/add">추가</a>
								<a class="dropdown-item" href="/admin/coupon/myCoupon">회원쿠폰</a>
							</div>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="/admin/question">자주하는질문</a></li>
					<li>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"></button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/admin/question">자주하는질문</a>
								<a class="dropdown-item" href="/admin/question/add">추가</a>
							</div>
						</div>
					</li>
				</ul>
				<ul class="nav nav-pills" id="adminLoginInfo">
					<li class="nav-item"><a class="nav-link text-white" href="#">${name}님 환엽합니다!</a></li>
					<li class="nav-item"><a class="nav-link text-white" href="#">로그아웃</a></li>
<!-- 					<li class="nav-item"><a class="nav-link active disabled" href="#">Disabled</a></li> -->
				</ul>
			</nav>
		</header>
		<main>
			<div class="container-fluid"><sitemesh:write property="body" /></div>
		</main>
	</div>
</body>
</html>