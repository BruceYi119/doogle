<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" id="active" value="6" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>상품관리</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>키값</th>
					<th>브랜드</th>
					<th>상품명</th>
					<th>상품부제목</th>
					<th>판매단위</th>
					<th>중량/용량</th>
					<th>포장타입</th>
					<th>안내사항</th>
					<th>가격</th>
					<th>할인율</th>
					<th>할인여부</th>
					<th>적립율</th>
					<th>적립여부</th>
					<th>대분류</th>
					<th>중분류</th>
					<th>소분류</th>
					<th>두글만팜</th>
					<th>최저가</th>
					<th>이미지</th>
					<th>수량</th>
					<th>판매여부</th>
					<th>등록일</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="i" value="${i}" />
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${i}</td>
						<td>${dto.pno}</td>
						<th>${dto.brand}</td>
						<td><a href="/admin/product/detail?pno=${dto.pno}">${dto.name}</a></td>
						<td>${dto.subject}</td>
						<td>${dto.sel_unit}</td>
						<td>${dto.weight}</td>
						<td>${dto.cpack_type}</td>
						<td>${dto.info}</td>
						<td>${dto.price}</td>
						<td>${dto.discount}</td>
						<td>${dto.cdis_yn}</td>
						<td>${dto.earn}</td>
						<td>${dto.cearn_yn}</td>
						<td>${dto.ctno}</td>
						<td>${dto.ctno1}</td>
						<td>${dto.ctno2}</td>
						<td>${dto.conly_yn}</td>
						<td>${dto.cod_yn}</td>
						<td>${dto.fno}</td>
						<td>${dto.quantity}</td>
						<td>${dto.csel_yn}</td>
						<td>${dto.writedate}</td>
						<td>
							<a href="/admin/product/mod?pno=${dto.pno}"><button type="button" class="btn btn-success">수정</button></a>
							<a href="#"><button type="button" class="btn btn-danger">삭제</button></a>
						</td>
					</tr>
					<c:set var="i" value="${i + 1}" />
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>					
					<td colspan="24" class="text-center">
						<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
					</td>
				</tr>
				<tr>					
					<td colspan="24" class="text-center"><a href="/admin/product/add"><button type="button" class="btn btn-primary">등록</button></a></td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>