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
<title>Doogle admin</title>
<link rel="stylesheet" href="/static/core/css/bootstrap.min.css">
<link rel="stylesheet" href="/static/front/css/global.css">
<link rel="stylesheet" href="/static/back/css/admin.css">
<script defer type="text/javascript" src="/static/core/js/jquery-3.5.1.min.js"></script>
<script defer type="text/javascript" src="/static/core/js/bootstrap.min.js"></script>
<script defer type="text/javascript" src="/static/core/js/axios.min.js"></script>
<script defer type="text/javascript" src="/static/back/js/admin.js"></script>
<c:if test="${url eq '/paging'}"><script defer type="text/javascript" src="/static/back/js/pagination.js"></script></c:if>
<sitemesh:write property="head" /></head>
<body>
	<div id="wrap">
		<header>
			<nav class="navbar bg-dark navbar-dark navbar-expand-sm">
				<ul class="navbar-nav" id="menu">
					<li class="nav-item"><a class="nav-link" href="/">사이트 메인</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin">관리자 메인</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin/member">회원관리</a></li>
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