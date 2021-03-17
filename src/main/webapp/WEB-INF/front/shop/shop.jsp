<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<input type="hidden" id="qnb-top" value="638" />
<div id="main-slide" class="carousel slide" data-ride="carousel">
	<ul class="carousel-indicators">
		<li data-target="#main-slide" data-slide-to="0" class="active"></li>
		<li data-target="#main-slide" data-slide-to="1"></li>
		<li data-target="#main-slide" data-slide-to="2"></li>
		<li data-target="#main-slide" data-slide-to="3"></li>
		<li data-target="#main-slide" data-slide-to="4"></li>
		<li data-target="#main-slide" data-slide-to="5"></li>
		<li data-target="#main-slide" data-slide-to="6"></li>
		<li data-target="#main-slide" data-slide-to="7"></li>
		<li data-target="#main-slide" data-slide-to="8"></li>
		<li data-target="#main-slide" data-slide-to="9"></li>
	</ul>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="/static/front/img/shop/banner_main1.webp" alt="배너1">
		</div>
		<div class="carousel-item">
			<img src="/static/front/img/shop/banner_main2.webp" alt="배너2">
		</div>
		<div class="carousel-item">
			<img src="/static/front/img/shop/banner_main3.webp" alt="배너3">
		</div>
		<div class="carousel-item">
			<img src="/static/front/img/shop/banner_main4.webp" alt="배너4">
		</div>
		<div class="carousel-item">
			<img src="/static/front/img/shop/banner_main5.webp" alt="배너5">
		</div>
		<div class="carousel-item">
			<img src="/static/front/img/shop/banner_main6.webp" alt="배너6">
		</div>
		<div class="carousel-item">
			<img src="/static/front/img/shop/banner_main7.webp" alt="배너7">
		</div>
		<div class="carousel-item">
			<img src="/static/front/img/shop/banner_main8.webp" alt="배너8">
		</div>
		<div class="carousel-item">
			<img src="/static/front/img/shop/banner_main9.webp" alt="배너9">
		</div>
		<div class="carousel-item">
			<img src="/static/front/img/shop/banner_main10.webp" alt="배너10">
		</div>
	</div>
	<a class="carousel-control-prev" href="#main-slide" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>
	<a class="carousel-control-next" href="#main-slide" data-slide="next"><span class="carousel-control-next-icon"></span></a>
</div>
<div class="tit-goods"><h3>이 상품 어때요?</h3></div>
<div class="base_wrap">
	<div id="product-slide1" class="carousel slide product-slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<c:set var="i" value="1" />
			<c:forEach items="${slist}" var="dto">
				<c:if test="${i % 4 eq 1 || i == 1}"><div class="carousel-item<c:if test='${i == 1}'> active</c:if>"><ul class="product-slide-list"></c:if>
					<li>
						<a href="/shop/product/detail/${dto.pno}"><img style="background-image: url('${dto.jloc}${dto.jname}');" class="product-slide-img" /></a>
						<a href="/shop/product/detail/${dto.pno}" class="info">
							<span class="name">${dto.brand} ${dto.name}</span>
							<c:if test="${dto.discount > 0}"><span class="dis">${dto.discount}%</span></c:if> <span class="price"><fmt:formatNumber type="number" value="${dto.price}" />원</span>
							<c:if test="${dto.discount > 0}"><span class="dis-price"><fmt:formatNumber type="number" value="${Math.ceil(dto.price - (dto.price * (dto.discount * 0.01)))}" />원</span></c:if>
						</a>
					</li>
				<c:if test="${i % 4 eq 0}"></ul></div></c:if>
				<c:set var="i" value="${i + 1}" />
			</c:forEach>
		</div>
		<a class="carousel-control-prev hide" href="#product-slide1" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>
		<a class="carousel-control-next" href="#product-slide1" data-slide="next"><span class="carousel-control-next-icon"></span></a>
	</div>
</div>
<div class="main-bg">
	<div class="tit-goods"><h3><a href="/shop/event">이벤트 소식</a></h3></div>
	<div class="base_wrap">
		<ul id="product-slide2" class="product-slide-list">
			<li><a href="/shop/product/detail/1052"><img style="background-image: url('/static/upload/img/shop/product/1052.jpg');" class="product-slide-img" /></a></li>
			<li><a href="/shop/product/detail/390"><img style="background-image: url('/static/upload/img/shop/product/390.jpg');" class="product-slide-img" /></a></li>
			<li><a href="/shop/product/detail/6364"><img style="background-image: url('/static/upload/img/shop/product/6364.jpg');" class="product-slide-img" /></a></li>
		</ul>
	</div>
</div>
<div class="tit-goods"><h3><a href="/shop/product/dis">알뜰상품</a></h3></div>
<div class="base_wrap">
	<div id="product-slide3" class="carousel slide product-slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<c:set var="i" value="1" />
			<c:forEach items="${dlist}" var="dto">
				<c:if test="${i % 4 eq 1 || i == 1}"><div class="carousel-item<c:if test='${i == 1}'> active</c:if>"><ul class="product-slide-list"></c:if>
					<li>
						<a href="/shop/product/detail/${dto.pno}"><img style="background-image: url('${dto.jloc}${dto.jname}');" class="product-slide-img" /></a>
						<a href="/shop/product/detail/${dto.pno}" class="info">
							<span class="name">${dto.brand} ${dto.name}</span>
							<c:if test="${dto.discount > 0}"><span class="dis">${dto.discount}%</span></c:if> <span class="price"><fmt:formatNumber type="number" value="${dto.price}" />원</span>
							<c:if test="${dto.discount > 0}"><span class="dis-price"><fmt:formatNumber type="number" value="${Math.ceil(dto.price - (dto.price * (dto.discount * 0.01)))}" />원</span></c:if>
						</a>
					</li>
				<c:if test="${i % 4 eq 0}"></ul></div></c:if>
				<c:set var="i" value="${i + 1}" />
			</c:forEach>
		</div>
		<a class="carousel-control-prev hide" href="#product-slide3" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>
		<a class="carousel-control-next" href="#product-slide3" data-slide="next"><span class="carousel-control-next-icon"></span></a>
	</div>
</div>
<div class="tit-goods"><h3>MD의 추천</h3></div>
<div class="base_wrap">
	<div class="category-list">
		<ul>
			<c:set var="i" value="0" />
			<c:forEach items="${clist}" var="dto">
				<c:if test="${dto.name ne '컬리의 추천'}"><li><a href="/shop/product/category/${dto.ctno}" ctno="${dto.ctno}" name="${dto.name}" class="btn-product-category<c:if test="${i eq 0}"> on</c:if>">${dto.name}</a></li></c:if>
				<c:set var="i" value="${i + 1}" />
			</c:forEach>
		</ul>
	</div>
	<div id="product-slide4" class="carousel slide product-slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<c:set var="i" value="1" />
			<c:forEach items="${mdlist}" var="dto">
				<c:if test="${i % 4 eq 1 || i == 1}"><div class="carousel-item<c:if test='${i == 1}'> active</c:if>"><ul class="product-slide-list"<c:if test='${i == 1}'> id="md1"</c:if><c:if test='${i == 5}'> id="md2"</c:if>></c:if>
					<li>
						<a href="/shop/product/detail/${dto.pno}"><img style="background-image: url('${dto.jloc}${dto.jname}');" class="product-slide-img" /></a>
						<a href="/shop/product/detail/${dto.pno}" class="info">
							<span class="name">${dto.brand} ${dto.name}</span>
							<c:if test="${dto.discount > 0}"><span class="dis">${dto.discount}%</span></c:if> <span class="price"><fmt:formatNumber type="number" value="${dto.price}" />원</span>
							<c:if test="${dto.discount > 0}"><span class="dis-price"><fmt:formatNumber type="number" value="${Math.ceil(dto.price - (dto.price * (dto.discount * 0.01)))}" />원</span></c:if>
						</a>
					</li>
				<c:if test="${i % 4 eq 0}"></ul></div></c:if>
				<c:set var="i" value="${i + 1}" />
			</c:forEach>
		</div>
		<a class="carousel-control-prev hide" href="#product-slide4" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>
		<a class="carousel-control-next" href="#product-slide4" data-slide="next"><span class="carousel-control-next-icon"></span></a>
	</div>
	<p class="btn-product-category-wrap"><a href="/shop/product/${clist[0].ctno}" class="link"><span>${clist[0].name} 전체보기</span></a></p>
</div>
<div class="wrap-container">
	<div class="bnr_main">
		<a href="#">
			<span class="tit">장바구니 자랑하면 5천원의 행운이 매일!</span>
			<span class="txt">매일 20분께 드리는 적립금 혜택!</span>
		</a>
	</div>
</div>
<div class="tit-goods">
	<h3>
		<a href="/shop/product/new" class="no-icon">
			<span class="title">오늘의 신상품</span>
			<span class="desc">매일 정오, 컬리의 새로운 상품을 만나보세요</span>
		</a>
	</h3>
</div>
<div class="base_wrap">
	<div id="product-slide5" class="carousel slide product-slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<c:set var="i" value="1" />
			<c:forEach items="${nlist}" var="dto">
				<c:if test="${i % 4 eq 1 || i == 1}"><div class="carousel-item<c:if test='${i == 1}'> active</c:if>"><ul class="product-slide-list"></c:if>
					<li>
						<a href="/shop/product/detail/${dto.pno}"><img style="background-image: url('${dto.jloc}${dto.jname}');" class="product-slide-img" /></a>
						<a href="/shop/product/detail/${dto.pno}" class="info">
							<span class="name">${dto.brand} ${dto.name}</span>
							<c:if test="${dto.discount > 0}"><span class="dis">${dto.discount}%</span></c:if> <span class="price"><fmt:formatNumber type="number" value="${dto.price}" />원</span>
							<c:if test="${dto.discount > 0}"><span class="dis-price"><fmt:formatNumber type="number" value="${Math.ceil(dto.price - (dto.price * (dto.discount * 0.01)))}" />원</span></c:if>
						</a>
					</li>
				<c:if test="${i % 4 eq 0}"></ul></div></c:if>
				<c:set var="i" value="${i + 1}" />
			</c:forEach>
		</div>
		<a class="carousel-control-prev hide" href="#product-slide5" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>
		<a class="carousel-control-next" href="#product-slide5" data-slide="next"><span class="carousel-control-next-icon"></span></a>
	</div>
</div>
<div class="main-bg">
	<div class="tit-goods"><h3><a href="/shop/product/best">지금 가장 핫한 상품</a></h3></div>
	<div class="base_wrap">
		<div id="product-slide6" class="carousel slide product-slide" data-bs-ride="carousel">
			<div class="carousel-inner">
			<c:set var="i" value="1" />
				<c:forEach items="${blist}" var="dto">
					<c:if test="${i % 4 eq 1 || i == 1}"><div class="carousel-item<c:if test='${i == 1}'> active</c:if>"><ul class="product-slide-list"></c:if>
						<li>
							<a href="/shop/product/detail/${dto.pno}"><img style="background-image: url('${dto.jloc}${dto.jname}');" class="product-slide-img" /></a>
							<a href="/shop/product/detail/${dto.pno}" class="info">
								<span class="name">${dto.brand} ${dto.name}</span>
								<c:if test="${dto.discount > 0}"><span class="dis">${dto.discount}%</span></c:if> <span class="price"><fmt:formatNumber type="number" value="${dto.price}" />원</span>
								<c:if test="${dto.discount > 0}"><span class="dis-price"><fmt:formatNumber type="number" value="${Math.ceil(dto.price - (dto.price * (dto.discount * 0.01)))}" />원</span></c:if>
							</a>
						</li>
					<c:if test="${i % 4 eq 0}"></ul></div></c:if>
					<c:set var="i" value="${i + 1}" />
				</c:forEach>
			</div>
			<a class="carousel-control-prev hide" href="#product-slide6" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>
			<a class="carousel-control-next" href="#product-slide6" data-slide="next"><span class="carousel-control-next-icon"></span></a>
		</div>
	</div>
</div>
<!-- <div class="main-bg"> -->
<!-- 	<div class="tit-goods"> -->
<!-- 		<h3> -->
<!-- 			<a href="#" class="no-icon"> -->
<!-- 				<span class="title">늘 기분 좋은 가격</span> -->
<!-- 				<span class="desc">가격부터 늘 기분 좋은 두글 장바구니 필수템</span> -->
<!-- 			</a> -->
<!-- 		</h3> -->
<!-- 	</div> -->
<!-- 	<div class="base_wrap"> -->
<!-- 		<div id="product-slide7" class="carousel slide product-slide" data-bs-ride="carousel"> -->
<!-- 			<div class="carousel-inner"> -->
<%-- 				<c:set var="i" value="1" /> --%>
<%-- 				<c:forEach items="${slist}" var="dto"> --%>
<%-- 					<c:if test="${i % 4 eq 1 || i == 1}"><div class="carousel-item<c:if test='${i == 1}'> active</c:if>"><ul class="product-slide-list"></c:if> --%>
<%-- 						<li><a href="/shop/product/detail/${dto.pno}"><img style="background-image: url('${dto.jloc}${dto.jname}');" class="product-slide-img" /></a></li> --%>
<%-- 					<c:if test="${i % 4 eq 0}"></ul></div></c:if> --%>
<%-- 					<c:set var="i" value="${i + 1}" /> --%>
<%-- 				</c:forEach> --%>
<!-- 			</div> -->
<!-- 			<a class="carousel-control-prev hide" href="#product-slide7" data-slide="prev"><span class="carousel-control-prev-icon"></span></a> -->
<!-- 			<a class="carousel-control-next" href="#product-slide7" data-slide="next"><span class="carousel-control-next-icon"></span></a> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- <div class="tit-goods"><h3><a href="#">두글이 만든 상품</a></h3></div> -->
<!-- <div class="base_wrap"> -->
<!-- 	<div id="product-slide8" class="carousel slide product-slide" data-bs-ride="carousel"> -->
<!-- 		<div class="carousel-inner"> -->
<%-- 			<c:set var="i" value="1" /> --%>
<%-- 			<c:forEach items="${slist}" var="dto"> --%>
<%-- 				<c:if test="${i % 4 eq 1 || i == 1}"><div class="carousel-item<c:if test='${i == 1}'> active</c:if>"><ul class="product-slide-list"></c:if> --%>
<%-- 					<li><a href="/shop/product/detail/${dto.pno}"><img style="background-image: url('${dto.jloc}${dto.jname}');" class="product-slide-img" /></a></li> --%>
<%-- 				<c:if test="${i % 4 eq 0}"></ul></div></c:if> --%>
<%-- 				<c:set var="i" value="${i + 1}" /> --%>
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
<!-- 		<a class="carousel-control-prev hide" href="#product-slide8" data-slide="prev"><span class="carousel-control-prev-icon"></span></a> -->
<!-- 		<a class="carousel-control-next" href="#product-slide8" data-slide="next"><span class="carousel-control-next-icon"></span></a> -->
<!-- 	</div> -->
<!-- </div> -->
<div class="tit-goods"><h3><a href="#">두글의 레시피</a></h3></div>
<div class="base_wrap">
	<div id="product-slide9" class="carousel slide product-slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<ul class="product-slide-list recipe">
					<li><a href="/shop/recipe/content?rno=1"><img style="background-image: url('/static/front/img/shop/recipe/recipe1.jpg');" class="product-slide-img" /></a></li>
					<li><a href="/shop/recipe/content?rno=2"><img style="background-image: url('/static/front/img/shop/recipe/recipe2.jpg');" class="product-slide-img" /></a></li>
					<li><a href="/shop/recipe/content?rno=3"><img style="background-image: url('/static/front/img/shop/recipe/recipe3.jpg');" class="product-slide-img" /></a></li>
				</ul>
			</div>
		</div>
		<a class="carousel-control-prev hide" href="#product-slide9" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>
		<a class="carousel-control-next hide" href="#product-slide9" data-slide="next"><span class="carousel-control-next-icon"></span></a>
	</div>
</div>
<div class="tit-goods"><h3>인스타그램 고객 후기</h3></div>
<div class="base_wrap">
	<div id="product-slide10" class="carousel slide product-slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<ul class="product-slide-list instar">
					<li><a href="https://www.instagram.com/p/CMBWwbTpgze/" target="_blank"><img src="/static/front/img/shop/img_instar1.jpg" alt="상품이미지"></a></li>
					<li><a href="https://www.instagram.com/p/CL8mFLwpBvJ/" target="_blank"><img src="/static/front/img/shop/img_instar2.jpg" alt="상품이미지"></a></li>
					<li><a href="https://www.instagram.com/p/CLtEYTNpMDA/" target="_blank"><img src="/static/front/img/shop/img_instar3.jpg" alt="상품이미지"></a></li>
					<li><a href="https://www.instagram.com/p/CLqlHqgpQwd/" target="_blank"><img src="/static/front/img/shop/img_instar4.jpg" alt="상품이미지"></a></li>
					<li><a href="https://www.instagram.com/p/CLlT9DiJgOK/" target="_blank"><img src="/static/front/img/shop/img_instar5.jpg" alt="상품이미지"></a></li>
					<li><a href="https://www.instagram.com/p/CLS615zpwLp/" target="_blank"><img src="/static/front/img/shop/img_instar6.jpg" alt="상품이미지"></a></li>
				</ul>
			</div>
			<div class="carousel-item">
				<ul class="product-slide-list instar">
					<li><a href="https://www.instagram.com/p/CLGVMJpJY7r/" target="_blank"><img src="/static/front/img/shop/img_instar7.jpg" alt="상품이미지"></a></li>
					<li><a href="https://www.instagram.com/p/CLBkjugpKrf/" target="_blank"><img src="/static/front/img/shop/img_instar8.jpg" alt="상품이미지"></a></li>
					<li><a href="https://www.instagram.com/p/CK5HdanJLXa/" target="_blank"><img src="/static/front/img/shop/img_instar9.jpg" alt="상품이미지"></a></li>
					<li><a href="https://www.instagram.com/p/CK0Fk8Opzlc/" target="_blank"><img src="/static/front/img/shop/img_instar10.jpg" alt="상품이미지"></a></li>
					<li><a href="https://www.instagram.com/p/CKvWCaHpSAH/" target="_blank"><img src="/static/front/img/shop/img_instar11.jpg" alt="상품이미지"></a></li>
					<li><a href="https://www.instagram.com/p/CKDCsW_pjfT/" target="_blank"><img src="/static/front/img/shop/img_instar12.jpg" alt="상품이미지"></a></li>
				</ul>
			</div>
		</div>
		<a class="carousel-control-prev hide" href="#product-slide10" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>
		<a class="carousel-control-next" href="#product-slide10" data-slide="next"><span class="carousel-control-next-icon"></span></a>
	</div>
</div>
<div class="instar-link">
	<span>더 많은 고객 후기가 궁금하다면?</span>
	<a href="https://www.instagram.com/marketkurly_regram/" target="_blank">@doogle_shopping</a>
</div>
<div class="wrap-container">
	<a href="#"><img src="/static/front/img/shop/footer_banner.png" id="img-delivery" /></a>
</div>