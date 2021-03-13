<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>레시피 수정</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<form action="/admin/recipe/mod/ok"  method="post" enctype="multipart/form-data">
			<input type="hidden" name="rno" value="${rdto.rno }"/>
			<table class="table product-mod">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" value="${rdto.title }"><td>
				</tr>
				<tr>
					<td>레시피 분류</td>
					<td class="product-select">
						<select name="ctno">
							<c:forEach items="${clist}" var="dto"><option value="${dto.ctno}" selected="${rdto.ctno }">${dto.name}</option></c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="name" value="${rdto.name }" readonly="readonly" style="background:none;border: none;color:black;"><td> <!-- value 로그인 아이디 -->
				</tr>
				<tr>
					<td>대표사진</td>
					<td>
					<input type="hidden" name="fno" value="${rdto.fno }"/>
					<p><img src="${fdto.loc}${fdto.name}" /></p>
					<input type="file" name="files"><td>
				</tr>
				<tr>
					<td>내용<p>(내용사진과<p>대표사진은<p>별개)</td> <!-- summer 붙이기 -->
					<td style="height:600px;"><textarea id="summernote" name="content" >${rdto.content }</textarea><td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<button type="submit" class="btn btn-success">수정</button>
						<a href="/admin/recipe/detail?rno=${rdto.rno}"><button type="button" class="btn btn-secondary">취소</button></a>
						<a href="/admin/recipe"><button type="button" class="btn btn-warning">리스트</button></a>
					<td>
				</tr>
			</table>	
		</form>
	</div>
</div>