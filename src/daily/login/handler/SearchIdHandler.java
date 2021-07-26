package daily.login.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.common.handler.CommandHandler;
import daily.join.handler.UserCheckHandler;
import daily.join.service.IUserJoinService;
import daily.join.service.UserJoinServiceImpl;
import daily.login.service.ILoginService;
import daily.login.service.ISearchIdService;
import daily.login.service.SearchIdServiceImpl;
import daily.login.service.loginServiceImpl;
import daily.user.vo.UserVO;

public class SearchIdHandler implements CommandHandler{

	private static final Logger LOGGER = Logger.getLogger(SearchIdHandler.class);
	private static final String VIEW_PAGE = "/views/login/searchId.jsp";
	private ISearchIdService searchIdService = SearchIdServiceImpl.getInstance(); 
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			return VIEW_PAGE;
		}else if(req.getMethod().equals("POST")) {
		
		String userName = req.getParameter("userName");
		String userEmail = req.getParameter("userEmail");
		UserVO userVO = new UserVO();
		userVO.setUserName(userName);
		userVO.setUserEmail(userEmail);
		List<UserVO> userList = searchIdService.searchId(userVO);
		
		req.setAttribute("userList", userList);
		
		String url = "/views/login/resultId.jsp";
		return url;
		}
		
		return null;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

}
