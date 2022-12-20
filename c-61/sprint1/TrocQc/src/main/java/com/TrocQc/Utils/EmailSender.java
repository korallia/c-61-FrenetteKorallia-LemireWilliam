// Class EmailSender
// Auteur: Korallia Frenette<
// Équipe: William et Korallia 
// Cette classe perment d'envoyer un courriel

package com.TrocQc.Utils;



import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class EmailSender {

	private String from;
	private String username;
	private String password;
	private String smtpserver;
	private int smtpport;
	
	
	public EmailSender(String fromEmail) {
		// TODO Auto-generated constructor stub
		this.from = fromEmail;
		this.username = "69be6050a160fd";
		this.password  = "ff8ee57c74e60a";
		this.smtpserver = "smtp.mailtrap.io";
		this.smtpport = 2525;
	}

	
	public void sendemail(String to,String subject, String body ) {
		//<a href="https://www.tutorialspoint.com/java/java_sending_email.htm">JAVA -sendin emails</a>
		//Fourni un example de code pour envoyer un courriel, qui a été refactoré en une seule fonction
		
			
		try {
				Properties props = new Properties();
				props.put("mail.smtp.host", this.smtpserver); //SMTP Host
				//props.put("mail.smtp.socketFactory.port", this.smtpport); //SSL Port
				//props.put("mail.smtp.socketFactory.class",
				//		"javax.net.ssl.SSLSocketFactory"); //SSL Factory Class
				props.put("mail.smtp.auth", "true"); //Enabling SMTP Authentication
				props.put("mail.smtp.port", this.smtpport); //SMTP Port
				
				final String username = this.username;
				final String password = this.password;
				
				Authenticator auth = new Authenticator() {
					//override the getPasswordAuthentication method
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username, password);
					}
				};
				
				Session session = Session.getDefaultInstance(props, auth);
				MimeMessage msg = new MimeMessage(session);
			    msg.addHeader("Content-type", "text/plain; charset=UTF-8");
			    msg.addHeader("format", "flowed");
			    msg.addHeader("Content-Transfer-Encoding", "8bit");
			    msg.setFrom(new InternetAddress(this.from, "TrocQC"));
		        msg.setSubject(subject, "UTF-8");
		        msg.setText(body, "UTF-8");
		        msg.setSentDate(new Date());
		        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
			    Transport.send(msg);  
	
		    }
		    catch (Exception e) {
		      e.printStackTrace();
		    }

		        

		}
	}

