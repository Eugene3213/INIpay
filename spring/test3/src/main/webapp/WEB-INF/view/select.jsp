<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="Z" %>
    <!-- jstl: taglib으로 생성하여 배열값을 출력시킴 pom 두 가지를 설치(jstl,  tarlib)  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연동 IOC - dbquerys.java(Controller)</title>
</head>
<body>
<!-- controller에서 medle값으로 보내준 클래스명으로 var 변환하여  key로 출력시킨 -->
<z:foreach items="${pso}" var="test">
고객명:  ${test.mname}<br>
고객전화번호: ${test.mtel}
</z:foreach>

</body>
</html>