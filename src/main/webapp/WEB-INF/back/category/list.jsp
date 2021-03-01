<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" id="active" value="4" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>카테고리관리</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>키값</th>
					<th>
						카테고리명
						<select name="type">
							<option value="">- 전체 -</option>
						<c:forEach items="${category}" var="map" varStatus="stats">
							<option value="${map.key}" <c:if test="${type eq map.key}">selected="selected"</c:if>>${map.value}</option>
						</c:forEach>
						</select>
					</th>
					<th>분류</th>
					<th>부모키값</th>
					<th>구분</th>
					<th>노출번호</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto">
					<tr>
						<th>${dto.ctno}</th>
						<th>${dto.name}</th>
						<th>${dto.lv}</th>
						<th>${dto.pctno}</th>
						<th>${dto.type}</th>
						<th>${dto.idx}</th>
						<th>${dto.writedate}</th>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7">
						<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>