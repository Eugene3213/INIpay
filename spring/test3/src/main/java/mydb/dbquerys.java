package mydb;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class dbquerys {
	//DI(Dependency Injection): web.xml
	//IOC (객체에 따른 의존성 메소드 호출) - bean과 연계
//	@Autowired		//IOC에 등록된 bean에 대한 id값을 가져와서 사용하는 형태
//	BasicDataSource dataSource;
//	Connection con = null;
//	PreparedStatement pr = null;

//	@RequestMapping("/insert.do")
//	public String dbinsert(Model m) throws Exception{
//		con=dataSource.getConnection();
//		String sql="insert into test3 values('0',?,?,?,?.?)";
//		String msg="error";
//		pr =con.prepareStatement(sql);
//		pr.setString(1, "park");
//		pr.setString(2, "a1234567");
//		pr.setString(3, "박찬호");
//		pr.setString(4, "01012345678");
//		pr.setString(5, "48");
//		int n = pr.executeUpdate();
//		if(n>0){
//			msg="ok";
//		}
//		m.addAttribute("result",msg);
//		
//		return "insert";
//	}
//	
//	@RequestMapping("/select.do")
//	public String db_select(Model m) {
//			//database load 하는 부분
//			public ArrayList<modelDAO> getAllList(){
//				try {
//					con = dataSource.getConnection();
//					String sql = "select *from test3";
//					pr =con.prepareStatement(sql);
//					ResultSet rs = pr.executeQuery();
//					ArrayList<Map<String, Object>> pso = new  ArrayList<Map<String, Object>>();
//					//DAO를 사용하지 않고, 배열형태로 생성 후 view에서 jstl로 출력
//					while(rs.next()) {
//						Map<String, Object> mp = new HashMap<String, Object>();
//						//DB에 있는 필드값을 map으로 이관하는 형태
//						mp.put("midx", rs.getString("midx"));
//						mp.put("mid", rs.getString("mid"));
//						mp.put("mpw", rs.getString("mpw"));
//						mp.put("mname", rs.getString("mname"));
//						mp.put("mtel", rs.getString("mtel"));
//						mp.put("mage", rs.getString("mage"));
//						pso.add(mp);	//모든 데이터를 반복하면 ArrayList 생성
//					
//					}
//					m.addAttribute("pso",pso);	//view로 전송
//				}catch(Exception e) {
//					e.printStackTrace();
//				}		
//				return "view/select";
//			}
//		}	
	}
