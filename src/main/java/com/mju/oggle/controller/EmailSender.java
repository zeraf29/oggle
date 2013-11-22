package com.mju.oggle.controller;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class EmailSender {

	private final String url="http://211.189.127.145:8080/Oggle";
	public EmailSender() {
		
	}
	
	public void sendEmail(String to, String nonce) {
		Properties p = new Properties();
		p.put("mail.smtp.user", "pooingx2@gmail.com");
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "25");
		p.put("mail.smtp.starttls.enable","true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");

		try {
			Authenticator auth = new SMTPAuthenticator();
			
			Session session = Session.getInstance(p, auth);
			session.setDebug(true);
			
			MimeMessage msg = new MimeMessage(session);
			msg.setSubject("Oggle 시작하기(인증)");

			Address fromAddr = new InternetAddress("oggleManager@gmail.com"); // 보내는 사람의 메일주소
			msg.setFrom(fromAddr);

			Address toAddr = new InternetAddress(to);  // 받는 사람의 메일주소
			msg.addRecipient(Message.RecipientType.TO, toAddr); 

			String message = "Oggle email 인증을 위해 아래 링크를 클릭하세요\n";
			message+=url+"/main.do?"+nonce+"=nonce";
			msg.setContent(message, "text/plain;charset=KSC5601");

			Transport.send(msg);
		}
		catch (Exception mex) {
			mex.printStackTrace(); 
		}
		
		System.out.println("send success!");
	}
	private static class SMTPAuthenticator extends javax.mail.Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication("oggleManager@gmail.com", "ogglemju"); // paran.com id, pwd
		}
	} 
}


