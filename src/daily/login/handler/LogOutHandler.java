package daily.login.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daily.common.handler.CommandHandler;

public class LogOutHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/views/main/main.jsp";
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession(true);
		
		String visitFlag = "FALSE"; //방문 이력 없음
		session.setAttribute("VISITFLAG", visitFlag);
		
		session.invalidate();
		
		String redirectUrl = req.getContextPath() + "/views/main/main.jsp";
		return redirectUrl;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}

}
