<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp02 쿠키삭제</title>
</head>
<body>
	<%
		Cookie[] ck = request.getCookies();		//서버에서 쿠키값을 가져옴
		ck[1].setMaxAge(0);		//서버에 있는 쿠키 및 클라이언트 쿠키 모두 삭제
		ck[2].setMaxAge(0);
		response.addCookie(ck[1]);	//삭제된 쿠키 값을 서버에 다시 재전송
		response.addCookie(ck[2]);
	%>
</body>
</html>