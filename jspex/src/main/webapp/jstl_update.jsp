<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="pyj" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
     <%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <!-- setDataSource: DB 연결 태그 -->
<sql:setDataSource var="dbs"
    url="jdbc:mysql://umj7-016.cafe24.com/parkyj3089"
    driver="com.mysql.jdbc.Driver"
    user="parkyj3089"
    password="fuckyj33"/>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일 차 - SQL 데이터 수정</title>
</head>
<body>
	<sql:update var="result" dataSource="${dbs}">
		update poll set ptell=? where idx=?
		<sql:param value="01012340007"/>
		<sql:param value="3"/>
	</sql:update>
	
	<pyj:if test="${result==1}">수정완료</pyj:if>
	<pyj:if test="${result==0}">수정오류</pyj:if>
</body>
</html>