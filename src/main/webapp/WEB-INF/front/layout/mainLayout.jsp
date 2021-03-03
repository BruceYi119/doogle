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
<link rel="stylesheet" href="/static/front/css/layout.css">
<link rel="stylesheet" href="/static/front/css/main.css">
<c:if test="${url eq '/map'}"><link rel="stylesheet" href="/static/front/css/kakao_map.css"></c:if>
<c:if test="${url eq '/calendar'}"><link rel="stylesheet" href="/static/front/css/calendar.css"></c:if>
<c:if test="${url eq '/terms' || url eq '/join' || url eq '/login' || url eq '/member/info'}"><link rel="stylesheet" href="/static/front/css/member.css"></c:if>
<script defer type="text/javascript" src="/static/core/js/jquery-3.5.1.min.js"></script>
<c:if test="${edit eq 'edit'}"><script defer src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script></c:if>
<script defer type="text/javascript" src="/static/core/js/bootstrap.min.js"></script>
<script defer type="text/javascript" src="/static/core/js/axios.min.js"></script>
<c:if test="${edit eq 'edit'}"><script defer type="text/javascript" src="/static/core/js/summernote-bs4.min.js"></script></c:if>
<c:if test="${edit eq 'edit'}"><script defer type="text/javascript" src="/static/core/js/summernote-ko-KR.min.js"></script></c:if>
<c:if test="${edit eq 'edit'}"><script defer type="text/javascript" src="/static/front/js/edit.js"></script></c:if>
<script defer type="text/javascript" src="/static/front/js/global.js"></script>
<script defer type="text/javascript" src="/static/front/js/main.js"></script>
<c:if test="${url eq '/map'}"><script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${apikey}&libraries=services"></script></c:if>
<c:if test="${url eq '/map'}"><script defer type="text/javascript" src="/static/front/js/kakao_map.js"></script></c:if>
<c:if test="${url eq '/calendar'}"><script defer type="text/javascript" src="/static/front/js/calendar.js"></script></c:if>
<c:if test="${url eq '/terms'}"><script defer type="text/javascript" src="/static/front/js/terms.js"></script></c:if>
<c:if test="${url eq '/join'}"><script defer type="text/javascript" src="/static/front/js/join.js"></script></c:if>
<c:if test="${url eq '/login'}"><script defer type="text/javascript" src="/static/front/js/login.js"></script></c:if>
<c:if test="${url eq '/member/info'}"><script defer type="text/javascript" src="/static/front/js/member_info.js"></script></c:if>
<c:if test="${url eq '/test/edit'}"><script defer type="text/javascript" src="/static/front/js/test.js"></script></c:if>
<sitemesh:write property="head" /></head>
<body>
	<div id="wrap">
		<header>
			<div class="base_wrap">
				<h1 id=logo>
					<a href="/"><span>Doogle</span></a>
				</h1>
				<c:if test="${id ne null}">
				<ul id="member">
					<li><a href="/member/info">${name}</a> 님 환영합니다!</li>
					<li><a href="/member/info">회원정보</a></li>
					<li><a href="/logout">로그아웃</a></li>
				</ul>
				</c:if>
				<c:if test="${empty id}">
				<ul id="member">
					<li><a href="/login">로그인</a></li>
					<li><a href="/terms">회원가입</a></li>
				</ul>
				</c:if>
				<div class="search_wrap">
					<div class="search_event_wrap">
						<input type="text" id="search" placeholder="검색" value="" />
						<button class="btn btn-success" id="btn_search">검색</button>
						<select class="custom-select hide" id="searchType">
							<option value="NEWS" selected="selected">뉴스</option>
							<option value="BLOG">블로그</option>
							<option value="BOOK">책</option>
							<option value="ENCYC">백과사전</option>
							<option value="MOVIE">영화</option>
							<option value="CAFE">카페글</option>
							<option value="KIN">지식iN</option>
							<option value="LOCAL">지역</option>
							<option value="ERRATA">오타변환</option>
							<option value="WEBKR">웹문서</option>
							<option value="IMAGE">이미지</option>
							<option value="SHOP">쇼핑</option>
							<option value="DOC">전문자료</option>
						</select>
					</div>
				</div>
			</div>
		</header>
		<nav>
			<div class="base_wrap">
				<ul id="menu">
					<li><a href="/admin">관리자</a></li>
					<li><a href="/shop">쇼핑</a></li>
					<li><a href="/map">카카오맵</a></li>
					<li><a href="/calendar">달력</a></li>
		<!-- 			<li><a href="/view/wooram/wooramtrans.jsp">번역기</a></li> -->
		<!-- 			<li><a href="/view/minkyu/minkyu.jsp">금융(투자정보)</a></li> -->
		<!-- 			<li><a href="/view/heesoo/main/index.jsp">갈비대첩</a></li> -->
		<!-- 			<li><a href="/view/yongsoon/pcEstimate.jsp">뚝딱조립PC</a></li> -->
		<!-- 			<li><a href="/view/jiwon/recipe_list.jsp">레시피</a></li> -->
		<!-- 			<li><a href="/view/wooram/list.jsp">애완동물카페</a></li> -->
		<!-- 			<li><a href="/view/henry/henry.jsp">핸리</a></li> -->
				</ul>
			</div>
		</nav>
		<main>
			<div class="base_wrap"><sitemesh:write property="body" /></div>
    	</main>
		<footer>
			<div class="base_wrap">
				<p id="copyright">Copyright 2021 1team.</p>
			</div>
		</footer>
		<div id="darkMode">
			<button type="button">다크 모드</button>
		</div>
		<div id="imageView" class="hide"></div>
	</div>
</body>
</html>