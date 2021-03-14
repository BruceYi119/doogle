<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="base_wrap" align="center">
	<div id="container">
		<div id="recipe_title">
			<h2>레시피</h2>
		</div>
		<div id="incon">

			<table width=800 align="left">
				<tr id="td_line">
					<th>제목</th>
					<td colspan="3">${rdto.title }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td colspan="3">${rdto.name }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td style="width: 200px;">${rdto.writedate }</td>
					<th>조회수</th>
					<td style="width: 500px;">${rdto.read_cnt }</td>
				</tr>
				<tr>
					<td colspan="4" align="center">${rdto.content }</td>
				</tr>
				<tr>
					<td>RECIPE ITEMS</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4" align="right" id="re_td">
						<a href="../recipe"><div id="re_li">목록</div></a>
					</td>
				</tr>
				<c:if test="${npdto.pre_rno==null}">
					<tr style="border-top: 2px solid;" class="recipe_np">
						<td colspan="4"></td>
					</tr>
				</c:if>
				<c:if test="${npdto.pre_rno!=null}">
					<tr style="border-top: 2px solid;" class="recipe_np">
						<td style="border-right: 1px solid #f4f4f4;">∧이전글</td>
						<td colspan="3"><a href="readnum?rno=${npdto.pre_rno}">${npdto.pre_title}</a></td>
					</tr>
				</c:if>
				<c:if test="${npdto.next_rno!=null}">
					<tr style="border-bottom: 2px solid;" class="recipe_np">
						<td style="border-right: 1px solid #f4f4f4;">∨다음글</td>
						<td colspan="3"><a href="readnum?rno=${npdto.next_rno}">${npdto.next_title}</a></td>
					</tr>
				</c:if>
				<c:if test="${npdto.next_rno==null}">
					<tr style="border-bottom: 2px solid;" class="recipe_np">
						<td colspan="4"></td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>
</div>