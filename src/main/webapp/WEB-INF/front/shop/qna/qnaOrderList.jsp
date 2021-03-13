<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="/static/front/js/qnaOrderList.js"></script>
<table id="orderList" width="100%" height="100%" cellpadding="0"
	cellspacing="0" border="0">
	<tbody>
		<tr>
			<td style="border: 10px solid #fff" valign="top">
				<table height="100%" width="100%" cellpadding="0" cellspacing="0"
					border="0" align="center">
					<tbody>
						<tr>
							<td height="100%" valign="top">
								<table cellpadding="3" cellspacing="0" border="0">
									<tbody>
										<tr>
											<td class="stxt" style="padding-top: 10">문의하실 주문번호를
												선택하세요.</td>
										</tr>
									</tbody>
								</table>
								<table width="100%" cellpadding="0" cellspacing="0" border="0"
									style="margin-top: 10px;">
									<colgroup>
										<col width="20%">
										<col width="12%">
										<col width="36%">
										<col width="10%">
										<col width="15%">
										<col width="7%">
									</colgroup>
									<tbody>
										<tr height="19" bgcolor="#A8A8A8" >
											<th style="font: bold 8pt 돋움; color: #FFFFFF">주문번호</th>
											<th style="font: bold 8pt 돋움; color: #FFFFFF">주문일자</th>
											<th style="font: bold 8pt 돋움; color: #FFFFFF">상품명</th>
											<th style="font: bold 8pt 돋움; color: #FFFFFF">수량</th>
											<th style="font: bold 8pt 돋움; color: #FFFFFF">주문금액</th>
											<th style="font: bold 8pt 돋움; color: #FFFFFF">선택</th>
										</tr>
										<c:forEach items="${list}" var="list" varStatus="status">
										<tr height="25" align="center"  class="onoRow">
											<td class="ono">${list.ono}</td>
											<fmt:parseDate value="${list.writedate}" var="writedate" pattern="yyyy-MM-dd"/>
											<td><fmt:formatDate value="${writedate}" pattern="yyyy-MM-dd"/></td>
											<td>${list.name}</td>
											<td align="right">${list.quantity}</td>
											<td align="right">${list.payment}</td>
											<td>
											<input type="radio" name="ordernoSelect"
												value="${list.ono}" class="radio">
											</td>
										</tr>
										<tr>
											<td colspan="6" height="1" bgcolor="E5E5E5"></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
					</tbody>
				</table>