<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="base_wrap" align="left">
	<div class="product-banner" align="left" style="width:800px;">
		 ${edto.content }
	</div>
	<div class="product-list-wrap" align="center">
		<ul class="list_"> <!-- 클래스 네임 list 스타일 적용 안되서 클래스명 list_로 변경 하였습니다.  -->
			<li><a href=# class="list_nav">전체보기</a></li>
		</ul>
		<div class="clear_div"></div>
		<ul class="product-list">
			<c:forEach items="${plist}" var="dto">
				<li>
					<a href="/shop/product/detail/${dto.pno}" style="background-image: url('${dto.jloc}${dto.jname}');">
					<img src="${dto.jloc}${dto.jname}" />
					<span>
						${dto.brand }&nbsp;${dto.name }<br>
						${dto.discount}% ${dto.price}<br>
						${dto.subject }
					</span>
					</a>
				</li>
			</c:forEach>
		</ul>
		<div class="product-paging-wrap"><ul class="pagination justify-content-center" id="pageWrap">${paging}</ul></div>
	</div>
</div>