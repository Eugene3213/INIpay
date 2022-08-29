package test1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class main implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user ="ÀÌ¼ø½Å";
		ModelAndView mv =new ModelAndView();
		mv.addObject("user",user);
		return mv;
	}
}
