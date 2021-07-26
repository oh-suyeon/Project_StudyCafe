package daily.login.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import daily.admin.vo.AdminVO;
import daily.common.handler.CommandHandler;
import daily.common.vo.CommonVO;
import daily.login.service.ILoginService;
import daily.login.service.loginServiceImpl;
import daily.owner.vo.OwnerVO;
import daily.user.vo.UserVO;
import daily.util.SHA256Util;

public class LoginHandler implements CommandHandler {

	private static final Logger LOGGER = Logger.getLogger(LoginHandler.class);
	private static final String VIEW_PAGE = "/views/login/login.jsp";
	private static final String SUCCESS_PAGE = "/views/main/main.jsp";
	private static final String FAIL_PAGE = "/views/login/loginFail.jsp";
	//로그인할 때 성공하면 메인.do로 보내고 실패하면 login.do로 보냄 (알러트만 추가해줌 ~님 환영합니다/ 로그인에 실패하였습니다)
	private ILoginService loginService = loginServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		UserVO userVO = null;
		AdminVO adminVO = null;
		OwnerVO ownerVO = null;
		
		if(req.getMethod().equals("GET")) {
			return VIEW_PAGE;
			
		}else {
		
		String commonId = req.getParameter("commonId");
		String commonPw = req.getParameter("commonPw");
		String gubunCode = req.getParameter("gubunCode");
		
		CommonVO commonVO = new CommonVO();
		commonVO.setCommonId(commonId);

		if(gubunCode.equals("code1")) { //회원
			
			//사용자가 입력한 비밀번호 암호화 해주기
			String newUserPw = SHA256Util.getEncrypt(commonPw, commonId);

			commonVO.setCommonPw(newUserPw);
			userVO = loginService.loginUser(commonVO);
			
		}else if(gubunCode.equals("code2")) { //관리자 or 지점주
			
			commonVO.setCommonPw(commonPw);
			
			if(commonId.indexOf("admin") == 0) { //관리자
				//관리자
				adminVO = loginService.loginAdmin(commonVO);
				//관리자 비밀번호 암호화 아직..


				
			}else if(commonId.indexOf("owner") == 0) { //지점주
				//지점주
				ownerVO = loginService.loginOwner(commonVO);
				//지점주 비밀번호 암호화 미정..

				
			}
		}
		
		
		String url = "";
		String loginId = "";
		String loginName = "";
		String loginType = "";
		
		if(userVO != null || adminVO != null || ownerVO != null) {
			HttpSession session = req.getSession(true); //세션 생성
			
			if(userVO != null) {
				session.setAttribute("userVO", userVO);
				loginId = userVO.getUserId();
				loginName = userVO.getUserName();
				loginType = "user";
				
			}else if(adminVO != null) {
				session.setAttribute("adminVO", adminVO);
				loginId = adminVO.getAdminId();
				loginName = adminVO.getAdminName();
				loginType = "admin";
				
			}else if(ownerVO != null) {
				session.setAttribute("ownerVO", ownerVO);
				loginId = ownerVO.getOwnerId(); 
				loginName = ownerVO.getOwnerName();
				loginType = "owner";
			}

			session.setAttribute("loginId", loginId);
			session.setAttribute("loginName", loginName);
			session.setAttribute("loginType", loginType);
			
			url = SUCCESS_PAGE;
			System.out.println("urlSuccess : " + url);
			
		}else {
			url = FAIL_PAGE;
			System.out.println("urlFail : " + url);
		}
			

		return url;
		}
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return false;
		} else if(req.getMethod().equalsIgnoreCase("post")) {
			return true;
		}
		return false;
	}

}
