<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<table class="table product-mod">
			<tbody>
				<tr>
					<td class="w150">제목</td>
					<td>${dto.title}</td>
				</tr>
				<tr>
					<td class="w150">작성자</td>
					<td>${dto.name }</td>
				</tr>
				<tr>
					<td class="w150">내용</td>
					<td>${dto.content}</td>
				</tr>
				<tr>
					<td class="w150">작성일</td>
					<fmt:parseDate value="${dto.writedate}" var="writedate" pattern="yyyy-MM-dd"/>
				 	<td><fmt:formatDate value="${writedate}" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<td class="w150">조회수</td>
					<td>${dto.read_cnt}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" class="text-center">
						<button type="button" class="btn btn-warning"><a href="/admin/notice">목록</a></button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
