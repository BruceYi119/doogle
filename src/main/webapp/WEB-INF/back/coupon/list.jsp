<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<body>
<input type="hidden" id="active" value="22" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>쿠폰리스트</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<table class="table product-list">
			<thead class="thead-dark">
				<tr>
					<th>쿠폰번호</th>
					<th>상품번호</th>
					<th>쿠폰내용</th>
					<th>할인율</th>
					<th>할인금액</th>
					<th>할인구분</th>
					<th>유효기간(시작일)</th>
					<th>유효기간(만료일)</th>
					<th>등록일</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<tbody>
			   <c:forEach var="coupon" items= "${couponlist}">
						<tr>
							<td>${coupon.cno}</td>
							<td>${coupon.pno}</td>
							<td>${coupon.content}</td>
							<td>${coupon.discount}</td>
							<td>${coupon.dis_price}</td>
							<td>${coupon.dis_type}</td>
							<td>
								<fmt:parseDate value="${coupon.srat_expiry}" var="srat_expiry" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${srat_expiry}" pattern="yyyy.MM.dd" />
							</td>
							<td>
								<fmt:parseDate value="${coupon.end_expiry}" var="end_expiry" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${end_expiry}" pattern="yyyy.MM.dd" />
							</td>
							<td>
								<fmt:parseDate value="${coupon.writedate}" var="writedate" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${writedate}" pattern="yyyy.MM.dd" />
							</td>
							
							<td>
							<a href="/admin/coupon/mod?cno=${coupon.cno}"><button type="button" class="btn btn-success">수정</button></a>
							<a href="/admin/coupon/del?cno=${coupon.cno}"><button type="button" class="btn btn-danger">삭제</button></a>
							</td>
						</tr>
		       </c:forEach>
		    </tbody>
   			<tfoot>
				<tr>					
					<td colspan="24" class="text-center">
						<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
					</td>
				</tr>
				<tr>					
					<td colspan="24" class="text-center"><a href="/admin/coupon/add"><button type="button" class="btn btn-primary">등록</button></a></td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
</body>
</html>