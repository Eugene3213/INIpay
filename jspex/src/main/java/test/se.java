package test;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class se extends Authenticator {

	protected PasswordAuthentication getPasswordAuthentication() {
		String eid = "parkyj3213@naver.com";
		String epw="177185Pc!!";
		return new PasswordAuthentication(eid,epw);
	}
	
}
