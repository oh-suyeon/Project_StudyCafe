package daily.join.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.common.handler.CommandHandler;

import daily.join.service.IUserJoinService;
import daily.join.service.UserJoinServiceImpl;
import daily.user.vo.UserVO;

public class UserCheckHandler implements CommandHandler{

	private static final Logger LOGGER = Logger.getLogger(UserCheckHandler.class);
	//private static final String VIEW_PAGE = "/views/join/userJoin.jsp";
	private IUserJoinService userJoinService = UserJoinServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		String userId = req.getParameter("userId");
		UserVO userVO = userJoinService.checkUser(userId);
		
		req.setAttribute("userVO", userVO);
		
		String url = "/views/join/userCheck.jsp";
		
		return url;
		}


	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		return false;
	}

}
