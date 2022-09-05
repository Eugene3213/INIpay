package mydb;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class select2 {
	@Autowired
	BasicDataSource dataSource;
	public void setdb(BasicDataSource dataSource) {
		this.dataSource = dataSource;
	}
	
		@RequestMapping("select2.do")
		public String dbselect2(Model m) {
			//System.out.println(this.dataSource);
			modelDAO da= new modelDAO(this.dataSource);
			String ct = da.d_select();
			
			return "view/select2";
	}
}
