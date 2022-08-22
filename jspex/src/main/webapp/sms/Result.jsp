<%@page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.security.*" %>
<%!
		public class CEncrypt
		{
				MessageDigest md;
				String strSRCData = "";
				String strENCData = "";

				public CEncrypt(){}

				public CEncrypt(String EncMthd, String strData)
				{
						this.encrypt(EncMthd, strData);
				}


				public void encrypt(String EncMthd, String strData)
			 {
					 try
					{
							MessageDigest md = MessageDigest.getInstance(EncMthd); // "MD5" or "SHA1"
						 byte[] bytData = strData.getBytes();
						 md.update(bytData);

						 byte[] digest = md.digest();
						 for(int i =0;i<digest.length;i++)
						 {
								 strENCData = strENCData + String.format("%02x",digest[i] & 0xFF).toLowerCase();
						 }
					 }catch(NoSuchAlgorithmException e)
					{
						 System.out.print("암호화 알고리즘이 없습니다.");
					};


					strSRCData = strData;
				}


				public String getEncryptData(){return strENCData;}
				public String getSourceData(){return strSRCData;}


				public boolean equal(String strData)
				{

					if(strData == strENCData) return true;
					return false;
				}
		}    //CEncrypt

%>
<HTML>
<HEAD>
<TITLE>Result</TITLE>
</HEAD>
<BODY>
<H1>Result</H1>

<jsp:useBean id="smsid" scope="session" class="test.ServiceSMSSoapProxy" />
<%
	if (request.getParameter("endpoint") != null && request.getParameter("endpoint").length() > 0)
		smsid.setEndpoint(request.getParameter("endpoint"));
%>

<%
	String method = request.getParameter("method");
	String smsID = "";
	String hashValue = "";
	String hash_temp = "";
	String senderPhone = "";
	String receivePhone ="";
	String smsContent = "";
	String resultReturn = "";
	String reserveDate ="";
	String reserveTime = "";
	String userDefine = "";
	String callbackUrl = "";
	String searchValue = "";
	String mode = "";
	CEncrypt encrypt;

	int methodID = 0;
	if (method == null) methodID = -1;

	if(methodID != -1) methodID = Integer.parseInt(method);
	boolean gotMethod = false;

	try {
		switch (methodID){
		case 2:							//즉시보내기 사용예제
			gotMethod = true;
			smsID=  request.getParameter("smsID");
			hashValue = request.getParameter("hashValue");
			senderPhone =  request.getParameter("senderPhone");
			receivePhone =  request.getParameter("receivePhone");
			smsContent =  request.getParameter("smsContent");
			hash_temp = (smsID + hashValue + receivePhone); //아이디, 패스워드,수신번호를 hash화시킴

			encrypt = new CEncrypt("MD5", hash_temp);
			String sendSMS = smsid.sendSMS(smsID, encrypt.getEncryptData(), senderPhone, receivePhone, smsContent);

			out.println("결과코드 : " + sendSMS);	
	
			break;

		case 15:			//예약문자전송시 사용예제
			gotMethod = true;
			smsID =  request.getParameter("smsID");
			hashValue = request.getParameter("hashValue");
			senderPhone =  request.getParameter("senderPhone");
			receivePhone =  request.getParameter("receivePhone");
			smsContent = request.getParameter("smsContent");
			reserveDate =  request.getParameter("reserveDate");
			reserveTime =  request.getParameter("reserveTime");
			userDefine =  request.getParameter("userDefine");
			hash_temp = (smsID + hashValue + receivePhone); //아이디, 패스워드,수신번호를 hash화시킴

			encrypt = new CEncrypt("MD5", hash_temp);
			String sendSMSReserve = smsid.sendSMSReserve(smsID, encrypt.getEncryptData(), senderPhone, receivePhone, smsContent, reserveDate, reserveTime, userDefine);

			out.println("결과코드 : " + sendSMSReserve);

			break;

		case 70:								//SMS예약 취소시 사용됨
			gotMethod = true;
			smsID =  request.getParameter("smsID");
			hashValue =  request.getParameter("hashValue");
			userDefine =  request.getParameter("userDefine");
			mode = request.getParameter("mode");
			hash_temp = (smsID + hashValue + userDefine); //아이디, 패스워드,사용자정의값을 hash화시킴
			encrypt = new CEncrypt("MD5", hash_temp);
			int reserveCancle = smsid.reserveCancle(smsID, encrypt.getEncryptData(), userDefine, mode);
			out.println("결과값 : " + reserveCancle);
			break;

		case 81:								//SMS잔여개수 확인시 사용
			gotMethod = true;
			smsID =  request.getParameter("smsID");
			hashValue =  request.getParameter("hashValue");
			encrypt = new CEncrypt("MD5", smsID + hashValue);
			int getRemainCount = smsid.getRemainCount(smsID, encrypt.getEncryptData());
			out.println("잔여량 : " + getRemainCount);
			break;

		case 87:								//SMS잔여개수 확인시 사용
			gotMethod = true;
			smsID =  request.getParameter("smsID");
			hashValue =  request.getParameter("hashValue");
			encrypt = new CEncrypt("MD5", smsID + hashValue);
			String getRemainDay = smsid.getRemainDay(smsID, encrypt.getEncryptData());
			
			if (getRemainDay.charAt(0) == '-'){
				out.println("오류코드 : " + getRemainDay);
			}
			else if (getRemainDay.charAt(0) == '0'){
				out.println("만료 될 건이 없습니다.");
			}
			else{
				String[] res = getRemainDay.split("\\|");
				out.println(res[0] +"일 후 " + res[1] +"건이 만료됩니다." );
			}
			break;
	}
} catch (Exception e) {
%>
	Exception: <%= e %>
<%
	return;
}
if(!gotMethod){
%>
	Result: N/A
<%
}
%>
</BODY>
</HTML>