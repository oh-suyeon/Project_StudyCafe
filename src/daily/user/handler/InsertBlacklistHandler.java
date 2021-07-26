package daily.user.handler;

import java.net.URLEncoder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.user.service.IUserService;
import daily.user.service.UserServiceImpl;
import daily.user.vo.BlacklistVO;

public class InsertBlacklistHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/views/user/userSelect.jsp";
	private IUserService userService = UserServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			return VIEW_PAGE;
		}else if(req.getMethod().equals("POST")) {

			// 1.요청 파라미터정보 가져오기
			
			 String blacklistId =req.getParameter("userId1");
			 String cafeNo =req.getParameter("cafeNo");
			 String userId =req.getParameter("userId2");
			 String blacklistReason =req.getParameter("blacklistReason");
			 String blacklistDeleteYn = req.getParameter("blacklistDeleteYn");
			
			
			BlacklistVO bv = new BlacklistVO();
			bv.setBlacklistId(blacklistId);
			bv.setCafeNo(cafeNo);
			bv.setUserId(userId);
			bv.setBlacklistReason(blacklistReason);
			bv.setBlacklistDeleteYn(blacklistDeleteYn);
			
			
			
			// 3. 회원등록
			int cnt = userService.insertBlacklist(bv);
			
			String msg = "";
			if(cnt > 0) {
				msg = "성공";
			}else {
				msg = "실패";
			}
			
	
			String redirectURL = req.getContextPath() 
					+ "/userList.do?msg=" + URLEncoder.encode(msg, "utf-8");
			return redirectURL;
				
		}
		
		return null;
	}
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			return false; // forward
		}else if(req.getMethod().equals("POST")) {
			return true; // redirect
		}
		return false;
	}

}
