<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="pyj" uri="http://java.sun.com/jsp/jstl/core" %>
     <%
     	request.setCharacterEncoding("utf-8");
     	String nb =request.getParameter("number");
     %>
     <pyj:set var="n" value="<%=nb%>"></pyj:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl02.html 연동 jsp</title>
</head>
<body>
<%-- 	<pyj:choose> --%>
<%-- 		<pyj:when test="${n%2==0 }"> --%>
<%-- 			<pyj:out value="${n}"></pyj:out>은 짝수 입니다. --%>
<%-- 		</pyj:when> --%>
		
<%-- 		<pyj:when test="${n%2!=0 }"> --%>
<%-- 			<pyj:out value="${n}"></pyj:out>은 홀수 입니다. --%>
<%-- 		</pyj:when> --%>
<%-- 	</pyj:choose> --%>
	<!-- choose: 다중처리 조건문을 사용함
		 if: 조건문을 처리함
		 when: choose태그와 함께 사용하는 태그명: 참 일경우
		 		otherwise: 거짓 일경우 -->
	<pyj:if test="${n eq '홍길동' }">
		<span>가입 고객입니다</span>	
	</pyj:if>
</body>
</html>