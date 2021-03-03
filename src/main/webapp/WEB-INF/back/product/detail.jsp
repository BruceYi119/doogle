<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" id="active" value="6" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>상품수정</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<table class="table product-mod">
			<tbody>
				<tr>
					<td class="w150">브랜드</td>
					<td>${dto.brand}</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td>${dto.name}</td>
				</tr>
				<tr>
					<td>부제목</td>
					<td>${dto.subject}</td>
				</tr>
				<tr>
					<td>판매단위</td>
					<td>${dto.sel_unit}</td>
				</tr>
				<tr>
					<td>중량/용량</td>
					<td>${dto.weight}</td>
				</tr>
				<tr>
					<td>포장타입</td>
					<td>${dto.cpack_type}</td>
				</tr>
				<tr>
					<td>안내사항</td>
					<td>${dto.info}</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>${dto.price}</td>
				</tr>
				<tr>
					<td>할인율</td>
					<td>${dto.discount} %</td>
				</tr>
				<tr>
					<td>할인여부</td>
					<td>${dto.cdis_yn}</td>
				</tr>
				<tr>
					<td>적립율</td>
					<td>${dto.earn}</td>
				</tr>
				<tr>
					<td>적립여부</td>
					<td>${dto.cearn_yn}</td>
				</tr>
				<tr>
					<td>분류</td>
					<td>${dto.ctno}</td>
				</tr>
				<tr>
					<td>두글만팜</td>
					<td>${dto.conly_yn}</td>
				</tr>
				<tr>
					<td>최저가</td>
					<td>${dto.cod_yn}</td>
				</tr>
				<tr>
					<td>상품이미지</td>
					<td>
						<c:forEach items="${flist}" var="fdto">
							<img src="${fdto.loc}${fdto.name}" />
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>수량</td>
					<td>${dto.quantity} 개</td>
				</tr>
				<tr>
					<td>판매여부</td>
					<td>${dto.csel_yn}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" class="text-center">
						<a href="/admin/product/mod?pno=${dto.pno}"><button type="button" class="btn btn-success">수정</button></a>
						<button type="button" class="btn btn-danger">삭제</button>
						<a href="/admin/product"><button type="button" class="btn btn-warning">리스트</button></a>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>