package webpage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbcp.BasicDataSource;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class movie_api {
	private String apikey=null;
	private String apidate=null;
	private String result = null;
	protected String json_parsing = null;
	//method=RequestMethod.GET: front에서 전송된 데이터를 get으로만 통신하겠다는 뜻
	//@Getmapping or @PostMapping @Put....:  method=RequestMethod.GET 속성을 사용하지 않음
	
	@Autowired
	BasicDataSource dataSource;
	
	@RequestMapping(value="/movie",produces ="text/html;charset=utf-8",method=RequestMethod.GET)
	public String apiserver(String apikey, String apidate, HttpServletResponse res){
		
		try {	
			res.setContentType("text/html; charset=utf-8");	
			this.apikey = apikey;
			this.apidate = apidate;
				if(!this.apikey.equals("null") || !this.apikey.equals("")) {
					if(this.apikey.equals("movie_parkyj3213") && !this.apidate.equals("")) {
						//DB호출
						Connection con = dataSource.getConnection();
								String sdate = this.apidate + " 00:00:00";
						String edate = this.apidate + " 23:59:59";
					
						String sql = "select * from apimovie where aindate >= ? and aindate <= ?";
						PreparedStatement pr = con.prepareStatement(sql);
							pr.setString(1, sdate);
							pr.setString(2, edate);
					
						ResultSet rs = pr.executeQuery();
							
						JSONArray ja = new JSONArray();
							while(rs.next()) {
								JSONObject jb = new JSONObject();
								jb.put("aidx", rs.getString("adix"));
								jb.put("arank", rs.getString("arank"));
								jb.put("arankpart", rs.getString("arankpart"));
								jb.put("aperson", rs.getString("aperson"));
								jb.put("anm", rs.getString("anm"));
								jb.put("aindate", rs.getString("aindate"));	
								ja.add(jb);
							}
							
						result = ja.toString();
					
					}
					else {
						result = "error:32";						
					}
					
				}
		}catch(Exception e) {
			result="error2:31";
		}
		return result;	
	}
}
