<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="/view/member/update_member.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="mno" value="${dto.mno}" />
	<input type="hidden" name="id" value="${dto.id}" />
	<input type="hidden" name="name" value="${dto.name}" />
	<input type="hidden" name="phone" value="${dto.phone}" />
	<input type="hidden" name="birth" value="${dto.birth}" />
	<input type="hidden" name="zipcode" value="${dto.zipcode}" />
	<input type="hidden" name="addr" value="${dto.addr}" />
	<input type="hidden" name="addr_detail" value="${dto.addr_detail}" />
	<input type="hidden" name="email" value="${dto.email}" />
</form>
<table class="memberInfo">
	<tr><th colspan="2">회원정보</th></tr>
	<tr>
		<th>아이디</th>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>
			<span id="infoName">${dto.name}</span>
			<span class="errMsg"></span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" id="updateName" class="hide" />
			<button type="button" class="btn btn-success" id="infoUpdateBtn">회원정보수정</button>
			<button type="button" class="btn btn-danger hide" id="infoUpdateCancelBtn">취소</button>
		</td>
	</tr>
	<tr>
		<th>연락처</th>
		<td>
			<span id="infoPhone">${dto.phone}</span>
			<span class="errMsg"></span>
			<input type="text" id="updatePhone" class="hide" />
		</td>
	</tr>
	<tr>
		<th>생일</th>
		<td>
			<span id="infoBirth">${dto.birth}</span>
			<span class="errMsg"></span>
			<input type="text" id="updateBirth" class="hide" />
		</td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td>
			<span id="zipcode">${dto.zipcode}</span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-info" id="searAddrBtn">주소검색</button>
			<button type="button" class="btn btn-success hide" id="addrUpdateBtn">수정</button>
			<button type="button" class="btn btn-danger hide" id="addrUpdateCancel">취소</button>
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td><span id="addr">${dto.addr}</span></td>
	</tr>
	<tr>
		<th>상세주소</th>
		<td>
			<span id="addr_detail">${dto.addr_detail}</span>
			<span class="errMsg"></span>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
			<span id="infoEmail">${dto.email}</span>
			<span class="errMsg"></span>
			<input type="text" id="updateEmail" class="hide" />
		</td>
	</tr>
	<tr>
		<th>가입일</th>
		<td>${dto.writedate}</td>
	</tr>
</table>