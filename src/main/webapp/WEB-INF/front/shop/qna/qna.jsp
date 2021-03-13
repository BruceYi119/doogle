<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="page_aticle aticle_type2">
	<div class="page_section section_qna">
		<div class="head_aticle">
			<h2 class="tit">1:1 문의</h2>
		</div>

		<table class="xans-board-listheader" width="100%">
			<tbody>
				<tr class="input_txt">
					<th width="8%">번호</th>
					<th width="15%">카테고리</th>
					<th>제목</th>
					<th width="12%">작성자</th>
					<th width="12%">작성일</th>
				</tr>
				<c:forEach var="list" items="${list}" varStatus="status">
					<tr class="qna">
					<td class="td1">${list.qnno}</td>
					<td id="td3">
								<c:if test="${list.ctno==243}">
								배송/지연불만
								</c:if> 
								<c:if test="${list.ctno==244}">
								컬리패스(무료배송)
								</c:if> 
								<c:if test="${list.ctno==245}">
								반품문의
								</c:if> 
								<c:if test="${list.ctno==246}">
								A/S 문의
								</c:if> 
								<c:if test="${list.ctno==247}">
								환불문의
								</c:if> 
								<c:if test="${list.ctno==248}">
								주문결제문의
								</c:if> 
								<c:if test="${list.ctno==249}">
								회원정보문의
								</c:if> 
								<c:if test="${list.ctno==250}">
								취소문의
								</c:if> 
								<c:if test="${list.ctno==251}">
								교환문의
								</c:if> 
								<c:if test="${list.ctno==252}">
								상품정보문의
								</c:if> 
								<c:if test="${list.ctno==253}">
								기타문의
								</c:if>
					</td>
					<td>${list.title}[${list.count}]</td>
					<td>${list.name}</td>
					<td><fmt:parseDate value="${list.writedate}" var="writedate"
							pattern="yyyy-MM-dd" /> <fmt:formatDate value="${writedate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr class="answer">
						<td colspan="5">[ 주문번호 ${list.ono} 문의 ]<p>
							${list.content}
		--------------------------------------------------------- 문의 답변 안내 ---------------------------------------------------------<p>
							<span class="ajax"></span><p>
							<button class="update">수정</button>
							<button class="delete">삭제</button> <input type="hidden"
							value="${list.qnno}">
						</td>
					</tr>
				</c:forEach>
		</table>
		<div style="position: relative">
			<div style="position: absolute; right: 0; top: 60px;">
				<a href="/shop/qna_register"><span class="bhs_buttonsm yb"
					style="float: none;">글쓰기</span></a>
			</div>
		</div>
		<div class="no_data"
			style="padding: 150px 0 148px; border-top: 1px solid #e6e6e6; border-bottom: 1px solid #e6e6e6; font-size: 12px; color: #4c4c4c">
		</div>
		<div class="layout-pagination">
			<div class="pagediv"></div>
		</div>

	</div>
</div>