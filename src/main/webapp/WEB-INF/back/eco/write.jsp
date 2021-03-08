<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<input type="hidden" id="active" value="28" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>에코포장피드백</h3>
</div>
<div class="w3-padding w3-white notranslate">
		<table class="table">
			<tr>
				<th scope="row">번호</th>
				<td>${dto. epno	}</td>
			</tr>
			<tr>
				<th scope="row">분류</th>
				<td>${dto. cname}</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td>${dto. title}</td>
			</tr>
			<tr>
				<th scope="row">상품명</th>
				<td>${dto. name}</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td>${dto.content }</td>
			</tr>
			<tr>
				<th scope="row">이미지</th>
				<td>
					리스트 보여주기
				</td>
			</tr>
			<tr>
				<th scope="row">작성일</th>
				<td>${dto.writedate }</td>
			</tr>
			<tr style="text-align:center">
				<td colspan="2"><button class="btn btn-primary" type="button" onclick="location.href='./'">목록</button></td>
			</tr>
		</table>
</div>