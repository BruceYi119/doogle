<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" id="active" value="6" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>상품등록</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<form action="/admin/product/add/ok" method="post" enctype="multipart/form-data">
			<table class="table">
				<tbody>
					<tr>
						<td class="w150">브랜드</td>
						<td><input type="text" name="brand" /></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td><input type="text" name="name" /></td>
					</tr>
					<tr>
						<td>부제목</td>
						<td><input type="text" name="subject" /></td>
					</tr>
					<tr>
						<td>판매단위</td>
						<td><input type="text" name="sel_unit" /></td>
					</tr>
					<tr>
						<td>중량/용량</td>
						<td><input type="text" name="weight" /></td>
					</tr>
					<tr>
						<td>포장타입</td>
						<td>
							기타 <input type="radio" value="d" name="pack_type" checked="checked" />
							상온 <input type="radio" value="r" name="pack_type" />
							냉장 <input type="radio" value="c" name="pack_type" />
							냉동 <input type="radio" value="f" name="pack_type" />
						</td>
					</tr>
					<tr>
						<td>안내사항</td>
						<td><textarea name="info" class="w500 h300 p10"></textarea></td>
					</tr>
					<tr>
						<td>가격</td>
						<td><input type="text" name="price" value="0" /></td>
					</tr>
					<tr>
						<td>할인율</td>
						<td><input type="text" name="discount" value="0" /></td>
					</tr>
					<tr>
						<td>할인여부</td>
						<td>
							비할인 <input type="radio" value="n" name="dis_yn" checked="checked" />
							할인 <input type="radio" value="y" name="dis_yn" />
						</td>
					</tr>
					<tr>
						<td>적립율</td>
						<td><input type="text" name="earn" value="0" /></td>
					</tr>
					<tr>
						<td>적립여부</td>
						<td>
							비적립 <input type="radio" value="n" name="earn_yn" checked="checked" />
							적립 <input type="radio" value="y" name="earn_yn" />
						</td>
					</tr>
					<tr>
						<td>분류</td>
						<td>
							<select name="ctno">
								<c:forEach items="${clist}" var="dto"><option value="${dto.ctno}">${dto.name}</option></c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>두글만팜</td>
						<td>
							일반상품 <input type="radio" value="n" name="only_yn" checked="checked" />
							두글상품 <input type="radio" value="y" name="only_yn" />
						</td>
					</tr>
					<tr>
						<td>최저가</td>
						<td>
							일반상품 <input type="radio" value="n" name="od_yn" checked="checked" />
							최저가 <input type="radio" value="y" name="od_yn" />
						</td>
					</tr>
					<tr>
						<td>상품이미지</td>
						<td>
							<input type="file" name="files" /> 메인이미지(필수)<br /> 
							<input type="file" name="files" /> 서브이미지1<br />
							<input type="file" name="files" /> 서브이미지2<br />
							<input type="file" name="files" /> 서브이미지3<br />
							<input type="file" name="files" /> 서브이미지4
						</td>
					</tr>
					<tr>
						<td>수량</td>
						<td>
							<input type="text" name="quantity" value="0" />
						</td>
					</tr>
					<tr>
						<td>판매여부</td>
						<td>
							판매 <input type="radio" value="y" name="sel_yn" checked="checked" />
							비판매 <input type="radio" value="n" name="sel_yn" />
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="text-center">
							<button type="submit" class="btn btn-primary">등록</button>
							<a href="/admin/product"><button type="button" class="btn btn-warning">리스트</button></a>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</div>