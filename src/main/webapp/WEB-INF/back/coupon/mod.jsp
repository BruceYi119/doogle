<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" id="active" value="22" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>쿠폰수정</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<form method="post" action="/admin/coupon/mod/ok" enctype="multipart/form-data">
			<input type="hidden" name="cno" value="${dto.cno}" />
			<table class="table product-mod">
					<tr>
						<td>쿠폰번호</td>
						<td>${dto.cno}</td>
					</tr>
					
					<tr>	
						<td>상품번호</td>
						<td><input type="text" name="pno" label="상품번호" value="${dto.pno}"></td>
					</tr>	
						
					<tr>
						<td>쿠폰내용</td>
						<td><input type="text" name="content" label="쿠폰내용" value="${dto.content}"></td>
					</tr>	
					
					<tr>
						<td>할인율</td>
						<td><input type="text" name="discount" label="할인율" value="${dto.discount}"></td>
					</tr>	
					
					<tr>
						<td>할인금액</td>
						<td><input type="text" name="dis_price" label="할인금액" value="${dto.dis_price}"></td>
					</tr>
					
					<tr>	
						<td>할인구분(d:할인율 / p:할인금액 / a:둘다포함)</td>
						<td><input type="text" name="dis_type" label="할인구분" value="${dto.dis_type}"></td>
					</tr>	
						
					<tr>	
						<td>유효기간(시작일)</td>
						<td><input type="text" name="srat_expiry" label="유효기간 시작일" value="${dto.srat_expiry}"></td>
					</tr>	
					
					<tr>	
						<td>유효기간(만료일)</td>
						<td><input type="text" name="end_expiry" label="유효기간 만료일" value="${dto.end_expiry}"></td>
					</tr>
		<tfoot>
					<tr>
						<td colspan="2" class="text-center">
							<button type="submit" class="btn btn-success">수정</button>
							<a href="/admin/coupon/mod?pno=${dto.pno}"><button type="button" class="btn btn-secondary">취소</button></a>
							<a href="/admin/coupon/list"><button type="button" class="btn btn-warning">리스트</button></a>
						</td>
					</tr>
		</tfoot>
		</table>
		</form>
	</div>
</div>
	