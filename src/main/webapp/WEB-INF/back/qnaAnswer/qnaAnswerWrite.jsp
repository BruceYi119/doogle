<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<form action="/admin/qnaAnswerWriteOk" method="post">
			<table class="table">
			<th class="input_txt">제목</th>
			<input type="hidden" value="${dto.ctno}" id="ctno">
			<input type="hidden" value="${dto.qnno}" name="qnno">
			<input type="hidden" value="Doogle" name="name">
			<td>
				<select class="ctno" required="" fld_esssential="" label="질문유형" class="select" readonly="readonly">
					<option value="">선택해주세요.</option>
					<option value="243">배송지연/불만</option>
					<option value="244">컬리패스 (무료배송)</option>
					<option value="245">반품문의</option>
					<option value="246">A/S문의</option>
					<option value="247">환불문의</option>
					<option value="248">주문결제문의</option>
					<option value="249">회원정보문의</option>
					<option value="250">취소문의</option>
					<option value="251">교환문의</option>
					<option value="252">상품정보문의</option>
					<option value="253">기타문의</option>
				</select><br> 
						
				<input type="text" value="${dto.title}" readonly="readonly">
				</td>
				
				<tbody>
					<tr>
						<td class="w150">작성자</td>	
						<td><input type="text" value="${dto.name}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>주문번호</td>
						<td><input type="text" value="${dto.ono}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>회원번호</td>
						<td><input type="text" value="${dto.mno}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" value="${dto.email}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" value="${dto.phone}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>문의 내용</td>
						<td><textarea rows="5" cols="30" id="summernote">${dto.content}</textarea></td>
					</tr>
				</tbody>
				<tr>
						<td>답변 내용</td>
						<td><textarea rows="5" cols="50" name="content" ></textarea></td>
					</tr>
				<tfoot>
					<tr>
						<td colspan="2" class="text-center">
							<button type="submit" class="btn btn-primary">답변 등록</button>
							<a href="/admin/notice"><button type="button" class="btn btn-warning">리스트</button></a>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</div>