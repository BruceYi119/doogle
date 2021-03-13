<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<input type="hidden" id="active" value="20" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>공지관리</h3>
</div>
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>수정/삭제</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="list">
			<tr>
				<c:if test="${list.state==1}">
					<td>공지</td>
				<input type="hidden" value="${list.nno}" class="nnum">
				</c:if>
				<c:if test="${list.state==0}">
				<input type="hidden" value="${list.nno}" class="nnum">
					<td class="NNo">${list.nno}</td>
				</c:if>
				<td class="viewRow">${list.title}</td>
				<td>${list.name}</td>
				<td><fmt:parseDate value="${list.writedate}" var="writedate"
						pattern="yyyy-MM-dd" /> <fmt:formatDate value="${writedate}"
						pattern="yyyy-MM-dd" /></td>
				<td>${list.read_cnt}</td>
				<td>
					<button class="btn btn-success update">수정</button>
					<button class="btn btn-danger delete">삭제</button>
			</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div id="page">
			<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
</div>
