package mail;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
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
import javax.servlet.http.HttpSession;


@WebServlet("/mail.do")
public class Mail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Mail() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Logger.getLogger("javax.mail").setLevel(Level.OFF);
		
		String cstmrEmail = request.getParameter("cstmrEmail");
		
		String host = "smtp.gmail.com";
		String user = "TasteMapAd@gmail.com";
		String password = "upfhjjicqtkqnjkk";

		String to_mail = cstmrEmail;
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) { // 인증번호 랜덤 생성
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
			String AuthenticationKey = temp.toString();

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});
			
			session.setDebug(false);
			
			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_mail));
				
				msg.setSubject("인증메일임");
				msg.setText("인증번호 : " + temp);
				
				Transport.send(msg);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
//			HttpSession key = request.getSession();
//			key.setAttribute("key", AuthenticationKey);
			
			PrintWriter out = response.getWriter();
			out.print(AuthenticationKey);
			out.flush();
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
