package test3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//DB 접속 출력
public class listdb {

	public String url= "jdbc:mysql://umj7-016.cafe24.com/parkyj3089";
	public String id ="parkyj3089";
	public String pw ="fuckyj33";
	public String driver="com.mysql.jdbc.Driver";
	
	public Connection con = null;
	
	
	public String insert(dbservice dbservice) throws SQLException, ClassNotFoundException{
		String result="error";
		String mid = dbservice.mid;
		String mpw = dbservice.mpw;
		String usernm = dbservice.usernm;
		String tel = dbservice.tel;
		String age = dbservice.age;
		String sql = "insert into test3(midx,mid,mpw,usernm,tel,age) values ('0',?,?,?,?,?)";
		
		Class.forName(driver);
		con = DriverManager.getConnection(url,id,pw);
		PreparedStatement pr = con.prepareStatement(sql);
		pr.setString(1, mid);
		pr.setString(2, mpw);
		pr.setString(3, usernm);
		pr.setString(4, tel);
		pr.setString(5, age);
		
		int n = pr.executeUpdate();
		if(n>0) {
			result="ok";
		}
		pr.close();
		con.close();
		return result;
		
	}
	
}
