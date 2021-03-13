<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.qna_answer {
	display: none;
	text-align: center;
}
</style>
<input type="hidden" id="active" value="24" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>자주하는질문관리</h3>
</div>

<table class="table">
	<thead class="thead-dark">
		<tr>
			<th>번호</th>
			<th>카테고리 
			<select onchange="if(this.value) location.href=(this.value);">
					<option value="">선택</option>
					<option value="/admin/question">전체</option>
					<option value="/admin/question?ctno=217">회원문의</option>
					<option value="/admin/question?ctno=218">주문결제</option>
					<option value="/admin/question?ctno=219">취소/교환/반품</option>
					<option value="/admin/question?ctno=220">배송문의</option>
					<option value="/admin/question?ctno=221">쿠폰/적립금</option>
					<option value="/admin/question?ctno=222">서비스 이용 및 기타</option>
			</select>
			</th>
			<th>제목</th>
			<th>수정/삭제</th>
		</tr>
	</thead>
	<c:forEach items="${list}" var="list">
		<c:if test="${list.type eq 'y'}">
			<tr class="qna">
				<td class="td1">${list.qno}</td>
				<c:if test="${list.ctno==217}">
					<td id="td1">회원문의</td>
				</c:if>
				<c:if test="${list.ctno==218}">
					<td id="td2">주문/결제</td>
				</c:if>
				<c:if test="${list.ctno==219}">
					<td id="td2">취소/교환/반품</td>
				</c:if>
				<c:if test="${list.ctno==220}">
					<td id="td2">배송문의</td>
				</c:if>
				<c:if test="${list.ctno==221}">
					<td id="td2">쿠폰/적립금</td>
				</c:if>
				<c:if test="${list.ctno==222}">
					<td id="td2">서비스 이용 및 기타</td>
				</c:if>
				<td style="cursor: pointer" id="td3">${list.title}</td>
				<td>
					<button type="button" class="btn btn-success" name="up">수정</button>
					<%-- <a href="questionUpdate?qno=${list.qno}"> --%>
					<button type="button" class="btn btn-danger delete" name="del">삭제</button>
				</td>
			</tr>
			<tr class="qna_answer">
				<td colspan="5">${list.content}</td>
			</tr>
		</c:if>
	</c:forEach>
</table>
<div id="page">
	<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
</div>