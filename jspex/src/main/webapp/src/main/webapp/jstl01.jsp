<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="jh" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- jsp를 추가 이용하여 if,for 기타등등 쉽게 적용할 수 있도록 사용하는 방식
    	 prefix: 생성 태그명(jsp 전체를 컨트롤 함) prefix="" 변수 마음대로 작성 가능
    	 uri: 외부 jstl 코어를 가져올 때 사용
    	 tagdir: 자신의 서버에 있는 코어를 사용할 때-->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 6일 차 - JSTL1 문법</title>
<!-- 
	JSP(if, for, while, db)-> JSTL로 쉽게 내장객체로 접근 하도록 하는 라이브러리
	JSTL -> jstl.jar 라이브러리가 필요함
 -->
 <%
 	request.setCharacterEncoding("utf-8");
 	String user = request.getParameter("user");
	response.setContentType("text/html; charset=utf-8");
	//out.print(user);
 %>
 <!-- JSTL 태그 출력 파트 
 	 out: 출력파트
 	 set: 변수 선언할때
 	 remove: 변수를 제어할 때 사용
 	 catch: 예외처리-->
 	<jh:set var="user" value="<%=user %>"></jh:set>
 	<!-- var: 변수명을 생성
 		 value: 값을 입력 받음 -->
</head>
<body>
	<form name="f" id="f" method="post" action="./jstl01.jsp">
		<input type="text" name="user">
		<input type="submit" value="전송">
	</form>
 	<span>고객명: <jh:out value="${user2}"></jh:out></span>
 	<!-- out: 출력. value만 존재함 -->
</body>
</html>