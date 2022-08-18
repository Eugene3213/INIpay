<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="pyj" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
     <%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <!-- core: 기본엔진
    	 fn: 문자열 함수
    	 sql: DB연결
    	 fmt(formattting): 시간, 날짜, 다국어 --> 
     <%
     	request.setCharacterEncoding("utf-8");
     	//응용문제
		String data[] = {"홍길동","이순신","강감찬","유관순"};
     %>
     <pyj:set var = "user" value="<%=data %>"></pyj:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 6일 차  - JSTL 반복문</title>
</head>
<!-- forEach: JSTL에 반복문 출력 부분 -->
<body>
	<table>
		<tr>
			<pyj:forEach var="a" begin="1" end="5">
				<td><pyj:out value="${a }"></pyj:out></td>
			</pyj:forEach>
		</tr>
	</table>
	<br><br>
	<pyj:forEach var="b" begin="2" end="4">
		<pyj:forEach var="c" begin="1" end="5">
			<span>${b }*${c } =${b*c }</span><br>
		</pyj:forEach>
	</pyj:forEach>
	<br><br><br><br>
	
<%-- 	<pyj:forEach var="nm" items="${user}"> --%>
<%-- 		고객명: ${nm }<br> --%>
<%-- 	</pyj:forEach> --%>

	<pyj:forEach var="nm" begin="0" end="${fn:length(user)-1 }">
		고객명: ${user[nm] }<br>
	</pyj:forEach>
</body>
</html>