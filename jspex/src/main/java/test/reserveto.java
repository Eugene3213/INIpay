package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class reserveto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public reserveto() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		String username = request.getParameter("username");
		String userph = request.getParameter("userph");
		String usermail = request.getParameter("usermail");
		String admin = request.getParameter("admin");
		
		StringBuffer buff = new StringBuffer();
		Random rd = new Random();
		int w=0;
		while(w<10) {
			int a = rd.nextInt(10);
			switch(a) {
			case 0:
				buff.append((char)(rd.nextInt(10)));
				break;
			}
			w++;
		}
		String key = buff.toString();
	
		
		
		String host = "smtp.naver.com";
		String user = admin;
		String password = "177185Pc!!";
		
		Properties pr = new Properties();
		pr.put("mail.smtp.host", host);
		pr.put("mail.smtp.port", 587);
		pr.put("mail.smtp.auth", true);	//메일 전송에 따른 연결 인증절차
		pr.put("mail.smtp.debug", true);	//메일 회신 정보 결과
		pr.put("mail.smtp.socketFactory.port", 587);	//자신의 pc 포트를 오픈
		pr.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		Session se = Session.getDefaultInstance(pr, new Authenticator() {
		
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage msg = new MimeMessage(se);
			msg.setFrom(new InternetAddress(admin,"펜션주인장"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(usermail));
			msg.setSubject(username+"님 펜션 예약 정보 입니다");
			String img="<span style='display:black; border:1px solid #ccc;"
					+ "<a href='http://parkyj3089.cafe24.com/reserve.jsp?mail="+usermail+"'>"
					+"</a>"
					+"고객명:"+username+"<br>"
					+"연락처:"+userph+"<br>"
					+"이메일:"+usermail+"<br>"
					+"예약번호"+key+"-"+key+"<br>"
					+"<input type='button' value='입금하기'>"
					+ "</span>";
			msg.setContent(img,"text/html;charset=utf-8");
			
			Transport.send(msg);
			System.out.println("전송완료");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
