package kr.co.doogle.api.data;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class AlarmMailSend {
	
		   private static AlarmMailSend instance = new AlarmMailSend();
		   private AlarmMailSend(){}
		   public static AlarmMailSend getInstance()
		   {
		     return instance;
		   }
		public int setEmail(String email, String subject, String body) throws Exception 
		{
		     String host = "smtp.naver.com"; 
		     final String username = "mgk1058"; // 송신자 네이버 아이디
		     final String password = "toTkrdl*1"; // 송신자 네이버 비밀번호  
		     int port=465;
		     int state=0;

		     String recipient = email; // 받는 사람 이메일 주소

		     Properties props = System.getProperties();

		     try {
		     props.put("mail.smtp.host", host);
		     props.put("mail.smtp.port", port);
		     props.put("mail.smtp.auth", "true");
		     props.put("mail.smtp.ssl.enable", "true");
		     props.put("mail.smtp.ssl.trust", host);

		     Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		         String un=username;
		         String pw=password;
		         protected PasswordAuthentication getPasswordAuthentication() {
		             return new PasswordAuthentication(un, pw);
		         }
		     });
		     session.setDebug(true); //for debug

		     Message mimeMessage = new MimeMessage(session);
		     mimeMessage.setFrom(new InternetAddress("mgk1058@naver.com")); // 송신자 네이버 주소
		     mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		     mimeMessage.setSubject(subject);
		     mimeMessage.setText(body);
		     Transport.send(mimeMessage);
		     state=1;
		     }catch(Exception e){
		      state=0;
		     }
		     return state;
		   }
	}

