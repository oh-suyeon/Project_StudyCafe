package daily.join.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import daily.common.handler.CommandHandler;

import daily.join.dao.IUserJoinDao;
import daily.join.dao.UserJoinDaoImpl;
import daily.join.service.IUserJoinService;
import daily.join.service.UserJoinServiceImpl;
import daily.user.vo.UserVO;

public class UserJoinHandler implements CommandHandler{

	private static final Logger LOGGER = Logger.getLogger(UserJoinHandler.class);
	private static final String VIEW_PAGE = "/views/join/userJoin.jsp";
	private IUserJoinService userJoinService = UserJoinServiceImpl.getInstance();
	private IUserJoinDao userJoinDao = UserJoinDaoImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("GET")) {
			return VIEW_PAGE;
			
		}else {
			
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
				
		int cnt = userJoinService.insertUser(userVO);
		
		req.setAttribute("resultCount", cnt);
		
		String url = "/views/join/resultCount.jsp";
		return url;
		}
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		return false;
	}

}
