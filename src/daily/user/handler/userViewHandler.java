package daily.user.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.user.service.IUserService;
import daily.user.service.UserServiceImpl;
import daily.user.vo.UserVO;

public class userViewHandler implements CommandHandler{
	
private static final String VIEW_PAGE="/views/user/userSelect.jsp";
	
	private IUserService userService = UserServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userId = req.getParameter("userId");
		
		
		//1. 회원정보 조회
		UserVO userVO = userService.getUserid(userId);
		boolean chk	= userService.checkBlacklist(userId); 
		

		
			
		
		// 3. 결과 정보 담기
		req.setAttribute("userVO", userVO);
		req.setAttribute("chk", chk);
		
		return VIEW_PAGE;	
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return false;
	}

}
