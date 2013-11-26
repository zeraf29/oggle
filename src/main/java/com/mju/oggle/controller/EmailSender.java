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



public class EmailSender implements Runnable{

//	private final String url="http://211.189.127.145:8080/Oggle";
	private final String url="http://localhost:8080/Oggle";
	
	private String to;
	private String nonce;
	
	public EmailSender() {
	}
	
	public void setParameter(String to, String nonce){
		this.to = to;
		this.nonce = nonce;
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
			msg.setSubject("Oggle에서 email 인증을 희망합니다. ");

			Address fromAddr = new InternetAddress("oggleManager@gmail.com"); // 보내는 사람의 메일주소
			msg.setFrom(fromAddr);

			Address toAddr = new InternetAddress(to);  // 받는 사람의 메일주소
			msg.addRecipient(Message.RecipientType.TO, toAddr); 

			String message = "\n\n고객님의 회원가입을 감사드립니다.\n\n";
			message+="다음 링크를 클릭하셔서 회원 인증을 하시면  Oggle서비스를 이용하실 수 있습니다.\n"; 
			message+=url+"/main.do?email="+to+"&nonce="+nonce;
			message+="\n\nOggle 팀 일동";
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
	@Override
	public void run() {
		// TODO Auto-generated method stub
		sendEmail(to,nonce);
	}
}


