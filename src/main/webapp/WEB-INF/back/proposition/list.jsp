<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" id="active" value="27" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>상품제안</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>키값</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="i" value="${i}" />
				<c:forEach items="${list}" var="dto">
					<tr onclick="location.href='/admin/proposition/detail?ppno=${dto.ppno }'" style="cursor: pointer">
						<td>${i}</td>
						<td>${dto.ppno}</td>
						<td>[${dto.name}]</td>
						<td>${dto.title}</td>
						<td>작성자</td>
						<td>${dto.writedate}</td>
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
			</tfoot>
		</table>
	</div>
</div>