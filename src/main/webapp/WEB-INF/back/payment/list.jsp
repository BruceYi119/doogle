<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<input type="hidden" id="active" value="10" />
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
	<h3>결제목록</h3>
</div>

<input type="hidden" id="active" value="8" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th>결제번호</th>
				<th>회원번호</th>
				<th>아이디</th>
				<th>회원이름</th>
				<th>핸드폰번호</th>
				<th>결제방법</th>
				<th>결제금액</th>
				<th>등록일</th>
				<th>상세보기/삭제</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${adminPaymentArr }" var="paymentMemberDTO">
			<tr>
				<td>${paymentMemberDTO.pmno }</td>
				<td>${paymentMemberDTO.mno }</td>
				<td>${paymentMemberDTO.id }</td>
				<td>${paymentMemberDTO.name }</td>
				<td>${paymentMemberDTO.phone }</td>
				<c:if test="${paymentMemberDTO.type eq 'c' }">
				<td>카드결제 ${paymentMemberDTO.cardName } | ${paymentMemberDTO.cardMonth }</td>
				</c:if>
				<c:if test="${paymentMemberDTO.type eq 'h' }">
				<td>CHAI</td>
				</c:if>
				<c:if test="${paymentMemberDTO.type eq 't' }">
				<td>TOSS</td>
				</c:if>
				<c:if test="${paymentMemberDTO.type eq 'n' }">
				<td>NAVER</td>
				</c:if>
				<c:if test="${paymentMemberDTO.type eq 'o' }">
				<td>PAYCO</td>
				</c:if>
				<c:if test="${paymentMemberDTO.type eq 's' }">
				<td>SMILE</td>
				</c:if>
				<c:if test="${paymentMemberDTO.type eq 'p' }">
				<td>PHONE</td>
				</c:if>
				<td>${paymentMemberDTO.payment }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${paymentMemberDTO.writedate}" /></td>
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