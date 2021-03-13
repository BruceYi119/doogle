<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="base_wrap">
	<div class="product-banner">
		<img src="/static/front/img/shop/product_banner_1.jpg" />
	</div>
	<div class="product-list-wrap">
		<p class="title"><img src="/static/front/img/shop/icon_veggies_active.png" /><span>${category.name}</span></p>
		<ul class="list">
			<li><a href="/shop/product/${category.ctno}"<c:if test="${cctno eq null}"> class="active"</c:if>>전체보기</a></li>
			<c:forEach items="${mlist}" var="dto">
				<li><a href="/shop/product/${category.ctno}?cctno=${dto.ctno}"<c:if test="${cctno eq dto.ctno}"> class="active"</c:if>>${dto.name}</a></li>
			</c:forEach>
		</ul>
		<ul class="product-list">
			<c:forEach items="${plist}" var="dto">
				<li>
					<a href="/shop/product/detail/${dto.pno}"><img src="${dto.jloc}${dto.jname}" /></a>
				</li>
			</c:forEach>
		</ul>
		<div class="product-paging-wrap"><ul class="pagination justify-content-center" id="pageWrap">${paging}</ul></div>
	</div>
</div>