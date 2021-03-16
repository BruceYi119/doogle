<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
	#ordersTitle{
		text-align: center;
		width: 400px;
		margin: auto;
	}
	
	td{
		font-size: 18px;
	}
</style>
<div id="ordersTitle" class="w3-white w3-padding notranslate fix mt-3">
	<h3>주문목록</h3>
</div>

<input type="hidden" id="active" value="8" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th>주문번호</th>
				<th>상태</th>
				<th>회원번호</th>
				<th>ID</th>
				<th>성명</th>
				<th>전화번호</th>
				<th>등록일</th>
				<th>상세보기/삭제</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${adminOrdersArr }" var="ordersMemberDTO">
			<tr>
				<td>${ordersMemberDTO.ono }</td>
				<c:if test="${ordersMemberDTO.type eq 'o' }">
				<td>주문완료</td>
				</c:if>
				<c:if test="${ordersMemberDTO.type eq 's' }">
				<td>배송완료</td>
				</c:if>
				<c:if test="${ordersMemberDTO.type eq 'c' }">
				<td>주문취소</td>
				</c:if>
				<c:if test="${ordersMemberDTO.type eq 'd' }">
				<td>배송중</td>
				</c:if>
				<td>${ordersMemberDTO.mno }</td>
				<td>${ordersMemberDTO.id }</td>
				<td>${ordersMemberDTO.name }</td>
				<td>${ordersMemberDTO.phone }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ordersMemberDTO.writedate}" /></td>
				<td>
					<button type="button" class="btn btn-success" name="up">상세보기</button>
					<button type="button" class="btn btn-danger delete" name="del">삭제</button>
				</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
				<tr>
					<td colspan="8">
						<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
					</td>
				</tr>
			</tfoot>
	</table>
</div>