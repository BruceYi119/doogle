<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="base_wrap" align="center">
	<div id="container">
		<ul>
			<c:set var="i" value="${i}" />
			<c:forEach var="dto" items="${elist}">
				<a href="${dto.link }"><li><img
						src="${flist[i-1].loc }${flist[i-1].name }"></li></a>
				<!-- 사진 클릭하면 해당 화면으로 넘어가도록 -->
				<c:set var="i" value="${i + 1}" />
			</c:forEach>
		</ul>
	</div>
</div>

