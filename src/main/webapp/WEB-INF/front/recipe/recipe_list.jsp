<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="base_wrap" align="center">
	<div id=container align="left">
		<h6>레시피</h6>
		<input type="hidden" name="hd" id="hd" value="${hd}" />
		<div id="con_nav">
			<a href="/shop/recipe?&hd=1"><div>전체보기</div></a> 
			<a href="/shop/recipe?ctno=223&hd=2"><div>매일밥상</div></a> 
			<a href="/shop/recipe?ctno=224&hd=3"><div>특별한날</div></a> 
			<a href="/shop/recipe?ctno=225&hd=4"><div>간단요리</div></a>
		</div>

		<div id="incontainer" align="left">
			<form method="post" action="/shop/recipe">
				<table align="center" width="1050">
					<tr id="search_td">
						<td colspan="2" align="right"><input type="text" name="title"
							id="search" /><input type="submit" value=" ⌕ "></td>
					</tr>
					<tr>
						<c:set var="ck" value="1" />
						<c:set var="i" value="${i}" />
						<c:forEach var="rdto" items="${rlist}" varStatus="status">
							<!-- 한페이지 12개 나와야함 -->

							<td class="main_class">
								<div id="main_list"
									onclick="location.href='/shop/recipe/readnum?rno=${rdto.rno}'">
									<div id="main_jpg">
										<img src="${flist[i-1].loc }${flist[i-1].name }">
									</div>
									<div id="main_title">${rdto.title}</div>
								</div>
							</td>

						<c:if test="${ck%2 == 0}">
					</tr>
					<tr>
						</c:if>
						<c:set var="ck" value="${ck+1 }" />
						<c:set var="i" value="${i + 1}" />
						</c:forEach>
					<tr>
						<td colspan="2"><ul class="pagination justify-content-center"
								id="pageWrap">${paging}</ul></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
