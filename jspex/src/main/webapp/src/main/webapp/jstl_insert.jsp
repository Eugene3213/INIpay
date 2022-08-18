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
<title>JSP 7일 차 - JSTL SQL 데이터 입력</title>
</head>
<body>
	<sql:query var="sresult" dataSource="${dbs}">
		select count(*) from poll where pid="lee";
	</sql:query>
	<!-- 해당 값에 대한 SQL에 저장 여부를 확인 하는 작업 -->
<%-- 	<pyj:out value="${sresult.rowCount}"></pyj:out><br> --%>
<%-- 	<pyj:out value="${sresult.rowsByIndex[0][0]}"></pyj:out> --%>
	
	<pyj:if test="${sresult.rowsByIndex[0][0]==0 }">
	
	<sql:update var="result" dataSource="${dbs}">
		insert into poll values ('0','유관순','Yukwan','01051253334','3','2022-08-16 15:13:22');
	</sql:update>
<!-- 	update: insert, update, delete 세 가지만 사용 -->
	
	<pyj:if test="${result==0}">입력 오류</pyj:if>
	<pyj:if test="${result==1}">입력 성공</pyj:if>

	</pyj:if>
</body>
</html>