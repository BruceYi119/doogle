<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>이벤트 수정</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<form action="/admin/event/mod/ok"  method="post" enctype="multipart/form-data">
			<input type="hidden" name="eno" value="${edto.eno }"/>
			<table class="table product-mod">
				<tr>
					<td>메인이미지</td>
					<td>
						<input type="hidden" name="fno_main" value="${edto.fno_main }"/>
						<p><img src="${fdto.loc}${fdto.name}" /></p>
						<input type="file" name="files">
					<td>
				</tr>
				<tr>
					<td>링크</td>
					<td><input type="text" name="link" value="${edto.link}"><td>
				</tr>
				<tr>
					<td>내용</td> <!-- summer 붙이기 -->
					<td style="height:600px;"><textarea id="summernote" name="content" >${edto.content }</textarea><td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<button type="submit" class="btn btn-success">수정</button>
						<a href="/admin/event/detail?eno=${edto.eno}"><button type="button" class="btn btn-secondary">취소</button></a>
						<a href="/admin/event"><button type="button" class="btn btn-warning">리스트</button></a>
					<td>
				</tr>
			</table>	
		</form>
	</div>
</div>