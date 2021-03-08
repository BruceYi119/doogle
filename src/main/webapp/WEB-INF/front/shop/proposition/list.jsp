<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="base_wrap mt65 mb120">
	<div id="proposition">
		<h2>상품제안</h2>
		<div>
			<ul class="gray-list">
				<li>마켓컬리에서 추가적으로 판매되면 좋을 상품을 제안해주세요.</li>
				<li>고객님의 의견을 발 빠르게 반영하여 더욱 편리한 마켓컬리가 되겠습니다.</li>
				<li>주의)알콜 제품은 법령상 온라인 판매가 불가하오니,이 점 참고하여 작성부탁드립니다.</li>
				<li>담당 MD가 제안해주신 의견을 실시간으로 모니터링할 예정이나, 별도 답변 안내는 되지 않음을 양해부탁드립니다.</li>
			</ul>
			<div class="section-wrap">
				<table class="table">
					<tr>
						<th>번호</th>
						<th>카테고리</th>
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
						<td>${dto.ppno }</td>
						<td>[${dto.name}]</td>
						<td>${dto.title }</td>
						<td>${c }</td>
						<td>${dto.writedate }</td>
					</tr>
					<tr class="tr-sub" style="display:none;" >
						<td colspan="5">
							${dto.content }
							<form method="post" action="/shop/propositionUpdate?qqno=${dto.ppno}">
							<input type="hidden" name="ppno" value="${dto.ppno }">
								<div style="text-align:right">
									<input type="submit" value="수정" class="mun" onmouseenter="getWhite(this)" onmouseout="getPurple()">
									<button type="button" onclick="del(${dto.ppno})" class="mun" onmouseenter="getWhite(this)" onmouseout="getPurple()">삭제</button>
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
				 <button type="button" id="button" class="mun"onclick="location.href='/shop/propositionWrite'" onmouseenter="getWhite(this)" onmouseout="getPurple()">글쓰기</button> 
		</div>
	</div>
</div>