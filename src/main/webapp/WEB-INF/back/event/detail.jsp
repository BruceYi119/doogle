<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" id="active" value="6" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>이벤트세부정보</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<table class="table product-mod">
			<tbody>
				<tr>
					<td class="w150">메인이미지</td>
					<td>
						<img src="${fdto.loc}${fdto.name}" />
					</td>
				</tr>
				<tr>
					<td>링크</td>
					<td>${edto.link}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${edto.content}</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${edto.writedate}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" class="text-center">
						<a href="/admin/event/mod?eno=${edto.eno}"><button type="button" class="btn btn-success">수정</button></a>
						<a href="/admin/event/delete?eno=${edto.eno}"><button type="button" class="btn btn-danger">삭제</button></a>
						<a href="/admin/event"><button type="button" class="btn btn-warning">리스트</button></a>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>