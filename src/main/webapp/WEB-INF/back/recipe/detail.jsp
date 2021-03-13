<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" id="active" value="6" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>레시피세부정보</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<table class="table product-mod">
			<tbody>
				<tr>
					<td class="w150">제목</td>
					<td>${rdto.title}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${rdto.name }</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${rdto.read_cnt}</td>
				</tr>
				<tr>
					<td>분류</td>
					<c:if test="${rdto.ctno==223}">
					<td>매일밥상</td>
					</c:if>
					<c:if test="${rdto.ctno==224}">
					<td>특별한날</td>
					</c:if>
					<c:if test="${rdto.ctno==225}">
					<td>간단요리</td>
					</c:if>
					
				</tr>
				<tr>
					<td>작성일</td>
					<td>${rdto.writedate}</td>
				</tr>
				<tr>
					<td>대표이미지</td>
					<td>
						<img src="${fdto.loc}${fdto.name}" />
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${rdto.content}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" class="text-center">
						<a href="/admin/recipe/mod?rno=${rdto.rno}"><button type="button" class="btn btn-success">수정</button></a>
						<a href="/admin/recipe/delete?rno=${rdto.rno}"><button type="button" class="btn btn-danger">삭제</button></a>
						<a href="/admin/recipe"><button type="button" class="btn btn-warning">리스트</button></a>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>