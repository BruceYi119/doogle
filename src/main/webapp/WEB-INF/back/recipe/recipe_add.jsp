<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>레시피추가</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<form action="/admin/recipe/add/ok"  method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title"><td>
				</tr>
				<tr>
					<td>레시피 분류</td>
					<td class="product-select">
						<select name="ctno">
							<c:forEach items="${clist}" var="dto"><option value="${dto.ctno}">${dto.name}</option></c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="name" value=""><td> <!-- value 로그인 아이디 -->
				</tr>
				<tr>
					<td>내용<p>(내용사진과<p>대표사진은<p>별개)</td> <!-- summer 붙이기 -->
					<td><textarea id="summernote" name="content"></textarea><td>
				</tr>
				<tr>
					<td>대표사진</td>
					<td><input type="file" name="files"><td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="저장하기"><td>
				</tr>
			</table>	
		</form>
	</div>
</div>