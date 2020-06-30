package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.Random;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmailCheckServlet
 */
@WebServlet("/checkEmail.me")
public class EmailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		
		String host = "smtp.naver.com";
		String user = "potter3786@naver.com";
		String password="8513589!@";
		
		String to_email = email;
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for(int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch(rIndex) {
			case 0 : 
				temp.append((char)((int)(rnd.nextInt(26))+97));
				break;
			case 1 :
				temp.append((char)((int) (rnd.nextInt(26))+65));
				break;
			case 2 :
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		
		String authenticationKey = temp.toString();
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "(주)HYEYUM 반려상조서비스"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
			
			msg.setSubject("안녕하세요 혜윰 인증 메일입니다.");
			
			MimeMultipart multipart = new MimeMultipart("related");
			
			BodyPart messageBodyPart = new MimeBodyPart();
			
			String mailContentForm = "<div style=\"background-color: rgba(24, 24, 24, 0.7); border:5px solid #b3a193; border-radius: 10px; padding:20px; width: 700px; height: 500px; margin: auto;\">\r\n" + 
					"        <img alt=\"이미지뜸?\" src=\"cid:LOGO1\" width=\"120px\" height=\"55px\" align='left' style=\" display: inline-block;\">\r\n" + 
					"        <div style=\"font-size:18px; margin-left: 0px; color:white; margin-top: 14px; display: inline-block;\"><strong>메일</strong></div>\r\n" + 
					"        \r\n" + 
					"        <div style=\"border-bottom: 1px solid #b3a193; padding-bottom: 15px; margin-top:30px; margin-bottom:20px; color:white\">안녕하세요! 혜윰입니다.</div>\r\n" + 
					"        \r\n" + 
					"        <div style=\"margin-top:25px; color:white\">고객님께 인증번호가 도착했습니다</div>\r\n" + 
					"        <div style=\"margin-top:10px; margin-bottom:25px; color:white\">아래 인증번호를 잘 입력해주세요.</div>\r\n" + 
					"\r\n" + 
					"        <div style=\"border:1px solid #b3a193; border-radius: 5px; text-align: center;\">\r\n" + 
					"            <p style=\"border-radius: 3px; margin:auto; background-color: rgba(5, 5, 5, 0.5); width: 90%; padding-top: 15px; padding-bottom: 15px; color:#b3a193; margin-top: 40px; margin-bottom: 40px; font-weight: 550;\">인증번호 : "+temp+"</p>\r\n" + 
					"        </div>\r\n" + 
					"        \r\n" + 
					"        <div style=\"margin-top: 40px; border-top: 1px solid #b3a193; font-size: 13px; color:#b3a193; text-align: center; line-height: 30px; padding: 20px;\">\r\n" + 
					"            혜윰  |  사업자등록번호 : 0123456789호  |  동물장묘업 등록번호  |  대표자 : 배혜린\r\n" + 
					"            <br>\r\n" + 
					"            Copyright © 2020-2020 hyeyum Institute All Right Reserved\r\n" + 
					"        </div>\r\n" + 
					"    </div>";
			
			messageBodyPart.setContent(mailContentForm, "text/html;charset=UTF-8");
			
			multipart.addBodyPart(messageBodyPart);
			
			messageBodyPart = new MimeBodyPart();
			DataSource fds = new FileDataSource("C:\\semiProject\\project\\web\\LOGO\\LOGO1.png");
			messageBodyPart.setDataHandler(new DataHandler(fds));
			messageBodyPart.setHeader("Content-ID", "LOGO1");
			
			multipart.addBodyPart(messageBodyPart);
			
			msg.setContent(multipart);
			
			Transport.send(msg);
			System.out.println("이메일 전송됨");
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			
			PrintWriter out = response.getWriter();
			out.print(1);
			out.flush();
			out.close();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		PrintWriter out = response.getWriter();
		out.print(temp.toString());
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
