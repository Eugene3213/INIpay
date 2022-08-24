<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbconfig2.jsp"%>    
     <%
 	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	String sql = "insert into applicant_detail (ap_name,ap_email,ap_date,ap_type,ap_cardnumber,ap_tel)";
	sql += "values('0',?,?,?,?,?,?,default)";
	PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, );
		ps.setString(2, );
		ps.setString(3,);
		ps.setString(4, );
		ps.setString(5, );
		ps.setString(6, );
		
		int n =0;
		n=ps.executeUpdate();
		
		if(n>0){
			out.print("올바르게 저장되었습니다");
		}
		else{
			out.print("올바른 값이 아닙니다.");
		}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>