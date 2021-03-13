<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" id="active" value="18" />
<div class="w3-white w3-padding notranslate fix mt-3">
	<h3>팝업추가</h3>
</div>
<div class="w3-padding w3-white notranslate">
	<div class="table-responsive">
		<form action="/admin/popup/add/ok"  method="post">
		<input type="hidden" name="right" value='0' />
		<input type="hidden" name="bottom" value='0' />
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title"><td>
				</tr>
				<tr>
					<td>시작날짜</td>
					<td>
						<div class="cal1">
							<input class="cal-input" name="start_date" onclick="calendar(event)">
							<img src="//res.kurly.com/pc/ico/1117/btn_calendar.png" class="calImg">
						</div>
					<td>
				</tr>
				<tr>
					<td>종료날짜</td>
					<td>
						<div class="cal1">
							<input class="cal-input" name="end_date" onclick="calendar(event)">
							<img src="//res.kurly.com/pc/ico/1117/btn_calendar.png" class="calImg">
						</div>
					<td>
				</tr>
				<tr>
					<td>left</td>
					<td><input type="text" name="left"><td>
				</tr>
				<tr>
					<td>top</td>
					<td><input type="text" name="top"><td>
				</tr>
				<tr>
					<td>넓이</td>
					<td><input type="text" name="width"><td>
				</tr>
				<tr>
					<td>높이</td>
					<td><input type="text" name="height"><td>
				</tr>
				<tr>
					<td>내용</td> <!-- summer 붙이기 -->
					<td><textarea id="summernote" name="content"></textarea><td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="저장하기"><td>
				</tr>
			</table>	
		</form>
	</div>
</div>