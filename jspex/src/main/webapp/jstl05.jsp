<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="pyj" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
     <%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <%@ taglib prefix="uf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일 차 tagdir 사용법</title>
</head>
<body>
	<pyj:set var="username" value="홍길동"></pyj:set>
	<!--태그 파일을 로드 할 떄 사용 함. 사용방식 <prefix 이름:파일명 -->
	<uf:test></uf:test><br>
	<uf:test02>${username }</uf:test02><br>
	<uf:test03>${username }</uf:test03><br>
	<br>
	
</body>
</html>