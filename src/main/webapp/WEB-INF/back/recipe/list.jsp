<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<h3>레시피</h3>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>등록번호</th>
					<th>
						글분류
						<select name="ctno" onchange="if(this.value) location.href=(this.value);">
							<option value="">- 선택 -</option>
							<option value="/admin/recipe"> 전체보기 </option>
							<option value="/admin/recipe?ctno=135"> 매일밥상 </option>
							<option value="/admin/recipe?ctno=136"> 특별한날 </option>
							<option value="/admin/recipe?ctno=137"> 간단요리 </option>
						</select>
					</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
					<th>수정 또는 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="i" value="${i}" />
				<c:forEach items="${list}" var="dto">
					<tr onclick="location.href='/admin/recipe/detail?rno=${dto.rno}'" style="cursor: pointer;">
						<td>${i}</td>
						<td>${dto.rno}</td>
						<c:if test="${dto.ctno==135}">
						<td>매일밥상</td>
						</c:if>
						<c:if test="${dto.ctno==136}">
						<td>특별한날</td>
						</c:if>
						<c:if test="${dto.ctno==137}">
						<td>간단요리</td>
						</c:if>
						<td>${dto.title}</td>
						<td>${dto.read_cnt}</td>
						<td>${dto.writedate}</td>
						<td>
							<a href="/admin/recipe/mod?rno=${dto.rno}"><button type="button" class="btn btn-success">수정</button></a>
							<a href="/admin/recipe/delete?rno=${dto.rno}"><button type="button" class="btn btn-danger">삭제</button></a>
						</td>
					</tr>
					<c:set var="i" value="${i + 1}" />
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7">
						<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
					</td>
				</tr>
				<tr>					
					<td colspan="7" class="text-center"><a href="/admin/recipe/add"><button type="button" class="btn btn-primary">등록</button></a></td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>