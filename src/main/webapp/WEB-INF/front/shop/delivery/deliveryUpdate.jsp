<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/static/front/css/deliveryUpdate.css">
<script src="/static/front/js/deliveryUpdate.js"></script>
<form action="#" method="post" name="mk">
<input type="hidden" value="${param.dno}" name="dno">
<table width="400" align="center">
	<tr>
		<td><h2>배송지수정</h2></td>
	</tr>
	<tr>
		<td>기본 배송지</td>
	</tr>
	<tr>
		<td>${addr}</td>
	</tr>
	<tr>
		<td><input type="text" name="addr_detail" class="input" value="${addr_detail}"></td>
	</tr>
	<tr>
		<td>받으실 분</td>
	</tr>
	<tr>
		<td><input type="text" name="receive_name" placeholder="이름을 입력해주세요" class="input"></td>
	</tr>
	<tr>
		<td>휴대폰</td>
	</tr>
	<tr>
		<td><input type="text" name="phone" placeholder="번호를 입력해주세요" class="input"></td>
	</tr>
	<tr>
		<td align="center"><button onclick="update()" class="save">저장</button>
	</tr>
</table>
	</form>
<table width="400" align="center" class="table2">
		<tr>
		<td align="center"><button onclick="deliveryDelete()" class="save1">삭제</button>
	</tr>
</table>
