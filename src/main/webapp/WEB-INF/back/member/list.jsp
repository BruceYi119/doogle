<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" id="active" value="2" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>회원관리</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>키값</th>
					<th>아이디</th>
					<th>이름</th>
					<th>핸드폰</th>
					<th>생일</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>상세주소</th>
					<th>이메일</th>
					<th>회원구분</th>
					<th>탈퇴여부</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.mno}</td>
						<td>${dto.id}</td>
						<td>${dto.name}</td>
						<td>${dto.phone}</td>
						<td>${dto.birth}</td>
						<td>${dto.zipcode}</td>
						<td>${dto.addr}</td>
						<td>${dto.addr_detail}</td>
						<td>${dto.email}</td>
						<td>${dto.mtype}</td>
						<td>${dto.del_yn}</td>
						<td>${dto.writedate}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="12">
						<ul class="pagination justify-content-center" id="pageWrap">
<!-- 							페이징 영역 -->
<!-- 							<li class="page-item disabled"><a class="page-link" href="#">Prev</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">Next</a></li> -->
						</ul>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>