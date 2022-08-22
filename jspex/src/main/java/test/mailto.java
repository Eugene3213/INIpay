package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.PasswordAuthentication;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class mailto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public mailto() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		Properties prop = new Properties();	//Properties, Map: 같은 속성(키 값이 있는 배열)
			prop.put("mail.smtp.host","smtp.gamil.com");
			prop.put("mail.smtp.port","587");
			prop.put("mail.smtp.auth","true");
			prop.put("mail.smtp.starttls.enable","true");
			prop.put("mail.smtp.ssl.trust","smtp.gmail.com");
		
			
			try {
				Authenticator auth =new SMTP();
				Session sess = Session.getDefaultInstance(prop,auth);
				Message msg =new MimeMessage(sess);
				
				msg.setFrom(new InternetAddress("parkyj3213@gamil.com","177185Pc!!"));
				msg.addRecipient(Message.RecipientType.TO,new InternetAddress(postmail));
				msg.setSubject(postsubject);
				msg.setContent(postmsg,"text/html; charset=utf-8");
				
				Transport.send(msg);
			}catch(Exception e) {
				e.getMessage();
			}
			PrintWriter pw = response.getWriter();
			pw.write(prop.toString());
	}

}
