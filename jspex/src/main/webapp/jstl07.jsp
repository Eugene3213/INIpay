<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="pyj" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
     <%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <%@ taglib prefix="dbinfo" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일 차 - JSTL 문자열</title>
<!-- JSTL에는 Math가 없음(cell,round,floor) -->
</head>
<body>
<%
	String msg="테스트 입니다.";
%>
	<pyj:set var="msg" value=" 홍길동님 반갑습니다 "></pyj:set>
		${fn:length(msg)}<br> <!-- 문자열 개수 -->
		${fn:substring(msg,0,3)}<br><!-- 문자열 자를 경우 -->
		${fn:replace(msg,"홍길동","이순신")}<br>	<!-- 문자열 단어 변경 -->
		${fn:indexOf(msg,"길동") }<br> 	<!-- 문자열 단어 검색 -->
		${fn:trim(msg) }<br> 	<!-- 공백 없애기 앞뒤의 공백만-->
	<pyj:out value="${msg}"></pyj:out><br>
	<pyj:out value="<%=msg %>"></pyj:out>
	
	
</body>
</html>