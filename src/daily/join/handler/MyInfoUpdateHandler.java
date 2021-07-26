package daily.join.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.beanutils.BeanUtils;

import daily.common.handler.CommandHandler;
import daily.join.service.IUserJoinService;
import daily.join.service.UserJoinServiceImpl;
import daily.user.vo.UserVO;

public class MyInfoUpdateHandler implements CommandHandler{
	
	private IUserJoinService userJoinService = UserJoinServiceImpl.getInstance();
	private static final String VIEW_PAGE = "/views/join/myInfoUpdate.jsp";
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")) {
		
			return VIEW_PAGE;
		}else if(req.getMethod().equalsIgnoreCase("POST")) {
		
		req.setCharacterEncoding("UTF-8");
		UserVO userVO = new UserVO();
		BeanUtils.populate(userVO, req.getParameterMap());
		
		String userHp1 = req.getParameter("userHp1");
		String userHp2 = req.getParameter("userHp2");
		String userHp3 = req.getParameter("userHp3");
		String userHp = userHp1 + userHp2 + userHp3;
		userVO.setUserHp(userHp);
		
		String userParentHp1 = req.getParameter("userParentHp1");
		String userParentHp2 = req.getParameter("userParentHp2");
		String userParentHp3 = req.getParameter("userParentHp3");
		String userParentHp = userParentHp1 + userParentHp2 + userParentHp3;
		userVO.setUserParentHp(userParentHp);
				
		int cnt = userJoinService.updateUser(userVO);
		
		req.setAttribute("resultCount", cnt);
		req.setAttribute("userVO", userVO);
		String url = "/views/join/updateResultCount.jsp";
		return url;
		}
		return null;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
//		if(req.getMethod().equalsIgnoreCase("GET")) {
//			return false; // forward
//		}else if(req.getMethod().equalsIgnoreCase("POST")) {
//			return true; // redirect
//		}
		return false;
	}

}
