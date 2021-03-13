<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@include file="../navbar.jsp"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/static/front/js/questionList.js"></script>
<div class="page_aticle aticle_type2">
		<div class="page_section">
			<div class="head_aticle">
				<h2 class="tit">
					자주하는 질문 <span class="tit_sub">고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</span>
				</h2>
			</div>
			<div class="search_date">
				<select	onchange="if(this.value) {window.open(value,'_black')}">
					<option value="">선택</option>
					<option value="questionList">전체</option>
					<option value="questionList?ctno=217">회원문의</option>
					<option value="questionList?ctno=218">주문결제</option>
					<option value="questionList?ctno=219">취소/교환/반품</option>
					<option value="questionList?ctno=220">배송문의</option>
					<option value="questionList?ctno=221">쿠폰/적립금</option>
					<option value="questionList?ctno=222">서비스 이용 및 기타</option>
				</select>
			</div>
			<div class="xans-element- xans-myshop xans-myshop-couponserial ">
				<table width="100%" class="xans-board-listheader">
					<tr>
						<th id="a1">번호</th>
						<th id="a2">카테고리</th>
						<th id="a3">제목</th>
					</tr>
					<c:forEach items="${list}" var="list">
						<c:if test="${list.type eq 'y'}">
							<tr class="qna">
								<td class="td1">${list.qno}</td>
								<c:if test="${list.ctno==217}">
									<td id="td1">회원문의</td>
								</c:if>
								<c:if test="${list.ctno==218}">
									<td id="td2">주문/결제</td>
								</c:if>
								<c:if test="${list.ctno==219}">
									<td id="td2">취소/교환/반품</td>
								</c:if>
								<c:if test="${list.ctno==220}">
									<td id="td2">배송문의</td>
								</c:if>
								<c:if test="${list.ctno==221}">
									<td id="td2">쿠폰/적립금</td>
								</c:if>
								<c:if test="${list.ctno==222}">
									<td id="td2">서비스 이용 및 기타</td>
								</c:if>
								<td style="cursor: pointer" id="td3">${list.title}</td>
							</tr>
							<tr class="qna_answer">
								<td colspan="5" id="content">${list.content}</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<div id="page">
				<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
			</div>
		</div>
</div>
