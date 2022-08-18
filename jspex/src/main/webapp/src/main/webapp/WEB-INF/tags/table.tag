<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ tag import="java.sql.*"%>

<%
	Connection con =null;
	try{
		String driver ="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://umj7-016.cafe24.com/parkyj3089";
		String user="parkyj3089";
		String password="fuckyj33";
		Class.forName(driver);
		con= DriverManager.getConnection(url,user,password);
		out.print("Db 접속 성공");
	
		String sql="select*from poll order by idx desc";
		try{
			PreparedStatement ps =con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				out.print(rs.getString("pid"));			
			}
		}catch(Exception e){
			
		}
	
	}
	catch(Exception e){
		e.getMessage();
	}
%>