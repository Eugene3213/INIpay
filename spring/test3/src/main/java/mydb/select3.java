package mydb;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class select3 {

	@RequestMapping("select3.do")
	public String lombok(Model m) {
		lombok_DAO ld = new lombok_DAO();
		//각 setter값을 전달
		ld.setUsername("홍길동");
		ld.setUserid("hong");
		ld.setUserage("50");
		
		//각각의 DAO 값을 가져오는 getter 부분
		m.addAttribute("mname", ld.getUsername());
		m.addAttribute("mid", ld.getUserid());
		m.addAttribute("mage", ld.getUserage());
		
		//view로 처리 하는 부분
		return "select3";
		
	}
}
