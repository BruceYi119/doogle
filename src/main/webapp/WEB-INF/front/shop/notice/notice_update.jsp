<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.container{margin: auto; text-align: center;}
table {
    margin-left:auto; 
    margin-right:auto;
}
</style>
<script src="/static/front/js/notice_insert.js"></script>
<div class="container">
<h3>공지사항 수정</h3>
<form action="/shop/notice_update_ok" method="post" name="mk">
<table border="1">
<tr>
	<td>작성자<input type="text" name="name" value="${dto.name}"></td>
</tr>
<tr>
	<input type="hidden" name="nno" value="${dto.nno}" />
	<input type="hidden" value="${dto.state}" id="uState" />
	<input type="hidden" name="state" id="idstate" value=0 />
	<td>제목<input type="text" name="title" value="${dto.title}"><span>공지등록<input type="checkbox" id="nState_YN"></span></td>
</tr>
<tr>
	<td>공지내용<textarea rows="5" cols="30" name="content" id="summernote">${dto.content }</textarea></td>
</tr>
<tr>
	<td><input type="submit" value="작성하기">
</tr>
</table>
</form>
</div>
