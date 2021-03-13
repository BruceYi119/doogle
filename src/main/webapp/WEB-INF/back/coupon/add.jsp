<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" id="active" value="22" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>쿠폰등록</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
	<form method="post" action="/admin/coupon/add_ok" enctype="multipart/form-data">
		<table class="table product-list">
				<tr>
					<td>쿠폰번호</td>
					<td><input type="text" name="cno" label="쿠폰번호" placeholder="쿠폰번호"></td>
				</tr>
				
				<tr>	
					<td>상품번호</td>
					<td><input type="text" name="pno" label="상품번호" placeholder="상품번호(없으면 0)" onfocus="this.value=0"></td>
				</tr>	
					
				<tr>
					<td>쿠폰내용</td>
					<td><input type="text" name="content" label="쿠폰내용" placeholder="쿠폰내용"></td>
				</tr>	
				
				<tr>
					<td>할인율</td>
					<td><input type="text" name="discount" label="할인율" placeholder="할인율"></td>
				</tr>	
				
				<tr>
					<td>할인금액</td>
					<td><input type="text" name="dis_price" label="할인금액" placeholder="할인금액"></td>
				</tr>
				
				<tr>	
					<td>할인구분</td>
					<td><input type="text" name="dis_type" label="할인구분" placeholder="할인구분"> ( d:할인율 / p:할인금액 / a:둘다포함 )</td>
				</tr>	
					
				<tr>	
					<td>유효기간(시작일)</td>
					<td><input type="date" name="srat_expiry" label="유효기간 시작일"></td>
				</tr>	
				
				<tr>	
					<td>유효기간(만료일)</td>
					<td><input type="date" name="end_expiry" label="유효기간 만료일"></td>
				</tr>
		</table>
		<button type="submit">신규쿠폰 등록</button>
	</form>
	</div>
</div>