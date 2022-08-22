package test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public index() {
    	super();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	req.setCharacterEncoding("utf-8");
    	resp.setContentType("text/html; charset=utf-8");
    	String mid = "홍길동님 황연합니다.";
    	String product ="로봇청소기";
    	String imgs="../img/thum_new01.png";
    	
    	req.setAttribute("product", product);
    	req.setAttribute("msg", mid);
    	req.setAttribute("imgs", imgs);
    	
    	RequestDispatcher rd = req.getRequestDispatcher("main.jsp");
    	rd.forward(req, resp);
    
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
