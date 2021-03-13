<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" id="active" value="16" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>이벤트관리</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<table class="table product-list">
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>키값</th>
					<th>내용</th>
					<th>링크주소</th>
					<th>등록일</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="i" value="${i}" />
				<c:forEach items="${list}" var="dto">
					<tr onclick="location.href='/admin/event/detail?eno=${dto.eno}'" style="cursor: pointer;">
						<td>${i}</td>
						<td>${dto.eno}</td>
						<td>${dto.content}</td>
						<td><a href="${dto.link}">${dto.link}</a></td>
						<td>${dto.writedate}</td>
						<td>
							<a href="/admin/event/mod?eno=${dto.eno}"><button type="button" class="btn btn-success">수정</button></a>
							<a href="/admin/event/delete?eno=${dto.eno}"><button type="button" class="btn btn-danger">삭제</button></a>
						</td>
					</tr>
					<c:set var="i" value="${i + 1}" />
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>					
					<td colspan="6" class="text-center">
						<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
					</td>
				</tr>
				<tr>					
					<td colspan="6" class="text-center"><a href="/admin/event/add"><button type="button" class="btn btn-primary">등록</button></a></td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>