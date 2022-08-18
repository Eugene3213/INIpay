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
<title>JSP 7일 차 tagdir 사용법 응용</title>
</head>
<body>
<%-- 	<dbinfo:table></dbinfo:table>  --%>
	<!--해당 tag안에 있는 값을 jsp에서 외부로 가져오는 것은 어려움 -->
<%-- 	<span><%=request.getAttribute("userid") %></span> --%>

<!-- taglibs 라이브러리 파일 중 spec.jar이 있어야만 tag 파일과 return 값을 받을 수 있음 -->
<dbinfo:table02 no="100" no2="홍길동님 환영합니다"></dbinfo:table02>
리턴값: ${returncall}<br>
리턴값: ${returncall2}<br>
</body>
</html>