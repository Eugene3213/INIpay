<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
<%
	response.setContentType("text/html; charset=utf-8");
	Connection con = null;
	try{
		String d = "com.mysql.jdbc.Driver";
		String u = "jdbc:mysql://umj7-016.cafe24.com/parkyj3089";
		String user ="parkyj3089";
		String pw ="fuckyj33";
		Class.forName(d);
		con = DriverManager.getConnection(u,user,pw);
		//out.print("접속성공");
	}catch(Exception e){
		e.getMessage();
	}
%>
