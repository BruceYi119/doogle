<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	.table{text-align: center;}
	 h3{text-align: center;}
</style>
<script src="/static/front/js/deliveryPop.js"></script>
<h3>샛별 배송 Doogle과 함께</h3>
<form id="mk" class="form-inline" action="" method="post">
<input type="hidden" name="type">
<table class="table">
<tr class="info">
	<td><label for="id">회원번호</label></td>
	<td><input type="text" name="mno" maxlength="12"  value="${mno}"/></td>
</tr>
<tr class="info">
<td><label for="name">이름</label></td>
<td><input type="text" name="receive_name" placeholder="이름" class="input"/></td>
</tr>
<tr class="info">
	<td> <label for="phone">연락처</label></td>
	<td><input type="text" name="phone" placeholder="연락처" class="input" /></td>
</tr>
<%-- <tr class="info">
	<td><label for="zipcode">우편번호</label></td>
	<td><input type="text" name="zipcode" placeholder="우편번호" class="input" disabled="disabled" value="${param.zipNo }"/></td>
</tr> --%>
<tr class="info">
	<td><label for="addr">주소</label></td>
	<td><input type="text" name="addr" placeholder="주소" class="input" value="${param.roadAddrPart1 }"/></td>
</tr>	
<tr class="info">
	<td><label for="addr_detail">상세주소</label></td>
	<td><input type="text" name="addr_detail" placeholder="상세주소" class="input"  value="${param.addrDetail }" /></td>
</tr>
<tr class="info">
	<td> <label for="default_yn">기본배송지로 설정</label></td>
	<td><input type="checkbox" id="default_set" onclick="beasong()" checked/>
		<input type="hidden" name=default_yn" value="y" id="default_yn">
	</td>
</tr> 
<tr class="info">
	<td colspan="2" align="center"><input type="button" value="저장하기" title="저장하기" alt="저장하기" class="btn2 active" onclick="deliveryInsert()" /></td>
</tr>	
</table>
</form>

