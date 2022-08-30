package test3;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

@org.springframework.stereotype.Controller	//Controller임을 알려주는 표시 파일
@RequestMapping("/getinfo")
public class getinfo{
	/* Mapping을 사용하는 이유는 컨트롤러를 통합하여
	 	별도의 view가 필요없이 사용할 때 이용하게 됨
	 	view 1개 + 컨트롤러 1개 <=다수의 class 파일들*/
	
	//@GetMapping("/data")	//GET 데이터를 받음
	@RequestMapping(value="/t1", method=RequestMethod.GET)
	public String t1_get() {
		return "getinfo/t1";
	}
	//@PostMapping("/data2")	//POST 데이터를 받음
	@RequestMapping(value="/t2", method=RequestMethod.POST)
	public String t2_post() {
		return "getinfo/t2";
	}
	//view에 값을 던져주는 역할
	public ModelAndView handleRequest(HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("test");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("getinfo.jsp");
		return mv;
	}
	
	
}
	

