package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class index4 extends HttpServlet {
	PrintWriter pr =null;
	private static final long serialVersionUID = 1L;
       
    public index4(){
    	
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
			//System.out.println(request.getMethod());
			//request.getMethod(): html���� PSOT,GET,PUT Ȯ���� ������
		String m =request.getParameter("userid").intern();
		this.pr = response.getWriter();
		if(m=="") {
			this.pr.print("error");
			//this.pr.print: ajax post, get���� �Ѿ�� �� ���丸 �޾ƾ� �� ���
		}
		else if(m=="hong"){		//���̵� �ߺ� �Ǿ��� �� ajax return
			this.pr.print("no");
		}
		else {		//���̵� �ߺ� ���� �ʾ��� �� ajax return
			this.pr.print("ok");
		}
	}

}
