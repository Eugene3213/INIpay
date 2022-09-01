package test3;

import java.sql.*;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class dbquerys {
	//DI(Dependency Injection): web.xml
	//IOC (객체에 따른 의존성 메소드 호출) - bean과 연계
	@Autowired		//IOC에 등록된 bean에 대한 id값을 가져와서 사용하는 형태
	BasicDataSource dataSource;
	
	@RequestMapping("/select.do")
	public String db_select(Model m) {
		Connection con = null;
		PreparedStatement pr = null;
		try {
			con = dataSource.getConnection();
			String sql = "select * from count(*) as cnt from test3";
			pr =con.prepareStatement(sql);
			ResultSet rs = pr.executeQuery();
			
			while(rs.next()) {
				m.addAttribute("data_rows", rs.getString("cnt"));
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pr!=null) pr.close();
				if(con!=null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return "view/select";
	}
}
