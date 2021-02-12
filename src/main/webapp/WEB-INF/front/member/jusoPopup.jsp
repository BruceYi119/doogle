<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도로명 주소검색</title>
</head>
<script language="javascript">
window.onload = () => {
	var url = location.href;
	var confmKey = '${confmKey}';
	var resultType = '4';
	var inputYn = '${inputYn}';

	if (inputYn != 'Y') {
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.resultType.value = resultType;
		document.form.action = "https://www.juso.go.kr/addrlink/addrLinkUrl.do";
		document.form.submit();
	} else {
		opener.jusoCallBack('${roadAddrPart1}', '${addrDetail}', '${zipNo}', '${func}');
		window.close();
	}
};
</script>
<body>
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value="${confmKey}"/>
		<input type="hidden" id="returnUrl" name="returnUrl" value="/jusoPopup"/>
		<input type="hidden" id="resultType" name="resultType" value="1"/>
	</form>
</body>
</html>