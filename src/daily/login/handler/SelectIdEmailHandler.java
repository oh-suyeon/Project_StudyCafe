package daily.login.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.common.handler.CommandHandler;
import daily.login.service.ISearchIdService;
import daily.login.service.SearchIdServiceImpl;
import daily.user.vo.UserVO;

public class SelectIdEmailHandler implements CommandHandler{

	private static final Logger LOGGER = Logger.getLogger(SelectIdEmailHandler.class);
	private static final String VIEW_PAGE = "/views/login/searchPw.jsp";
	private ISearchIdService searchIdService = SearchIdServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		if(req.getMethod().equals("GET")) {
			return VIEW_PAGE;
			
		}else if(req.getMethod().equals("POST")) {
			
			String userId = req.getParameter("userId");
			
			UserVO userVO = searchIdService.selectIdEmail(userId);
			
			
			String url ="";
			
			if(userVO == null) { //비밀번호 찾기 실패 경우
				
				url = "/views/login/resultPwFail.jsp";
				
			}else if(userVO != null) { //비밀번호 찾기 성공할 경우
				
				req.setAttribute("userVO", userVO);
				
				url = "/views/login/resultPwSuccess.jsp";
			}

			return url;
		}
		return null;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		return false;
	}

}
