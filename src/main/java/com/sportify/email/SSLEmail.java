package com.sportify.email;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;

/*
 * 申請: Gmail 應用程式密碼
 * 1. 登錄你的 Google 帳戶。
 * 2. 前往 https://myaccount.google.com/security
 * 3. 點選"兩步驟驗證"
 * 4. 點選"應用程式密碼" <-- 網頁最下方
 * ps: 若看不到"應用程式密碼", 請點選下方網址
 * https://myaccount.google.com/apppasswords?pli=1&rapt=AEjHL4N4imft3Utjxqp0tmG-NW8zedKzQoKwtNqkPkUFd7BpnC6Se5HtNGnKDfzP3x5UpSPgyfjuEHAMNY27rVhsV0gOr33vN9s7IkYMr-EurprkV-L0mvE
 * 5. 這將生成一個應用程序專用密碼，複製此密碼。
 * */

public class SSLEmail {

	/**
	   Outgoing Mail (SMTP) Server
	   requires TLS or SSL: smtp.gmail.com (use authentication)
	   Use Authentication: Yes
	   Port for SSL: 465
	 */
	public static void sendEmail(String email , String newPassword) {
		final String fromEmail = "sarahyuyuyu@gmail.com"; //requires valid gmail id
		final String password = "rpde ztok xekf vtyr"; // 應用程式密碼
		final String toEmail = email; // can be any email id 
		
		System.out.println("SSLEmail Start");
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
		props.put("mail.smtp.socketFactory.port", "465"); //SSL Port
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory"); //SSL Factory Class
		props.put("mail.smtp.auth", "true"); //Enabling SMTP Authentication
		props.put("mail.smtp.port", "465"); //SMTP Port
		
	    Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };

        Session session = Session.getDefaultInstance(props, auth);

        try {
            // 創建一個新的郵件訊息
            EmailUtil.sendEmail(session, email, "Sportify忘記密碼", "親愛的會員您好！您的新密碼為：" + newPassword + "。請儘速更新您的密碼");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}