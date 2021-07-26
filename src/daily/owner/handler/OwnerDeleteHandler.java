package daily.owner.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.owner.service.OwnerServiceImpl;
import daily.owner.service.IOwnerService;
import daily.common.handler.CommandHandler;

public class OwnerDeleteHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/ownerManage.do";
	
	private IOwnerService ownerService = OwnerServiceImpl.getInstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String ownerId = req.getParameter("ownerId");
		
		int cnt = ownerService.deleteOwner(ownerId);
		
		String msg = "";
		if(cnt > 0) {
			msg = "success";
		}else {
			msg = "fail";
		}
		
		req.setAttribute("msg", msg);
		
		return req.getContextPath() + VIEW_PAGE + "?msg=" + msg;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}
	
	

}
