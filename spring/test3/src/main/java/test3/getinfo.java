package test3;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@Controller
public class getinfo{
	
	
	@RequestMapping("/userinfo")	//url에 method를 연결시켜주는 어노테이션
	public String abc(Model model) {
		//ModelAndView: 배열 키값이 있는 형태로 저장하는 방식
		//Model: 서버 메모리에 자료를 저장하는 방식
		String user = "홍길동";
		model.addAttribute("username",user);
		return "view/info2";	//view라는 디렉토리 안에 info2.jsp를 매핑하라는 뜻
		//return "/WEB-INF/view/info.jsp";
		//mapping.xml에 view-resolvers 설정하지 않을 경우
	}
}
