package test3;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class api {
	
//	@RequestMapping("/check_page.do")
//	public void postck(@ModelAttribute ck ck, Model m, HttpServletResponse resp) throws IOException {
//		String result2="";
//		System.out.println(ck.getSecurity());
//		if(ck.getSecurity().intern()=="a123456") {
//			result="ok";
//		}
//		else {
//			result="cancel";
//		}
//		m.addAttribute("result2", result2);
//		
//		String url= "http://192.168.1.131:8080/test3/result.jsp"+result;
//		resp.sendRedirect(url);
//	}
	
	//@RequestParam: 받는 변수값을 다른 변수명으로 변환할 때 사용함
	@RequestMapping("/dataload.do")
	public String da(Model m, @RequestParam("users") String user2) {
		String callsign = user2;
		String call="";
		if(callsign.equals("hong")) {
			call="ok";
		}
		else {
			call="no";
		}
		m.addAttribute("call",call);
		return "view/result2";
	}
}
