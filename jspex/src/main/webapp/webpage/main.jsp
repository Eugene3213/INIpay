<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹페이지 메인</title>
</head>
<%
	String m =(String)request.getAttribute("msg");
	String p =(String)request.getAttribute("product");
	String img =(String)request.getAttribute("imgs");
%>
<script src="./ckeditor/ckeditor.js"></script> <!-- ckeditor 엔진 -->
<body>
	<header style="height:200px; background-color:yellowgreen;">
		<%@ include file="top.jsp" %>
	</header>
	<section style="height:800px; background-color:orange;">
		<%@ include file="view.jsp" %>
	</section>
	<footer style="height:100px; background-color:gray;">
		<%@ include file="footer.jsp" %>
	</footer>
</body>
<script>
<!-- ckeditor 엔진에 해당 name값을ㅇ 가진 오브젝트를 로드하게 됨-->
	CKEDITOR.replace("notice_text");
</script>
</html>