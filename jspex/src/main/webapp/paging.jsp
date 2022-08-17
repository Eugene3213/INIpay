<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="pyj" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
     
     <sql:setDataSource var="dbs"
    url="jdbc:mysql://umj7-016.cafe24.com/parkyj3089"
    driver="com.mysql.jdbc.Driver"
    user="parkyj3089"
    password="fuckyj33"/>
    
    <!-- 리스트 출력 페이지[공지사항, 게시판, 뉴스, Q&A....] 
    	 1. 리스트 데이터를 출력
    	 2. 한 페이지당 출력 할 개수 변수를 세팅
    	 3. SQL 문법에서 select 파트에 limit을 사용
    	 4. 최초 limit에는 '0, 한 페이지당 출력 할 개수'를 적용하여 리스트 출력 화면을 확인
    	 5. count를 하는 SQL 문법을 생성(전체 데이터 개수)
    	 6. 전체 데이터 개수와 한 페이지당 개수를 나누어서 올림으로 총 합계를 구함 Ceil(소수점 첫째 자리 올리는 함수)
    	 	ex) 4.3 => 5page로 표시됨
    	 	※JSP, JAVA, Servlet: Math.round, Math.ceil, Math.Floor 있지만, JSTL은 없음. => 강제 산술식으로 변경 또는 fmt를 이용하여 올림을 할 수 있음
    	 7. 페이지를 반복문으로 해당 개수만큼 출력.
    	 8. 페이지에 JS 함수를 이용하여 파라미터 값으로 페이지를 변경 되도록 함.
    	 9. 파라미터 1 또는 파라미터가 없을 경우 limit에 대한 시작 값을 0으로 처리함.(조건문)
    	 	ex) select * from poll order idx desc limit 시작값, 한페이지당 보여지는 수
    	 10. 파라미터가 1외의 숫자일 경우 limit 시작 값이 변경 되도록 설정.
    	 	ex) (파라미터 값-1) * 한 페이지당 보여지는 수
    	 11. 게시물 순차 번호 출력 사항
    	 	*(전체 게시물-시작 값)-반복문 값 -->
    <%
    	String startpage = null;	//최초 시작되는 페이지 값
    	String pageno = "5";	//한 페이지당 데이터 다섯 개씩
    	String getpage =(String)request.getParameter("p");
    		if(getpage==null || getpage.equals("") || getpage.equals("1")){
    			startpage = "0";
    		}
    		else{
    			int s = Integer.parseInt(pageno);	//한 페이지에 보여줄 데이터 개수
    			int g = Integer.parseInt(getpage);	//페이징 번호값
    			int t =(g-1)*s;						//(페이지 번호-1)*한 페이지당 보여줄 개수
    			startpage = String.valueOf(t);
    		}
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일 차 - 전체 리스트 및 paging 사용법</title>
</head>
<body>
	<!-- 전체 개수 -->
	<sql:query var="num" dataSource="${dbs}">
    	select * from poll order by idx desc;
    </sql:query>
	<pyj:out value="${num.rowCount}"></pyj:out>
	
	<!-- 한 페이지 당 출력 파트 -->
	<sql:query var="datas" dataSource="${dbs}">
    	select * from poll order by idx desc limit <%=startpage%>,<%=pageno %>;
    </sql:query>
    
    
	<table border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td>NO</td>
			<td>아이디</td>
			<td>고객명</td>
			<td>전화번호</td>
			<td>입력일자</td>
		</tr>
		<pyj:set var="spage" value="<%=startpage %>"></pyj:set>
		<pyj:forEach var="data" items="${datas.rows}" varStatus="ct">
		<!-- varStatus: 순번을 체크함 (count(1~부터 시작), index(0~부터 시작) -->
		<tr>
			<td><pyj:out value="${(num.rowCount-spage)-ct.index}"></pyj:out></td>
			<td><pyj:out value="${data['pname']}"></pyj:out></td>
			<td><pyj:out value="${data['pid']}"></pyj:out></td>
			<td><pyj:out value="${data['ptell']}"></pyj:out></td>
			<pyj:set var ="indate" value="${data['pdate']}"></pyj:set>
			<td><pyj:out value="${fn:substring(indate,0,10)}"></pyj:out></td>
		</tr>
		</pyj:forEach>
	</table>
	<table border="1">
		<tr>
			<pyj:set var="pageno" value="<%=pageno %>"></pyj:set>
			<pyj:set var="pagenum" value="${num.rowCount/pageno+((1-num.rowCount/pageno%1)%1)}"></pyj:set>
			<pyj:forEach var="ns" begin="1" end="${pagenum}">
				<td onclick="pagego(${ns})">${ns}</td>
			</pyj:forEach>
		</tr>
	</table>
	
	<script>
		function pagego(p){
			location.href='./paging.jsp?p='+p;
		}
	</script>
</body>
</html>