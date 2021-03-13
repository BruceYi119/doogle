<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" id="active" value="24" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>자주하는질문추가</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<form action="/admin/question/update/ok" method="post">
		<input type="hidden" value="${qdto.qno}" name="qno">
			<table class="table">
				<tr>
					<td><label for="sel1">카테고리</label></td>
					<input type="hidden" value="${qdto.ctno}" id="ctno">
					<td><select class="form-control" id="sel1" name="ctno">
							<option value="0">선택</option>
							<option value="217">회원문의</option>
							<option value="218">주문/결제</option>
							<option value="219">취소/교환/반품</option>
							<option value="220">배송문의</option>
							<option value="221">쿠폰/적립금</option>
							<option value="222">서비스 이용 및 기타</option>
					</select></td>
				</tr>
				<tbody>
					<tr>
						<td class="w150">제목</td>
						<td><input type="text" class="form-control" id="usr"
							name="title" value="${qdto.title}"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea class="form-control" rows="5" id="summernote"
							name="content">${qdto.content}</textarea></td>
					</tr>
					<tr>
						<td>게시여부</td>
						<td>게시 <input type="radio" value="y" id="gesi" name="type"
							checked="checked" /> 비공개 <input type="radio" value="n"
							id="gesi1" name="type" />
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="text-center">
							<button type="submit" class="btn btn-primary">등록</button> <a
							href="/admin/question"><button type="button"
									class="btn btn-warning">리스트</button></a>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</div>