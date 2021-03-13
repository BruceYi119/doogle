<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<input type="hidden" id="active" value="18" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>팝업관리</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<table class="table product-list">
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>키값</th>
					<th>제목</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>left</th>
					<th>top</th>
					<th>넓이</th>
					<th>높이</th>
					<th>활성화여부</th>
					<th>등록일</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="i" value="${i}" />
				<c:forEach items="${list}" var="dto">
					<tr onclick="location.href='/admin/popup/detail?puno=${dto.puno}'" style="cursor: pointer;">
						<td>${i}</td>
						<td>${dto.puno}</td>
						<td>${dto.title}</td>
						<fmt:parseDate value="${dto.start_date}" var="startdate" pattern="yyyy-MM-dd"/>
						<td><fmt:formatDate value="${startdate}" pattern="yyyy-MM-dd"/></td>
						<fmt:parseDate value="${dto.end_date}" var="enddate" pattern="yyyy-MM-dd"/>
						<td><fmt:formatDate value="${enddate}" pattern="yyyy-MM-dd"/></td>	
						<td>${dto.left}</td>
						<td>${dto.top}</td>
						<td>${dto.width}</td>
						<td>${dto.height}</td>
						<td>${dto.type}</td>
						<td>${dto.writedate}</td>
						<td>
							<a href="/admin/popup/mod?puno=${dto.puno}"><button type="button" class="btn btn-success">수정</button></a>
							<a href="/admin/popup/delete?puno=${dto.puno}"><button type="button" class="btn btn-danger">삭제</button></a>
						</td>
					</tr>
					<c:set var="i" value="${i + 1}" />
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>					
					<td colspan="12" class="text-center">
						<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
					</td>
				</tr>
				<tr>					
					<td colspan="12" class="text-center"><a href="/admin/popup/add"><button type="button" class="btn btn-primary">등록</button></a></td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>