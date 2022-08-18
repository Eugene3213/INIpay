<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js01 session 삭제</title>
</head>
<body>
<%
// 	session.removeAttribute("mid");
// 	session.removeAttribute("mail");
// 	session.removeAttribute("lv");

 	session.invalidate();	//모든 session 삭제
%>
</body>
</html>