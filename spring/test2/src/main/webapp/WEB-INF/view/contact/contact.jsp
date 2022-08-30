<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<tiles:insertDefinition name="myapp.homepage" />
   <!-- tiles.apache.org: backend가 유일하게 페이지 레이아웃을 구성하는 라이브러리 있음 
   		tiles 라이브러리를 꼭 pom.xml에 추가하고  tiles.xml을 생성하여 적용해 주도록 한다
   		단, class에 대한 경로 사용 시 /가 아닌 .으로 설정해야 함
   -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<body>
<!-- header -->

<tiles:insertAttribute name="header"></tiles:insertAttribute>
<section style="background-color: orange;">
고객센터 메인
</section>
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
<!-- footer -->
</body>
</html>