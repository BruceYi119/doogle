<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="base_wrap mt65 mb120">
	<div id="proposition-write">
		<h2>상품제안</h2>
		<div>
			<ul class="gray-list">
				<li>마켓컬리에서 추가적으로 판매되면 좋을 상품을 제안해주세요.</li>
				<li>고객님의 의견을 발 빠르게 반영하여 더욱 편리한 마켓컬리가 되겠습니다.</li>
				<li>주의)알콜 제품은 법령상 온라인 판매가 불가하오니,이 점 참고하여 작성부탁드립니다.</li>
				<li>담당 MD가 제안해주신 의견을 실시간으로 모니터링할 예정이나, 별도 답변 안내는 되지 않음을 양해부탁드립니다.</li>
			</ul>
			<div class="section-wrap">
			<form method="post" action="propositionUpdateOk" onsubmit="return propositionCheck()">
			<input type="hidden" name="ppno" value="${dto.ppno }" enctype="multipart/form-data">
				<table class="table">
					<tr>
						<th>제목</th>
						<td>
							<select name="ctno">
								<option>선택해주세요</option>
							<c:forEach var="category" items="${category }">
							<c:if test="${category.ctno!=dto.ctno }">
								<option value="${category.ctno }">${category.name }</option>
							</c:if>
							<c:if test="${category.ctno==dto.ctno }">
								<option value="${category.ctno }" selected>${category.name }</option>
							</c:if>
							</c:forEach>
							</select><p>
							<input type="text" name="title" value="${dto.title }">	
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" id="summernote">${dto.content }</textarea></td>
					</tr>
					<tr>
						<th>이미지</th>
						<td>
							<table id="table">
								<tr>
									<td style="text-align:center;">1</td>
									<td>
										<input type="file">
										<a href="javascript:add()">
											<img src="/static/front/img/shop/plus_btn.png">
										</a>
									</td>
								</tr>
							</table>
							<span id="small">-파일은 최대 5개까지 업로드가 지원됩니다.</span>
						</td>
					</tr>
					<tr>
						<td colspan="2" id="submit_td"><input type="submit" value="수정"></td>
					</tr>
				</table>
			</form>
			</div>
		</div>
	</div>
</div>