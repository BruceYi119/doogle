<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="title"><h1><a href="/">Doogle</a></h1></div>
<form action="/join_ok">
	<fieldset class="join">
		<legend>회원가입</legend>
		<h3><label for="id">아이디</label></h3>
		<div class="field"><input type="text" name="id" maxlength="12" placeholder="아이디" class="input" /></div>
		<div class="field errMsg"></div>
		<h3><label for="pw">비밀번호</label></h3>
		<div class="field"><input type="password" name="pw" maxlength="12" placeholder="비밀번호" class="input" /></div>
		<div class="field errMsg"></div>
		<h3><label for="pw2">비밀번호 확인</label></h3>
		<div class="field"><input type="password" name="pw2" maxlength="12" placeholder="비밀번호확인" class="input" /></div>
		<div class="field errMsg"></div>
		<h3><label for="name">이름</label></h3>
		<div class="field"><input type="text" name="name" placeholder="이름" class="input" /></div>
		<div class="field errMsg"></div>
		<h3><label for="phone">연락처</label></h3>
		<div class="field"><input type="text" name="phone" placeholder="연락처" class="input" /></div>
		<div class="field errMsg"></div>
		<h3><label for="birth">생년월일</label></h3>
		<div class="field"><input type="text" name="birth" placeholder="생년월일 2021-01-01" class="input" /></div>
		<div class="field errMsg"></div>
		<h3><label for="zipcode">우편번호</label> <button type="button" class="btn btn-info" id="searAddrBtn">주소검색</button></h3>
		<div class="field"><input type="text" name="zipcode" placeholder="우편번호" class="input" disabled="disabled" /></div>
		<div class="field errMsg"></div>
		<h3><label for="addr">주소</label></h3>
		<div class="field"><input type="text" name="addr" placeholder="주소" class="input" disabled="disabled" /></div>
		<div class="field errMsg"></div>
		<h3><label for="addr_detail">상세주소</label></h3>
		<div class="field"><input type="text" name="addr_detail" placeholder="상세주소" class="input" disabled="disabled" /></div>
		<div class="field errMsg"></div>
		<h3><label for="email">이메일</label></h3>
		<div class="field"><input type="text" name="email" placeholder="이메일" class="input" /></div>
		<div class="field errMsg"></div>
		<div class="field mt20"><input type="submit" value="가입하기" title="가입하기" alt="가입하기" /></div>
	</fieldset>
</form>