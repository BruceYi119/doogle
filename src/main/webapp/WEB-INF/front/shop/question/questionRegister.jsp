<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/static/front/js/questionRegister.js"></script>
   <div id="qnasection">
    <h2>질문지 작성</h2>
    <form action="/shop/questionRegisterOk" method="post">
    <table align="center">
    	<tr>
    		<td>
    		 <label for="sel1">카테고리</label>
    		 </td>
    		 <td>
			  <select class="form-control" id="sel1" name="ctno">
		     	<option value="0">선택</option>
    		 	<option value="1">회원문의</option>
    		 	<option value="2">주문/결제</option>
    		 	<option value="3">취소/교환/반품</option>
    		 	<option value="4">배송문의</option>
    		 	<option value="5">쿠폰/적립금</option>
    		 	<option value="6">서비스 이용 및 기타</option>
			  </select>
    		</td>
    	</tr>
    	
    	<tr>
    		<td class="form-group">
			  <label for="usr">제목</label>
			</td>
			<td>
			  <input type="text" class="form-control" id="usr" name="title">
			</td>
		</tr>
		<tr>
		<td>
			<label for="comment">내용</label>
  		</td>
  		<td>
  			<textarea class="form-control" rows="5" id="summernote" name="content"></textarea>
  		</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<label><input type="checkbox" id="type1">게시글 노출</label>
					<input type="hidden" name="type" id="type" value="n">
			</td>
		</tr>
		 <tr>
		 	<td colspan="2" align="center">
		 		<button type="sumbit" class="btn btn-info">등록</button>
		 	    <button type="reset" class="btn btn-danger">다시작성</button>
	 	   </td>
		 </tr>
		
		
    </table>
</form>    
    </div>