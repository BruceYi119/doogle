<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="base_wrap mt20">
	<div class="detail-wrap">
		<input type="hidden" id="detail-pno" value="${dto.pno}" />
		<div class="left">
			<img src="${dto.jloc}${dto.jname}" />
		</div>
		<div class="right">
			<p class="title">${dto.brand} ${dto.name}</p>
			<p class="sub-title">${dto.subject}</p>
			<p>회원할인가</p>
			<p>${Math.floor(dto.price - (dto.price * (dto.discount * 0.01)))}원 <span>${dto.discount}%</span></p>
			<p>${dto.price}원</p>
		</div>
	</div>
</div>