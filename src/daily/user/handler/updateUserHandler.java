package daily.user.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.common.handler.CommandHandler;
import daily.notice.handler.InsertNoticeHandler;
import daily.user.service.IUserService;
import daily.user.service.UserServiceImpl;
import daily.user.vo.UserVO;

public class updateUserHandler implements CommandHandler{
	
	
	private static final String VIEW_PAGE = "/views/user/userUpdate.jsp";
	private static final Logger LOGGER = Logger.getLogger(InsertNoticeHandler.class);
	private IUserService userService = UserServiceImpl.getInstance();

	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
if(req.getMethod().equalsIgnoreCase("GET")) {
			
			String userId = req.getParameter("userId");
			// 2. 회원정보 조회
			UserVO userVO = userService.getUser(userId);
			
			
			
			
			
			// 3. request객체에 회원정보 저장
			req.setAttribute("userVO", userVO);
			return VIEW_PAGE;
			
		}else if(req.getMethod().equalsIgnoreCase("POST")) {
			
			// 1.요청 파라미터정보 가져오기
			
			String userId = req.getParameter("userId");
			UserVO uv = new UserVO();
			uv.setUserId(userId);
			
			
			
			
			// 3. 회원정보 수정하기
			int cnt = userService.updateUser(uv);
			
			String msg = "";
			if( cnt > 0) {
				msg = "성공";
			}else {
				msg = "실패";
			}
			
			String redirecURL = req.getContextPath() 
					+ "/userList.do?msg=" + URLEncoder.encode(msg, "utf-8");
			return redirecURL;
		}
		return null;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equalsIgnoreCase("GET")) {
			return false; // forward
		}else if(req.getMethod().equalsIgnoreCase("POST")) {
			return true; // redirect
		}
		return false;
	}
}
