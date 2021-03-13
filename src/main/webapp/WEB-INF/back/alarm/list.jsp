<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<input type="hidden" id="active" value="20" />
<div class="w3-white w3-padding notranslate fix mt-3">
<style>
	#send{ float:right; margin-bottom: 20px;}
</style>
	<h3>재입고알림</h3>
	<div>
	<button class="btn btn-info" id="send">문자 전송</button>
	</div>
</div>
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th>번호</th>
			<th>회원번호</th>
			<th>상품번호</th>
			<th>신청일</th>
			<th>상품명</th>
			<th>상품수량</th>
			<th>재입고알림</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="list" varStatus="status">
	<tr>
		<td>${list.ano}</td>
		<td class="mno">${list.mno}</td>
		<td class="pno">${list.pno}</td>
		<fmt:parseDate value="${list.writedate}" var="writedate" pattern="yyyy-MM-dd" /> 
		<td><fmt:formatDate value="${writedate}" pattern="yyyy-MM-dd" /></td>
		<td class="product">${list2[status.index].name}</td>
		<td>${list2[status.index].quantity}</td>
		<td>
			<button class="btn btn-success email" id="email">메일알림</button>
			<button class="btn btn-danger delete phone">문자알림</button>
		</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
<div id="page">
			<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
</div>

