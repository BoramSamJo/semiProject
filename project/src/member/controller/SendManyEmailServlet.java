package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

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
 * Servlet implementation class SendManyEmailServlet
 */
@WebServlet("/sendManyEmail.me")
public class SendManyEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendManyEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String host = "smtp.naver.com";
		String user = "potter3786@naver.com";
		String password="p8513589!@";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user, "(주)HYEYUM 반려상조서비스"));
			
			//이메일 다중으로 보내기 위해 배열로 받아옴
			String[] usersEmail = request.getParameterValues("usersEmail");
			System.out.println(Arrays.toString(usersEmail));
			
			//중복제거를 함
			HashMap<String, Integer> hm = new HashMap<String,Integer>();
			int value = 0;
			for(int j = 0; j < usersEmail.length; j++) {
					hm.put(usersEmail[j], value);
					value++;
			}
			
			//중복제거 된것을 다시 배열에 담고
			String[] emailArr = new String[hm.size()];
			Set set = hm.keySet();
			Iterator iter = set.iterator();
			while(iter.hasNext()) {
				for(int j = 0; j < hm.size(); j++) {
					String hKey = (String)iter.next();
					emailArr[j] = hKey;
				}
			}
			
			//이메일 주소 배열을 담는다
			InternetAddress[] addArray = new InternetAddress[emailArr.length]; 
			for(int k = 0; k < emailArr.length; k++) {
				addArray[k] = new InternetAddress(emailArr[k]); 
			}
			
			msg.addRecipients(Message.RecipientType.TO, addArray);
			
			msg.setSubject("안녕하세요 반려동물의 안식처 혜윰입니다. 고객님께 안내드립니다.");
			
			MimeMultipart multipart = new MimeMultipart("related");
			
			BodyPart messageBodyPart = new MimeBodyPart();
			
			//선택한 메일 양식에 따라 내용 바꾸기
			String mailContentForm = request.getParameter("sendMailText");
			//경과일은 처음 전체목록에있을때는 null이나 false이고(서치할때 생기니까) 그걸 처리
			String passDate = request.getParameter("passDate");
			System.out.println("passDate : " + passDate);
			if(passDate==null||passDate.equals("false")) {
				passDate="수";
			}
			
			if(mailContentForm.equals("insText")) {
				mailContentForm = "<div style=\"background-color: rgba(24, 24, 24, 0.7); border:5px solid #b3a193; border-radius: 10px; padding:20px; width: 700px; height: 500px; margin: auto;\">\r\n" + 
						"        <img src=\"cid:LOGO1\" width=\"120px\" height=\"55px\" align='left' style=\" display: inline-block;\">\r\n" + 
						"        <div style=\"margin-left: 0px; color:white; margin-top: 14px; display: inline-block;\">메일</div>\r\n" + 
						"\r\n" + 
						"        <div style=\"border-bottom: 1px solid #b3a193; padding-bottom: 15px; margin-top:30px; margin-bottom:20px; color:white\">안녕하세요! 혜윰입니다. 그간 잘 지내셨나요?</div>\r\n" + 
						"        \r\n" + 
						"        <div style=\"margin-top:25px; color:white\">고객님의 저희 상품에 가입하신지 "+passDate+"일이 지났습니다</div>\r\n" + 
						"        <div style=\"margin-top:10px; margin-bottom:25px; color:white\">혹시 궁금한 사항이 있거나 변경을 원하시는 등 문의사항이 있으면 아래의 번호로 연락 주세요</div>\r\n" + 
						"\r\n" + 
						"        <div style=\"border:1px solid #b3a193; border-radius: 5px; text-align: center;\">\r\n" + 
						"            <p style=\"border-radius: 3px; margin:auto; background-color: rgba(5, 5, 5, 0.5); width: 90%; padding-top: 15px; padding-bottom: 15px; color:#b3a193; margin-top: 40px; margin-bottom: 40px; font-weight: 550;\">보험상담번호 : 02-851-3589</p>\r\n" + 
						"        </div>\r\n" + 
						"        \r\n" + 
						"        <div style=\"margin-top: 40px; border-top: 1px solid #b3a193; font-size: 13px; color:#b3a193; text-align: center; line-height: 30px; padding: 20px;\">\r\n" + 
						"            혜윰  |  사업자등록번호 : 0123456789호  |  동물장묘업 등록번호  |  대표자 : 배혜린\r\n" + 
						"            <br>\r\n" + 
						"            Copyright © 2020-2020 hyeyum Institute All Right Reserved\r\n" + 
						"        </div>\r\n" + 
						"    </div>";
			}else if(mailContentForm.equals("fuText")) {
				mailContentForm = "<div style=\"background-color: rgba(24, 24, 24, 0.7); border:5px solid #b3a193; border-radius: 10px; padding:20px; width: 700px; height: 500px; margin: auto;\">\r\n" + 
						"        <img src=\"cid:LOGO1\" width=\"120px\" height=\"55px\" align='left' style=\" display: inline-block;\">\r\n" + 
						"        <div style=\"margin-left: 0px; color:white; margin-top: 14px; display: inline-block;\">메일</div>\r\n" + 
						"\r\n" + 
						"        <div style=\"border-bottom: 1px solid #b3a193; padding-bottom: 15px; margin-top:30px; margin-bottom:20px; color:white\">안녕하세요! 혜윰입니다.</div>\r\n" + 
						"        \r\n" + 
						"        <div style=\"margin-top:25px; color:white\">고객님을 찾아뵌지 "+passDate+"일이 지났는데, 잘지내시는지 걱정이 됩니다</div>\r\n" + 
						"        <div style=\"margin-top:10px; color:white\">혹시 필요하시다면 전문가와의 심리상담을 받아보세요</div>\r\n" + 
						"        <div style=\"margin-top:10px; margin-bottom:25px; color:white\">회원님들을 대상으로 무료로 제공하니 언제든 부담없이 아래의 번호로 연락주세요</div>\r\n" + 
						"\r\n" + 
						"        <div style=\"border:1px solid #b3a193; border-radius: 5px; text-align: center;\">\r\n" + 
						"            <p style=\"border-radius: 3px; margin:auto; background-color: rgba(5, 5, 5, 0.5); width: 90%; padding-top: 15px; padding-bottom: 15px; color:#b3a193; margin-top: 40px; margin-bottom: 40px; font-weight: 550;\">상담신청번호 : 02-851-3589</p>\r\n" + 
						"        </div>\r\n" + 
						"        \r\n" + 
						"        <div style=\"margin-top: 40px; border-top: 1px solid #b3a193; font-size: 13px; color:#b3a193; text-align: center; line-height: 30px; padding: 20px;\">\r\n" + 
						"            혜윰  |  사업자등록번호 : 0123456789호  |  동물장묘업 등록번호  |  대표자 : 배혜린\r\n" + 
						"            <br>\r\n" + 
						"            Copyright © 2020-2020 hyeyum Institute All Right Reserved\r\n" + 
						"        </div>\r\n" + 
						"    </div>";
			}else {
				String directContent = mailContentForm;
				mailContentForm = "<div style=\"background-color: rgba(24, 24, 24, 0.7); border:5px solid #b3a193; border-radius: 10px; padding:20px; width: 700px; height: 400px; margin: auto;\">\r\n" + 
						"        <img src=\"cid:LOGO1\" width=\"120px\" height=\"55px\" align='left' style=\" display: inline-block;\">\r\n" + 
						"        <div style=\"margin-left: 0px; color:white; margin-top: 14px; display: inline-block;\">메일</div>\r\n" + 
						"\r\n" + 
						"        <div style=\"border-bottom: 1px solid #b3a193; padding-bottom: 15px; margin-top:30px; margin-bottom:20px; color:white\">안녕하세요! 혜윰입니다.</div>\r\n" + 
						"        \r\n" + 
						"        <div style=\"margin-top:10px; margin-bottom:25px; color:white\">"+directContent+"</div>\r\n" + 
						"        \r\n" + 
						"        <div style=\"margin-top: 40px; border-top: 1px solid #b3a193; font-size: 13px; color:#b3a193; text-align: center; line-height: 30px; padding: 20px;\">\r\n" + 
						"            혜윰  |  사업자등록번호 : 0123456789호  |  동물장묘업 등록번호  |  대표자 : 배혜린\r\n" + 
						"            <br>\r\n" + 
						"            Copyright © 2020-2020 hyeyum Institute All Right Reserved\r\n" + 
						"        </div>\r\n" + 
						"    </div>";
			}
			
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
		out.print("메일발송이 완료되었습니다");
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
