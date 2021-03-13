<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="tit_page">
	<h2 class="tit">공지사항</h2>
</div>
<p class="sub">컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</p>
<div id="main">
	<div id="content">
		<div id="qnb" class="quick-navigation" style="top: 70px;">
			<div class="bnr_qnb" id="brnQuick">
				<a href="/shop/board/view.php?id=notice&amp;no=64" id="brnQuickObj">
					<img class="thumb"
					src="https://res.kurly.com/pc/service/main/1904/bnr_quick_20190403.png"
					alt="퀄리티있게 샛별배송">
				</a>
			</div>
			<script src="/static/front/js/notice_view.js"></script>
			<div class="side_menu">
				<a href="/shop/main/html.php?htmid=event/kurly.htm&amp;name=lovers"
					class="link_menu ">등급별 혜택</a> <a
					href="/shop/board/list.php?id=recipe" class="link_menu ">레시피</a> <a
					href="/shop/goods/goods_review_best.php" class="link_menu ">베스트
					후기</a>
			</div>
			<div class="side_recent" style="display: none">
				<strong class="tit">최근 본 상품</strong>
				<div class="list_goods" data-height="209" style="height: 0px;">
					<ul class="list"></ul>
				</div>
				<button type="button" class="btn btn_up off">최근 본 상품 위로 올리기</button>
				<button type="button" class="btn btn_down off">최근 본 상품 아래로
					내리기</button>
			</div>
</div>
<div class="layout-wrapper">
	<div class="xans-element- xans-myshop xans-myshop-couponserial ">
		<table width="100%" align="center" cellpadding="0" cellspacing="0">
			<tbody>
				<tr>
					<td>
						<table width="100%">
							<tbody>
								<tr>
									<td>
										<table class="boardView" width="100%">
											<tbody>
												<tr>
													<th scope="row" style="border: none;">제목</th>
								<td>${dto.title}</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td>${dto.name }</td>
							</tr>
							<tr class="etcArea">
								<td colspan="2">
									<ul>
										<li class="date "><fmt:parseDate
												value="${dto.writedate}" var="writedate"
												pattern="yyyy-MM-dd" /> <strong class="th">작성일</strong>
											<span class="td"><fmt:formatDate
													value="${writedate}" pattern="yyyy-MM-dd" /></span></li>
										<li class="hit "><strong class="th">조회수</strong> <span
											class="td">${dto.read_cnt}</span></li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right" class="eng" style="padding: 5px;"></td>
			</tr>
			<tr>
				<td style="padding: 10px;" height="200" valign="top"
					id="contents">
					<table width="100%" style="table-layout: fixed">
						<tbody>
							<tr>
								<td>${dto.content}</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" bgcolor="#f4f4f4"></td>
			</tr>
		</tbody>
	</table>
	<br>
	<table width="100%" style="table-layout: fixed" cellpadding="0"
		cellspacing="0">
		<tbody>
			<tr>
				<td align="center" style="padding-top: 10px;">
					<table width="100%">
						<tbody>
							<tr>
								<td align="right"><a href="/shop/notice">
								<span class="bhs_button yb" style="float: none;">목록</span>
								</a>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
	<div
		class="xans-element- xans-board xans-board-movement-1002 xans-board-movement xans-board-1002 ">
		<ul>
			<li class="prev "><strong>다음글</strong><a
				href="/board/free/read.html?no=27121&amp;board_no=1&amp;page="></a>
				<a href="/shop/notice_view?no=${dto.nno+1}">${dto1.next}</a>
			</li>
			<li class="next "><strong>이전글</strong><a
				href="/board/free/read.html?no=27121&amp;board_no=1&amp;page="></a>
				<a href="/shop/notice_view?no=${dto.nno-1}">${dto1.prev}</a>
									</li>
									<br>
								</ul>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>