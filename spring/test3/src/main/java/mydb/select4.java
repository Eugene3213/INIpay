package mydb;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class select4 {
	@Inject
	//private DataSource dataSource;
	private SqlSessionFactory sqlFactory;
	
	
	Connection con = null;
	@RequestMapping("/select.do")
	public String homepage(Model m) {
		try {
			
			//con=dataSource.getConnection();
			SqlSession session = sqlFactory.openSession();
			System.out.println("db connection");
		}catch(Exception e) {
			
		}
		
		return "view/select4";
	}
}
