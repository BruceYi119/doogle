<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="title"><h1><a href="/">Doogle</a></h1></div>
<form action="/login_ok">
	<fieldset>
		<legend>로그인</legend>
		<div class="field">관리자 로그인 <input type="checkbox" name="admin" /></div>
		<div class="field"><input type="text" name="id" class="login" maxlength="12" /></div>
		<div class="field" id="errId"></div>
		<div class="field"><input type="password" name="pw" class="login" maxlength="12" /></div>
		<div class="field" id="errMsg">${loginErr}</div>
		<div class="field"><input type="submit" value="로그인" title="로그인" alt="로그인" class="login" /></div>
	</fieldset>
</form>