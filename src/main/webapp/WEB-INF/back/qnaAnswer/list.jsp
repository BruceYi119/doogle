<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>1:1문의 관리</h3>
</div>

<table class="table">
	<thead class="thead-dark">
		<tr>
			<th>번호</th>
			<th>카테고리 
			<select onchange="if(this.value) location.href=(this.value);">
					<option value="">선택</option>
					<option value="/admin/qnaAnswer">전체</option>
					<option value="/admin/qnaAnswer?ctno=243">배송/지연불만</option>
					<option value="/admin/qnaAnswer?ctno=244">컬리패스(무료배송)</option>
					<option value="/admin/qnaAnswer?ctno=245">반품문의</option>
					<option value="/admin/qnaAnswer?ctno=246">A/S문의</option>
					<option value="/admin/qnaAnswer?ctno=247">환불문의</option>
					<option value="/admin/qnaAnswer?ctno=248">주문결제문의</option>
					<option value="/admin/qnaAnswer?ctno=249">회원정보문의</option>
					<option value="/admin/qnaAnswer?ctno=250">취소문의</option>
					<option value="/admin/qnaAnswer?ctno=251">교환문의</option>
					<option value="/admin/qnaAnswer?ctno=252">상품정보문의</option>
					<option value="/admin/qnaAnswer?ctno=253">기타문의</option>
			</select>
			</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>이메일 || 문자</th>
			<th>답변알림</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="list" varStatus="status">
	 <tr>
	 	<c:set var = "list_qnno" value="${list.qnno}" />
	 	<c:set var = "ctnonum1" value="${ctnonum}" />
	 	<td class="qnno">${list.qnno}</td>
	 	<td>
	 	<c:if test="${list.ctno==243}">
		배송/지연불만 
			<c:if test="${fn:contains(ctnonum1,list_qnno) eq true}">
	 			<button class="btn btn-success">답변완료</button>
	 		</c:if>
	 		<c:if test="${fn:contains(ctnonum1,list_qnno) eq false}">
	 			<button class="btn btn-warning answer">답변달기</button>
	 		</c:if>
		</c:if> 
		<c:if test="${list.ctno==244}">
			컬리패스(무료배송)
			<c:if test="${fn:contains(ctnonum1,list_qnno) eq true}">
	 			<button class="btn btn-success">답변완료</button>
	 		</c:if>
	 		<c:if test="${fn:contains(ctnonum1,list_qnno) eq false}">
	 			<button class="btn btn-warning answer">답변달기</button>
	 		</c:if>
		</c:if> 
		<c:if test="${list.ctno==245}">
		반품문의
			<c:if test="${fn:contains(ctnonum1,list_qnno) eq true}">
	 			<button class="btn btn-success">답변완료</button>
	 		</c:if>
	 		<c:if test="${fn:contains(ctnonum1,list_qnno) eq false}">
	 			<button class="btn btn-warning answer">답변달기</button>
	 		</c:if>
		</c:if> 
		<c:if test="${list.ctno==246}">
		A/S 문의
			<c:if test="${fn:contains(ctnonum1,list_qnno) eq true}">
	 			<button class="btn btn-success">답변완료</button>
	 		</c:if>
	 		<c:if test="${fn:contains(ctnonum1,list_qnno) eq false}">
	 			<button class="btn btn-warning answer">답변달기</button>
	 		</c:if>
		</c:if> 
		<c:if test="${list.ctno==247}">
		환불문의
			<c:if test="${fn:contains(ctnonum1,list_qnno) eq true}">
	 			<button class="btn btn-success">답변완료</button>
	 		</c:if>
	 		<c:if test="${fn:contains(ctnonum1,list_qnno) eq false}">
	 			<button class="btn btn-warning answer">답변달기</button>
	 		</c:if>
		</c:if> 
		<c:if test="${list.ctno==248}">
		주문결제문의
			<c:if test="${fn:contains(ctnonum1,list_qnno) eq true}">
	 			<button class="btn btn-success">답변완료</button>
	 		</c:if>
	 		<c:if test="${fn:contains(ctnonum1,list_qnno) eq false}">
	 			<button class="btn btn-warning answer">답변달기</button>
 			</c:if>
		</c:if> 
		<c:if test="${list.ctno==249}">
		회원정보문의
			<c:if test="${fn:contains(ctnonum1,list_qnno) eq true}">
	 			<button class="btn btn-success">답변완료</button>
	 		</c:if>
	 		<c:if test="${fn:contains(ctnonum1,list_qnno) eq false}">
	 			<button class="btn btn-warning answer">답변달기</button>
	 		</c:if>
		</c:if> 
		<c:if test="${list.ctno==250}">
		취소문의
			<c:if test="${fn:contains(ctnonum1,list_qnno) eq true}">
	 			<button class="btn btn-success">답변완료</button>
	 		</c:if>
	 		<c:if test="${fn:contains(ctnonum1,list_qnno) eq false}">
	 			<button class="btn btn-warning answer">답변달기</button>
	 		</c:if>
		</c:if> 
		<c:if test="${list.ctno==251}">
		교환문의
			<c:if test="${fn:contains(ctnonum1,list_qnno) eq true}">
	 			<button class="btn btn-success">답변완료</button>
	 		</c:if>
	 		<c:if test="${fn:contains(ctnonum1,list_qnno) eq false}">
	 			<button class="btn btn-warning answer">답변달기</button>
	 		</c:if>
		</c:if> 
		<c:if test="${list.ctno==252}">
		상품정보문의
			<c:if test="${fn:contains(ctnonum1,list_qnno) eq true}">
	 			<button class="btn btn-success">답변완료</button>
	 		</c:if>
	 		<c:if test="${fn:contains(ctnonum1,list_qnno) eq false}">
	 			<button class="btn btn-warning answer">답변달기</button>
	 		</c:if>
		</c:if> 
		<c:if test="${list.ctno==253}">
		기타문의
			<c:if test="${fn:contains(ctnonum1,list_qnno) eq true}">
	 			<button class="btn btn-success">답변완료</button>
	 		</c:if>
	 		<c:if test="${fn:contains(ctnonum1,list_qnno) eq false}">
	 			<button class="btn btn-warning answer">답변달기</button>
	 		</c:if>
		</c:if>
	 	</td>
	 	<td class="title">${list.title}</td>
	 	<td>${list.name}</td>
	 	<input type="hidden" value="${list.name}" class="name">
	 	<fmt:parseDate value="${list.writedate}" var="writedate" pattern="yyyy-MM-dd" />
	 	<td><fmt:formatDate value="${writedate}" pattern="yyyy-MM-dd" /></td>
	 	<td>${list.phone}<p>${list.email}</td>
	 	<td>
	 	<c:if test="${list.phone_yn eq 'y'}">
	 		<input type="hidden" value="${list.phone}" class="phoneNum">
			<button class="btn btn-danger delete phoneSend" id="phoneDone">문자알림</button>
 		</c:if>
 		<c:if test="${list.email_yn eq 'y'}">
 			<input type="hidden" value="${list.email}" class="emailAddr">
	 		<button class="btn btn-success emailSend" id="emailDone">메일알림</button>
 		</c:if>
 		<c:if test="${list.email_yn eq 'n'}">
 		<button type="button" class="btn btn-warning">메일거부</button>
 		</c:if>
 		<c:if test="${list.phone_yn eq 'n'}">
 		<button type="button" class="btn btn-warning">문자거부</button>
 		</c:if>
 		<c:if test="${list.email_yn eq 'o'}">
 		<button type="button" class="btn btn-info">메일답변완료</button>
 		</c:if>
 		<c:if test="${list.phone_yn eq 'o'}">
 		<button type="button" class="btn btn-info">문자답변완료</button>
 		</c:if>
	 	</td>
	 </tr>
	 </c:forEach>
	</tbody>
</table>
<div id="page">
			<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
</div>
	