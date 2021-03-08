<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="base_wrap mt65 mb120">
	<div id="proposition">
		<h2>에코포장 피드백</h2>
		<div>
			<ul class="gray-list">
				<li>에코 박스에 대한 피드백이나 새로운 포장재에 대한 제안을 남겨주세요.</li>
				<li>더욱 세심하게 포장되었으면 하는 상품이 있다면 언제든 말씀해주세요.</li>
				<li>제안해 주신 의견은 담당자가 실시간으로 모니터링할 예정이나 별도 답변 안내는 되지 않음을 양해 부탁드립니다.</li>
				<li>배송관련,주문(취소/교환/환불)관련 문의 및 요청 사항은 1:1문의/카카오톡/고객센터(1644-1107)로 문의 바랍니다.</li>
			</ul>
			<div class="section-wrap">
				<table class="table">
					<tr>
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
			<c:if test="${list.size() == 0}">
					<tr>
						<td class="no-data" colspan="5">상품 제안 내역이 존재하지 않습니다.</td>
					</tr>
			</c:if>
					<c:set var="c" value="0"/>
				<c:forEach var="dto" items="${list }">
					<tr class="tr-main" onclick="getContent(${c})">
						<td>${dto.epno }</td>
						<td>[${dto.cname}]</td>
						<td>${dto.title }</td>
						<td>${c }</td>
						<td>${dto.writedate }</td>
					</tr>
					<tr class="tr-sub" style="display:none;" >
						<td colspan="5">
							${dto.content }
							<form method="post" action="/shop/ecoUpdate?epno=${dto.epno}">
							<input type="hidden" name="epno" value="${dto.epno }">
								<div style="text-align:right">
									<input type="submit" value="수정" class="mun" onmouseenter="getWhite(this)" onmouseout="getPurple()">
									<button type="button" onclick="del(${dto.epno})" class="mun" onmouseenter="getWhite(this)" onmouseout="getPurple()">삭제</button>
								</div>
							</form>
						</td>
					</tr>
					<c:set var="c" value="${c+1 }"/>
				</c:forEach>
				<c:if test="${list.size() != 0}">
					<tr>
						<td colspan="5">
							<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
						</td>
					</tr>
				</c:if>
				</table>
			</div>
				 <button type="button" id="button" class="mun" onclick="location.href='/shop/ecoWrite'" onmouseenter="getWhite(this)" onmouseout="getPurple()">글쓰기</button> 
		</div>
	</div>
</div>