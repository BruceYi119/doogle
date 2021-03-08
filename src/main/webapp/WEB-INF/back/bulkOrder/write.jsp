<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<input type="hidden" id="active" value="26" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>상품제안</h3>
</div>
<div class="w3-padding w3-white notranslate">
		<table class="table">
			<tr>
				<th scope="row">번호</th>
				<td>${dto.bono}</td>
			</tr>
			<tr>
				<th scope="row">신청자 이름</th>
				<td>${dto.name}</td>
			</tr>
			<tr>
				<th scope="row">신청자 연락처</th>
				<td>${dto.phone}</td>
			</tr>
			<tr>
				<th scope="row">신청자 이메일</th>
				<td>${dto.email }</td>
			</tr>
			<tr>
				<th scope="row">수령희망일</th>
				<td>${dto.hopedate }</td>
			</tr>
			<tr>
				<th scope="row">배송지</th>
				<td>${dto.type }</td>
			</tr>
			<tr>
				<th scope="row">문의사항</th>
				<td>${dto.question }</td>
			</tr>
			<tr>
				<th scope="row">작성일</th>
				<td>${dto. writedate }</td>
			</tr>
			<tr style="text-align:center">
				<td colspan="2"><button class="btn btn-primary" type="button" onclick="location.href='./'">목록</button></td>
			</tr>
		</table>
</div>