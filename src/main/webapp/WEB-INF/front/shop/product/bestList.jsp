<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="base_wrap">
	<div class="product-list-wrap">
		<p class="title pt40"><span>베스트</span></p>
		<ul class="list"><li><a href="#" class="active">전체보기</a></li></ul>
		<ul class="product-list">
			<c:if test="${list.size() eq 0}"><li class="no-list">등록된 상품이 없습니다.</li></c:if>
			<c:forEach items="${list}" var="dto">
				<li>
					<a href="/shop/product/detail/${dto.pno}" style="background-image: url('${dto.jloc}${dto.jname}');" class="img"><img src="${dto.jloc}${dto.jname}" /></a>
					<a href="/shop/product/detail/${dto.pno}" class="info">
						<span class="name">${dto.brand} ${dto.name}</span>
						<c:if test="${dto.discount > 0}"><span class="dis">${dto.discount}%</span></c:if> <span class="price"><fmt:formatNumber type="number" value="${dto.price}" />원</span>
						<c:if test="${dto.discount > 0}"><span class="dis-price"><fmt:formatNumber type="number" value="${Math.ceil(dto.price - (dto.price * (dto.discount * 0.01)))}" />원</span></c:if>
						<span class="subject">${dto.subject}</span>
					</a>
				</li>
			</c:forEach>
		</ul>
		<div class="product-paging-wrap"><ul class="pagination justify-content-center" id="pageWrap">${paging}</ul></div>
	</div>
</div>