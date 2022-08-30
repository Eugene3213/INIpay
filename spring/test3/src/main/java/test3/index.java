package test3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class index implements Controller{

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//listdb ld = new listdb();
		
		ModelAndView mv = new ModelAndView();
		test3.dbservice ds =new dbservice("hong", "a1234", "홍길동", "01012345678", "30");
		listdb lb = new listdb();
		String msg = lb.insert(ds);
		mv.addObject("msg",msg);
		mv.setViewName("/index.jsp");
		return mv;
	}
}
