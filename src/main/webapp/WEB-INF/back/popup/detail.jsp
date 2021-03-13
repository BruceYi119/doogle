<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
<script>
$(function(){
	var vpuno=$('input[name=puno]').val();
	var vtitle=$('input[name=title]').val();
	var vleft=$('input[name=left]').val();
	var vright=$('input[name=top]').val();

	//alert(title+puno+left+right)
	window.open("/admin/popup/on?puno="+vpuno, vtitle,"width=455, height=555,resizable=no,left="+vleft+",top="+vright+",scrollbars=no,innerWidth=450,innerHeight=550,location=no");
})
</script>
<input type="hidden" id="active" value="6" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>팝업세부정보</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<input type="hidden" name="puno" value="${dto.puno}"/>
		<input type="hidden" name="title" value="${dto.title}"/>
		<input type="hidden" name="left" value="${dto.left}"/>
		<input type="hidden" name="top" value="${dto.top}"/>
		<table class="table product-mod">
			<tbody>
				<tr>
					<td class="w150">제목</td>
					<td>${dto.title}</td>
				</tr>
				<tr>
					<td>창띄우기</td>
					<td><button type="button" class="btn btn-warning" onclick="window.open('/admin/popup/on?puno=${dto.puno}', '${dto.title}','width=450, height=550,left=${dto.left},top=${dto.top },scrollbars=no'); return false" style="cursor: pointer;">창띄우기</button></td>
				</tr>
				<tr>
					<td>시작일</td>
				<fmt:parseDate value="${dto.start_date}" var="startdate" pattern="yyyy-MM-dd"/>
				<td>
				<fmt:formatDate value="${startdate}" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<td>종료일</td>
				<fmt:parseDate value="${dto.end_date}" var="enddate" pattern="yyyy-MM-dd"/>
				<td>
				<fmt:formatDate value="${enddate}" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<td>left</td>
					<td>${dto.left}</td>
				</tr>
				<tr>
					<td>right</td>
					<td>${dto.right}</td>
				</tr>
				<tr>
					<td>top</td>
					<td>${dto.top}</td>
				</tr>
				<tr>
					<td>bottom</td>
					<td>${dto.bottom}</td>
				</tr>
				<tr>
					<td>활성화여부</td>
					<td>${dto.type}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${dto.content}</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${dto.writedate}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" class="text-center">
						<a href="/admin/popup/mod?puno=${dto.puno}"><button type="button" class="btn btn-success">수정</button></a>
						<a href="/admin/popup/delete?puno=${dto.puno}"><button type="button" class="btn btn-danger">삭제</button></a>
						<a href="/admin/popup"><button type="button" class="btn btn-warning">리스트</button></a>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>