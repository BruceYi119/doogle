<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="/static/back/js/alarm.js"></script>
  
<form action="/shop/alarmApplyOk" method="post">
  <div class="form-group">
    <label>회원번호</label>
    <input type="text" class="form-control" id="mno" name="mno">
  </div>
  <div class="form-group">
    <label>상품번호</label>
    <input type="text" class="form-control" id="pno" name="pno">
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
</form>