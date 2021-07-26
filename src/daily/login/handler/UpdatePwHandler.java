package daily.login.handler;

import java.net.URLEncoder;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.common.handler.CommandHandler;
import daily.login.service.ISearchIdService;
import daily.login.service.SearchIdServiceImpl;
import daily.user.vo.UserVO;

public class UpdatePwHandler implements CommandHandler {

	private static final Logger LOGGER = Logger.getLogger(UpdatePwHandler.class);
	//private static final String VIEW_PAGE = "/views/login/searchPw.jsp";
	private ISearchIdService searchIdService = SearchIdServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String userId = req.getParameter("userId");
		String userEmail = req.getParameter("userEmail");
		
		// 임시 비밀번호 생성
		String tmpPw  = "";
		for (int i = 0; i < 12; i++) {
			tmpPw += (char) ((Math.random() * 26) + 97);
		}
		
		UserVO userVO = new UserVO();
		userVO.setUserId(userId);
		userVO.setUserPw(tmpPw);
		
		//일단은 암호화하지 말고 저장해보기
		
		int cnt = searchIdService.updatePw(userVO);
		
		String msg = "";
		if(cnt > 0) {
			//비밀번호 변경 성공
			//이메일 전송
			naverMailSend(userEmail, tmpPw);
			msg = "성공";
		}else {
			msg = "실패";
		}
		String redirectURL = req.getContextPath() + "/login.do?msg=" + URLEncoder.encode(msg, "utf-8");
		return redirectURL;

	}
	
	

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}
	
	
	public static void naverMailSend(String userEmail, String tmpPw) {
		String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정
		String user = "rkdwltn5@naver.com";
		String password = "ASDFasdf1!"; // 패스워드
		
		// SMTP 서버 정보를 설정한다.

		Properties props = new Properties();
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", 587); 
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail)); 
			message.setSubject("Daily 스터디 카페 임시 비밀번호 입니다."); // 메일 제목
			message.setText("임시 비밀번호는 " + tmpPw + "입니다. 보안을 위해 로그인 후, 즉시 비밀번호를 변경해주세요."); // 메일 내용
			
			// send the message
			Transport.send(message);
			System.out.println("Success Message Send");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	

}
