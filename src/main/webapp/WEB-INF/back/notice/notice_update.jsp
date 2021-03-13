<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>공지추가</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<form action="/admin/notice_updateOk" method="post">
		<input type="hidden" value="${dto.nno}" name="nno" >
			<table class="table">
				<input type="hidden" name="state" id="idstate" value=1>
				<tbody>
					<tr>
						<td class="w150">작성자</td>	
						<td><input type="text" name="name" value="${dto.name}"/></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" value="${dto.title}" /></td>
					</tr>
					<tr>
						<td>공지내용</td>
						<td><textarea rows="5" cols="30" name="content" id="summernote">${dto.content }</textarea></td>
					</tr>
					<tr>
						<td>공지/일반글</td>
						<td>
							공지등록<input type="checkbox" value="n" id="state_register" checked />
						</td>
					</tr>
					<tr>
						<td>게시여부</td>
						<td>
							게시 <input type="radio" value="y"  id="gesi" name="type" checked="checked" />
							비공개 <input type="radio" value="n" id="gesi1" name="type"/>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="text-center">
							<button type="submit" class="btn btn-primary">등록</button>
							<a href="/admin/notice"><button type="button" class="btn btn-warning">리스트</button></a>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</div>