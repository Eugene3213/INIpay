package test1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class index implements Controller {
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg","Spring �� �ǰ� �ֽ��ϴ�.");
		mv.addObject("data1","ȫ�浿!");
		//mv.setViewName("/WEB-INF/view/index.jsp");	
			//setView: URL�� �̵��Ǹ鼭 ���� �ٸ� ȭ������ �̵��� ��
			//setViewName:  URL��ȭ�� ����, �ش� ȭ���� �ڽ��� ���������� ��� �� request�� ������.
			//view�� ���� ���丮 �������� �����ؾ���
		return mv;
	}
	public void data1() {
		
	}
}
