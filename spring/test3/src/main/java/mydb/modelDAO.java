package mydb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.apache.catalina.session.DataSourceStore;
import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;

public class modelDAO {

	@Autowired
	BasicDataSource dataSource;	//null로 표기가 됨
	
	Connection conn =null;
	PreparedStatement prs =null;
	
	private String midx;
	private String mid;
	private String mpw;
	private String mname;
	private String mtel;
	private String mage;
	public String getMidx() {
		return midx;
	}
	public void setMidx(String midx) {
		this.midx = midx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMage() {
		return mage;
	}
	public void setMage(String mage) {
		this.mage = mage;
	}
	public modelDAO(BasicDataSource dataSource) {
		//System.out.println(dataSource);
		this.dataSource = dataSource;
	}
	public String d_select() {
		String ct = null;
		try {
			String sql ="select count(*) as ctn from test3";
			conn = this.dataSource.getConnection();
			prs = conn.prepareStatement(sql);
			ResultSet rs = prs.executeQuery();
			while(rs.next()) {
				ct =rs.getString("ctn");				
			}
		}catch(Exception e) {
			
		}finally {
			try {
				if(conn!=null) conn.close();
				if(prs!=null) prs.close();
			}catch(Exception e) {
				
			}
		}
		return ct;
	}
}
