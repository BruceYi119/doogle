<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
<script>
$(function(){
	//alert($('input[name=test2]').val())
	
	$('input[name=popup_no]').each(function(index){
   		//하고 싶은 내용
		var vpuno=$('input[name=popup_no]:eq(' + index + ')').val();
		var vtitle=$('input[name=popup_title]:eq(' + index + ')').val();
		var vleft=$('input[name=popup_left]:eq(' + index + ')').val();
		var vright=$('input[name=popup_top]:eq(' + index + ')').val();
		var vwidth=$('input[name=popup_width]:eq(' + index + ')').val();
		var vheight=$('input[name=popup_height]:eq(' + index + ')').val();
   		console.log(vpuno);
   		console.log(vtitle);
		window.open("/admin/popup/on?puno="+vpuno, vtitle,"width="+vwidth+", height="+vheight+",left="+vleft+",top="+vright+",resizable=no ,scrollbars=no");
	});
	
	//alert(title+puno+left+right)
})
</script>
<input type="hidden" id="active" value="18" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>팝업관리</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<table class="table product-list">
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>키값</th>
					<th>제목</th>
					<th>시작날짜</th>
					<th>종료날짜</th>
					<th>left/right</th>
					<th>top/bottom</th>
					<th>활성화여부</th>
					<th>수정/삭제</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<!-- 넓이 350 높이 500 네비게이션 안뜨고 나오도록 하는법 찾기
					if문 안에 좌표, 크기 히든값으로 넣기?-->
				<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />			
				<c:set var="i" value="${i}" />
				<c:forEach items="${list}" var="dto"><!-- 바로 밑 c:if는 중복되서 지워도됨 -->
					<c:if test="${today>=dto.start_date && today<=dto.end_date && dto.type=='y'}">
							<c:if test="${today>=dto.start_date && today<=dto.end_date && dto.type=='y'}">
							<input type="hidden" name="popup_no" value="${dto.puno }"/>
							<input type="hidden" name="popup_title" value="${dto.title }"/>
							<input type="hidden" name="popup_left" value="${dto.left }"/>
							<input type="hidden" name="popup_top" value="${dto.top }"/>
							<input type="hidden" name="popup_width" value="${dto.width }"/>
							<input type="hidden" name="popup_height" value="${dto.height }"/>
							</c:if>
						<tr onclick="window.open('/admin/popup/on?puno=${dto.puno}', '${dto.title}','width=350, height=500'); return false" style="cursor: pointer;">
							<td>${i}</td>
							<td>${dto.puno}</td>
							<td>${dto.title}</td>
							<td>${dto.start_date}</td>
							<td>${dto.end_date}</td>
							<td>${dto.left}/${dto.right}</td>
							<td>${dto.top}/${dto.bottom}</td>
							<td>${dto.type}</td>
							<td>${dto.writedate}</td>
							<td>
								<a href="/admin/popup/mod?puno=${dto.puno}"><button type="button" class="btn btn-success">수정</button></a>
								<a href="/admin/popup/delete?puno=${edto.puno}"><button type="button" class="btn btn-danger">삭제</button></a>
							</td>
						</tr>
					</c:if>
					<c:set var="i" value="${i + 1}" />
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>					
					<td colspan="10" class="text-center">
						<ul class="pagination justify-content-center" id="pageWrap">${paging}</ul>
					</td>
				</tr>
				<tr>					
					<td colspan="10" class="text-center"><a href="/admin/popup/add"><button type="button" class="btn btn-primary">등록</button></a></td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>