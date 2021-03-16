<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="base_wrap">
	<div class="product-banner">
		<img src="/static/front/img/shop/product_banner_1.jpg" />
	</div>
	<div class="product-list-wrap">
		<p class="title"><img src="/static/front/img/shop/${icon}" /><span>${category.name}</span></p>
		<ul class="list">
			<li><a href="/shop/product/${category.ctno}"<c:if test="${cctno eq null}"> class="active"</c:if>>전체보기</a></li>
			<c:forEach items="${mlist}" var="dto">
				<li><a href="/shop/product/${category.ctno}?cctno=${dto.ctno}"<c:if test="${cctno eq dto.ctno}"> class="active"</c:if>>${dto.name}</a></li>
			</c:forEach>
		</ul>
		<ul class="product-list">
			<c:if test="${plist.size() eq 0}"><li class="no-list">등록된 상품이 없습니다.</li></c:if>
			<c:forEach items="${plist}" var="dto">
				<li>
					<a href="/shop/product/detail/${dto.pno}" style="background-image: url('${dto.jloc}${dto.jname}');" class="img"><img src="${dto.jloc}${dto.jname}" /></a>
					<a href="/shop/product/detail/${dto.pno}" class="info">
						<span class="name">${dto.brand} ${dto.name}</span>
						<c:if test="${dto.discount > 0}"><span class="dis">${dto.discount}%</span></c:if> <span class="price"><fmt:formatNumber type="number" value="${dto.price}" />원</span>
						<c:if test="${dto.discount > 0}"><span class="dis-price"><fmt:formatNumber type="number" value="${dto.price - (dto.price * (dto.discount * 0.01))}" />원</span></c:if>
						<span class="subject">${dto.subject}</span>
					</a>
				</li>
			</c:forEach>
		</ul>
		<div class="product-paging-wrap"><ul class="pagination justify-content-center" id="pageWrap">${paging}</ul></div>
	</div>
</div>