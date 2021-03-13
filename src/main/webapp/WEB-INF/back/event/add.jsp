<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<input type="hidden" id="active" value="6" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>이벤트 추가</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<form action="/admin/event/add/ok"  method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>메인사진</td>
					<td><input type="file" name="files"><td>
				</tr>
				<tr>
					<td>내용</td> <!-- summer 붙이기 -->
					<td><textarea id="summernote" name="content"></textarea><td>
				</tr>
				<tr>
					<td>링크</td>
					<td><input type="text" name="link"><td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="저장하기"><td>
				</tr>
			</table>	
		</form>
	</div>
</div>