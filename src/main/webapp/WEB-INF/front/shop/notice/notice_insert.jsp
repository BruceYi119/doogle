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
<h3>공지사항 작성</h3>
<form action="/shop/notice_insert_ok" method="post">
<table border="1">
<tr>
	<td>작성자<input type="text" name="name"></td>
</tr>
<tr>
	<input type="hidden" name="state" id="idstate" value=0>
	<td>제목<input type="text" name="title"></td>
</tr>
<tr>
	<td align="center">
	<label><input type="checkbox" id="type1">게시글 노출</label>
	<input type="hidden" name="type" id="type" value="n">
	<span>공지등록<input type="checkbox" id="nState_YN"></span>
	</td>
</tr>
<tr>
	<td>공지내용<textarea rows="5" cols="30" name="content" id="summernote"></textarea></td>
</tr>
<tr>
	<td><input type="submit" value="작성하기">
</tr>
</table>
</form>
</div>
