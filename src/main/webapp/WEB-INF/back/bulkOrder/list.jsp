<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" id="active" value="26" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>대량주문 문의</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<table class="table product-list">
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>키값</th>
					<th>이름</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>수령희망일</th>
					<th>배송지</th>
					<th>문의사항</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="i" value="${i}" />
				<c:forEach items="${list}" var="dto">
					<tr onclick="location.href='/admin/bulkOrder/detail?bono=${dto.bono}'" style="cursor: pointer">
						<td>${i}</td>
						<td>${dto.bono}</td>
						<td>${dto.name}</td>
						<td>${dto.phone}</td>
						<td>${dto.email}</td>
						<td>${dto.hopedate}</td>
						<td>${dto.ktype}</td>
						<td style="overflow: auto;">${dto.question}</td>
						<td>${dto.writedate}</td>
					</tr>
					<c:set var="i" value="${i + 1}" />
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>					
					<td colspan="9" class="text-center">
						<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>