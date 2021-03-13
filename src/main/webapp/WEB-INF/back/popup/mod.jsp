<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<input type="hidden" id="active" value="18" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>팝업추가</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<form action="/admin/popup/mod/ok"  method="post">
			<input type="hidden" name="puno" value="${pudto.puno }"/>
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" value="${pudto.title}"><td>
				</tr>
				<tr>
					<td>시작일</td>
					<fmt:parseDate value="${pudto.start_date}" var="startdate" pattern="yyyy-MM-dd"/>
					<td><input type="text" name="start_date" value="<fmt:formatDate value="${startdate}" pattern="yyyy-MM-dd"/>"><td>
				</tr>
				<tr>
					<td>종료일</td>
					<fmt:parseDate value="${pudto.end_date}" var="enddate" pattern="yyyy-MM-dd"/>
					
					<td><input type="text" name="end_date" value=<fmt:formatDate value="${enddate}" pattern="yyyy-MM-dd"/>><td>
				</tr>
				<tr>
					<td>left</td>
					<td><input type="text" name="left" value="${pudto.left }"><td>
				</tr>
				<tr>
					<td>right</td>
					<td><input type="text" name="right" value="${pudto.right }"><td>
				</tr>
				<tr>
					<td>top</td>
					<td><input type="text" name="top" value="${pudto.top }"><td>
				</tr>
				<tr>
					<td>bottom</td>
					<td><input type="text" name="bottom" value="${pudto.bottom }"><td>
				</tr>
				<tr>
					<td>넓이</td>
					<td><input type="text" name="width" value="${pudto.width }"><td>
				</tr>
				<tr>
					<td>높이</td>
					<td><input type="text" name="height" value="${pudto.height }"><td>
				</tr>
				<tr>
					<td>활성화여부</td>
					<td><input type="text" name="type" value="${pudto.type }"><td>
				</tr>
				<tr>
					<td>내용</td> <!-- summer 붙이기 -->
					<td style="height:500px;"><textarea id="summernote" name="content">${pudto.content }</textarea><td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<button type="submit" class="btn btn-success">수정</button>
						<a href="/admin/popup/content?puno=${edto.puno}"><button type="button" class="btn btn-secondary">취소</button></a>
						<a href="/admin/popup"><button type="button" class="btn btn-warning">리스트</button></a>
					<td>
				</tr>
			</table>	
		</form>
	</div>
</div>