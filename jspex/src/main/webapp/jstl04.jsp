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
    password="fuckyj33" />
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 6일 차 - JSTL SQL 연결</title>
</head>
<body>
<!--dataSource:  =Connect
	query: db쿼리문: (select)  
	update: db쿼리문 (insert, update, delete)
	var로 query문을 실행하게 됨. -->
 <sql:query var="select" dataSource="${dbs}"> 
 	select * from poll order by idx desc;
 </sql:query>
	
 	<!-- columnNames: SQL 필드명을 가져올때 사용 -->
 	<pyj:forEach var="poll" items="${select.columnNames}">
 		<span>
 			<pyj:out value="${poll}"></pyj:out>
 		</span>
 	</pyj:forEach>
 	<br><br><br>
	
	<!-- rows: 필드에 있는 값 -->
	<pyj:forEach var="data" items="${select.rows}">
		<span>
		<!-- ${data['필드명']} -->
			<pyj:out value="${data['pname']}"></pyj:out>
		</span>
		<span>
			<pyj:out value="${data['pid']}"></pyj:out>
		</span>
		<span>
			<input type="button" value="삭제" onclick="abc(${data['idx']})">
		</span>
	</pyj:forEach>
</body>

	<script>
		function abc(z){
		 	alert(z);
		}
	</script>

</html>