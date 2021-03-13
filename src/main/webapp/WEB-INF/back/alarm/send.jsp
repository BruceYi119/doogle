<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 문자보내는 폼 -->
<form method="get" id="smsForm" action="/admin/alarmPhoneSendOk2">
<table border = "1" align="right" width = "300" height = "200" >
 
<tr>
<td>
<center>
<br>
<span style="color: green; font-weight: bold;">SMS 전송 (문자보내기)</span>
 </center>
    <ul>
      <li>보낼사람 : <input type="text" name="from" placeholder=" 전화번호 입력 ( '-' 포함 )"/></li><br>
      <li>내용 : <textarea name="text" placeholder=" 보낼 내용 입력 "></textarea>    </li><br>
      <center>
      <input type="submit" value="전송하기" /><br>
      </center>
    </ul>
 
    </td>
    </tr>
    </table>
  </form>
 
  <script>
    function sendSMS(pageName){
 
        console.log("문자를 전송합니다.");
        $("#smsForm").attr("action"); //위에 있는 폼태그를 컨트롤러로 전송한다.
        $("#smsForm").submit();
    }
  </script>