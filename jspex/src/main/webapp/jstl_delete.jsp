<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="pyj" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
     <%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>

<sql:setDataSource var="dbs"
    url="jdbc:mysql://umj7-016.cafe24.com/parkyj3089"
    driver="com.mysql.jdbc.Driver"
    user="parkyj3089"
    password="fuckyj33"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일 차 - SQL 데이터 삭제</title>
</head>
<body>
	<sql:update dataSource="${dbs}" var="result">
		delete from poll where pid=?
		<sql:param value="lee"></sql:param>
		<!-- param: ? 사용가능 -->
	</sql:update>
	<pyj:if test="${result==1 }">삭제완료</pyj:if>
	<pyj:if test="${result==0 }">삭제오류</pyj:if>
</body>
</html>