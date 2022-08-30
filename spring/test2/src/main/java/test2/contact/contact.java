package test2.contact;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class contact implements Controller{

	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("contact.contact");
		//.사용 이유는 tiles.xml과 연동하기 위해서. 그외에는 /가 기본적으로 사용되어야 함
		return mv;
	}
}
