<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./gselect.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 8일 차 - 갤러리 보드 + DB JOIN</title>
</head>
<body>
	<table border="1" cellspacing="0" cellpadding="0">
		<thead>
			<tr bgcolor="#ccc" style="text-align:center;">
				<td width=80>번호</td>
				<td width=150>이미지</td>
				<td width=300>제목</td>
				<td width=100>글쓴이</td>
				<td width=80>추천수</td>
				<td width=80>첨부파일</td>
				<td width=150>등록일자</td>
			</tr>
		</thead>
		<tbody>
		<%
			int w=0;
			int total = al.size();
			String thumb="";
			while(w < al.size()){
				int no = total-w;
				
				//이미지 일 경우
				if(al.get(w).get("gimg")=="" || al.get(w).get("gimg")==null){
					thumb="NONE";
				}
				else{
					thumb ="<img src=" +(String)al.get(w).get("gimg")+'>';
				}
		%>
			<tr style="text-align:center; height:50px;"> 
				<td><%=no %></td>
				<td><%=thumb%></td>
				<td style="text-align:left;"><%=al.get(w).get("gsubject")%></td>
				<td><%=al.get(w).get("gwriter") %></td>
				<td><%=al.get(w).get("gcount") %></td>
				<td><%=al.get(w).get("rd") %></td>
				<td><%=al.get(w).get("gindate") %></td>
			</tr>
		<%
			w++;
			}
		%>
		</tbody>
	</table>
	<ol style="list-style: none; margin:0; padding:0;">
		<li style="display:inline-block; border:1px solid #ccc; width:30px; height:30px; line-height:30px;">1</li>
	</ol>
	
	<div>
		<form name="f" method="get" action="./paging03.jsp" enctype="application/x-www-form-urlencoded">
			<input type="text" name="" placeholder="이름을 입력하세요">
			<input type="submit" value="검색">
		</form>
	</div>
</body>
</html>