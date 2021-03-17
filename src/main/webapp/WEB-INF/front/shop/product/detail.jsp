<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="base_wrap mt20">
	<div class="detail-wrap">
		<input type="hidden" id="detail-pno" value="${dto.pno}" />
		<input type="hidden" name="price" value="${dto.price}" />		
		<input type="hidden" name="cnt" value="0" />
		<input type="hidden" name="total-price" value="${dto.price}" />
		<input type="hidden" id="earn" value="${earn}" />
		<div class="left">
			<img src="${dto.jloc}${dto.jname}" />
		</div>
		<div class="right">
			<p class="title">${dto.brand} ${dto.name}</p>
			<p class="sub-title">${dto.subject}</p>
			<c:if test="${dto.discount > 0}"><p class="dis-title">회원할인가</p></c:if>
			<p class="price"><span><fmt:formatNumber type="number" value="${dto.price}" /></span><span>원</span><c:if test="${dto.discount > 0}"> <span>${dto.discount}%</span></p></c:if>
			<c:if test="${dto.discount > 0}"><p class="dis"><fmt:formatNumber type="number" value="${Math.ceil(dto.price - (dto.price * (dto.discount * 0.01)))}" />원</p>	</c:if>
			<c:if test="${empty id}"><p class="no-login">로그인 후, 회원할인가와 적립혜택이 제공됩니다.</p></c:if>
			<c:if test="${not empty id}"><p class="login"><span>${grageName} ${earn}%</span> <span>개당 <fmt:formatNumber type="number" value="${Math.ceil(dto.price * (earn * 0.01))}" />원 적립</span></c:if>
			<p class="info top"><span>판매단위</span><span>${dto.sel_unit}</span></p>
			<p class="info bottom"><span>중량/용량</span><span>${dto.weight}</span></p>
			<p class="info bottom"><span>배송구분</span><span>샛별배송/택배배송</span></p>
			<p class="info bottom"><span>포장타입</span><span>${dto.cpack_type}</span><span>택배배송은 에코포장이 스티로폼으로 대체됩니다.	</span></p>
			<p class="info bottom"><span>알레르기정보</span><span></span></p>
			<p class="info bottom cnt">
				<span>구매수량</span>
				<span class="count">
					<button type="button" class="btn-down">수량내리기</button>
					<input type="number" readonly="readonly" value="0" name="dsp-cnt" />
					<button type="button" class="btn-up">수량올리기</button>
				</span>
			</p>
		</div>
	</div>
</div>