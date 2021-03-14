<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="searchForm">
	<input type="hidden" name="page" value="${page}" />
	<input type="hidden" name="searchTxt" value="${val}" />
	<input type="hidden" name="searchType" value="${type}" />
	<input type="hidden" name="display" value="${display}" />
</form>
<h5><c:if test="${type ne 'ERRATA'}">전체</c:if> ${title}${total}</h5>
<c:set var="searchType" value="${type}" />
<%-- <c:choose> --%>
<%--     <c:when test="${type eq 'IMAGE'}"> --%>
<%--     </c:when> --%>
<%--     <c:otherwise> --%>
<!-- 		<ul class="sort"> -->
<!-- 			<li><a href="#" id="sort1">정확도</a></li> -->
<!-- 			<li><a href="#" id="sort2">최신순</a></li> -->
<!-- 			<li><a href="#" id="sort3">추천순</a></li> -->
<!-- 		</ul> -->
<%--     </c:otherwise> --%>
<%-- </c:choose> --%>
<ul class="list">
	<c:choose>
	    <c:when test="${type eq 'BOOK'}">
			책
	    </c:when>
	    <c:when test="${type eq 'MOVIE'}">
	    	<c:forEach items="${list}" var="data">
			<li class="movie">
				<p><a href="${data.get('link')}" target="_blank"><img src="${data.get('image')}" /></a></p>
				<dl>
					<dt><a href="${data.get('link')}" target="_blank"><strong>${data.get('title')}</strong> (${data.get('subtitle')})</a></dt>
					<dd class="point">
						<span class="star"><em class="view_star" style="width:${data.get('userRating')}"></em></span><em class="num">${data.get('userRating')}</em>
					</dd>
					<dd class="etc">${data.get('pubDate')}</dd>
					<dd class="etc">감독 : ${data.get('director')} 출연 : ${data.get('actor')}</dd>
				</dl>
			</li>
			</c:forEach>
	    </c:when>
	    <c:when test="${type eq 'LOCAL'}">
			지역
	    </c:when>
	    <c:when test="${type eq 'ERRATA'}">
			<span>입력값 : ${val} / 맞춤법 : ${errata}</span>
	    </c:when>
	    <c:when test="${type eq 'IMAGE'}">
	    	<c:forEach items="${list}" var="data">
			<li class="image">
				<a href="${data.get('link')}" link="${data.get('link')}"><img src="${data.get('thumbnail')}" /></a>
			</li>
			</c:forEach>
	    </c:when>
	    <c:when test="${type eq 'SHOP'}">
			쇼핑
	    </c:when>
	    <c:otherwise>
			<c:forEach items="${list}" var="data">
			<li>
				<dl>
					<dt><a href="${data.get('link')}" target="_blank">${data.get("title")}</a></dt>
					<dd>${data.get("description")}</dd>
				</dl>
			</li>
			</c:forEach>
	    </c:otherwise>
	</c:choose>
</ul>
<div class="moreWrap"><a href="#" id="more">더보기</a></div>