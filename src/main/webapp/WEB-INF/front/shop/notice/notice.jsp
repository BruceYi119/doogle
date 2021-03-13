<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="page_aticle aticle_type2">
<div class="page_section">
<div class="head_aticle">
<h2 class="tit">공지사항 <span class="tit_sub">컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span></h2>
</div>
<a href="/shop/notice" id="insert_notice">공지전체보기</a>
<!-- <form name="frmList" action="/shop/board/list.php?&amp;" onsubmit="return chkFormList(this)"> -->
<input type="hidden" name="id" value="notice">
<table width="100%" align="center" cellpadding="0" cellspacing="0">
<tbody><tr>
<td>
<div class="xans-element- xans-myshop xans-myshop-couponserial ">
<table width="100%" class="xans-board-listheader jh" cellpadding="0" cellspacing="0">
<thead>
<tr>
<th>번호</th>
<th>제목</th>
<th>작성자</th>
<th>작성일</th>
<th>조회</th>
</tr>
</thead>
<tbody>
<c:forEach items="${list}" var="list">
<tr class="viewRow">
<c:if test="${list.state==1}">
<td width="50" nowrap="" align="center">공지</td>
<td class=noRow>${list.nno}</td>
</c:if>
<c:if test="${list.state==0}">
<td width="50" nowrap="" align="center" class="NNo">${list.nno}</td>
</c:if>
<td style="padding-left:10px; text-align:left; color:#999">${list.title}</td>
<td width="100" nowrap="" align="center">${list.name}</td>
<fmt:parseDate value="${list.writedate}" var="writedate" pattern="yyyy-MM-dd"/>
<td width="100" nowrap="" align="center" class="eng2"><fmt:formatDate value="${writedate}" pattern="yyyy-MM-dd"/></td>
<td width="30" nowrap="" align="center" class="eng2">${list.read_cnt}</td>

</tr>
</c:forEach>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
<div id="page">
		<tr>
			<td>
			<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
			</td>
		</tr>
</div>
</div>
<form>
<table class="xans-board-search xans-board-search2">
<tr>
<td>
	<select id="search" action="/shop/notice">
		<option value="">제목</option>
	</select>
	<input type="text" name="title">
</td>
</tr>
</table>
</form>
</div>
