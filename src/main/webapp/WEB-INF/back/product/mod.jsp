<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" id="active" value="6" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>상품수정</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<form action="/admin/product/mod/ok" method="post" enctype="multipart/form-data">
			<input type="hidden" name="pno" value="${dto.pno}" />
			<table class="table product-mod">
				<tbody>
					<tr>
						<td class="w150">브랜드</td>
						<td><input type="text" name="brand" value="${dto.brand}" /></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td><input type="text" name="name" value="${dto.name}" /></td>
					</tr>
					<tr>
						<td>부제목</td>
						<td><input type="text" name="subject" value="${dto.subject}" /></td>
					</tr>
					<tr>
						<td>판매단위</td>
						<td><input type="text" name="sel_unit" value="${dto.sel_unit}" /></td>
					</tr>
					<tr>
						<td>중량/용량</td>
						<td><input type="text" name="weight" value="${dto.weight}" /></td>
					</tr>
					<tr>
						<td>포장타입</td>
						<td>
							기타 <input type="radio" value="d" name="pack_type" <c:if test="${dto.pack_type eq 'd'}">checked="checked"</c:if> />
							상온 <input type="radio" value="r" name="pack_type" <c:if test="${dto.pack_type eq 'r'}">checked="checked"</c:if> />
							냉장 <input type="radio" value="c" name="pack_type" <c:if test="${dto.pack_type eq 'c'}">checked="checked"</c:if> />
							냉동 <input type="radio" value="f" name="pack_type" <c:if test="${dto.pack_type eq 'f'}">checked="checked"</c:if> />
						</td>
					</tr>
					<tr>
						<td>안내사항</td>
						<td><textarea name="info" class="w500 h300 p10">${dto.info}</textarea></td>
					</tr>
					<tr>
						<td>가격</td>
						<td><input type="text" name="price" value="${dto.price}" /></td>
					</tr>
					<tr>
						<td>할인율</td>
						<td><input type="text" name="discount" value="${dto.discount}" /></td>
					</tr>
					<tr>
						<td>할인여부</td>
						<td>
							비할인 <input type="radio" value="n" name="dis_yn" <c:if test="${dto.dis_yn eq 'n'}">checked="checked"</c:if> />
							할인 <input type="radio" value="y" name="dis_yn" <c:if test="${dto.dis_yn eq 'y'}">checked="checked"</c:if> />
						</td>
					</tr>
					<tr>
						<td>적립율</td>
						<td><input type="text" name="earn" value="${dto.earn}" /></td>
					</tr>
					<tr>
						<td>적립여부</td>
						<td>
							비적립 <input type="radio" value="n" name="earn_yn" <c:if test="${dto.earn_yn eq 'n'}">checked="checked"</c:if> />
							적립 <input type="radio" value="y" name="earn_yn" <c:if test="${dto.earn_yn eq 'y'}">checked="checked"</c:if> />
						</td>
					</tr>
					<tr>
						<td>분류</td>
						<td>
							<select name="ctno">
								<c:forEach items="${clist}" var="cdto"><option value="${cdto.ctno}" <c:if test="${dto.ctno eq cdto.ctno}">selected="selected"</c:if>>${cdto.name}</option></c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>두글만팜</td>
						<td>
							일반상품 <input type="radio" value="n" name="only_yn" <c:if test="${dto.only_yn eq 'n'}">checked="checked"</c:if> />
							두글상품 <input type="radio" value="y" name="only_yn" <c:if test="${dto.only_yn eq 'y'}">checked="checked"</c:if> />
						</td>
					</tr>
					<tr>
						<td>최저가</td>
						<td>
							일반상품 <input type="radio" value="n" name="od_yn" <c:if test="${dto.od_yn eq 'n'}">checked="checked"</c:if> />
							최저가 <input type="radio" value="y" name="od_yn" <c:if test="${dto.od_yn eq 'y'}">checked="checked"</c:if> />
						</td>
					</tr>
					<tr>
						<td>상품이미지</td>
						<td>
							<p>
								<c:forEach items="${flist}" var="fdto">
									<img src="${fdto.loc}${fdto.name}" />
								</c:forEach>
							</p>
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
							<input type="text" name="quantity" value="${dto.quantity}" />
						</td>
					</tr>
					<tr>
						<td>판매여부</td>
						<td>
							판매 <input type="radio" value="y" name="sel_yn" <c:if test="${dto.sel_yn eq 'y'}">checked="checked"</c:if> />
							비판매 <input type="radio" value="n" name="sel_yn" <c:if test="${dto.sel_yn eq 'n'}">checked="checked"</c:if> />
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="text-center">
							<button type="submit" class="btn btn-success">수정</button>
							<a href="/admin/product/mod?pno=${dto.pno}"><button type="button" class="btn btn-secondary">취소</button></a>
							<a href="/admin/product"><button type="button" class="btn btn-warning">리스트</button></a>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</div>