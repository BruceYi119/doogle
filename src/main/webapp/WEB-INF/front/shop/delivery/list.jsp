<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page_aticle aticle_type2">
<div id="" class="page_section section_destination">
<div class="head_aticle">
<h2 class="tit">배송지 관리 <span id="addrListInfo" class="tit_sub">배송지에 따라 상품 정보가 달라질 수 있습니다.</span></h2>
<div class="new_address">
<button type="button" class="btn" id="newAddressAdd" onclick="jusoPopup()">
+ 새 배송지 추가
</button>
</div>
</div>
<span class="destination_add screen_out"></span>
<div id="tblParent" class="type_select">
<table class="tbl tbl_type1">
<thead>
<tr>
<th class="tit_select">선택</th>
<th class="tit_address">주소</th>
<th class="tit_receive">받으실 분</th>
<th class="tit_phone">연락처</th>
<th class="tit_delivery">배송유형</th>
<th class="tit_modify">수정</th>
</tr>
</thead>
<c:forEach items="${list}" var="list" varStatus="status">
		<tr class="dno">
			<td class="checkBox">
				<input type="hidden" value="${list.dno}" class="dno1">
				<input type="radio" name="default" value="${list.default_yn}" class="checkbox_class" onclick="update()">
			</td>
			<td>
			<c:if test="${status.first}">
					<span class="badge_default">기본 배송지</span><p>
			</c:if> ${list.addr} ${list.addr_detail}
			</td>
			<td>${list.receive_name}</td>
			<td>${list.phone }</td>
			<td>
			<c:if test="${list.type eq 's'}">
				샛별배송
			</c:if>
			<c:if test="${list.type eq 't'}">
				택배배송
			</c:if>
			</td>
			<td>
				<button type="button" class="ico2" data-addr-no="7872732"
					data-addr-type="D" data-is-current-addr="true"
					onclick="updatePop()">수정하기</button>
			</td>
		</tr>
	</c:forEach>
</table>

</div>
</div>
</div>
