<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
외부서버에서 값을 받음: <%request.getParameter("result");%>
<br>
내부서버에서 값을 받음: ${call}
</body>
</html>