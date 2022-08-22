<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문자 발송 시스템</title>
</head>
<%
	String no ="123456";
%>
<body>
<!-- SMS: 단문자 -->
<!-- LMS: 장문자 -->
<!-- MMS: 이미지 포함 문자 -->
	<form name="f" id="f" method="post" action="security.jsp">
		<input type="hidden" name="method" value="2">
		수신자번호: <input type="text" name="receivePhone"><br>
		<input type="hidden" name="userDefine">
		<input type="button" value="인증번호받기" onclick="ok();">
	</form>
	<script>
		function ok(){
			f.submit();
		}
	</script>
</body>
</html>