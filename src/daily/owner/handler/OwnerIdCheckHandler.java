package daily.owner.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.owner.service.OwnerServiceImpl;
import daily.owner.service.IOwnerService;
import daily.owner.vo.OwnerCafeInfoVO;
import daily.common.handler.CommandHandler;
import daily.join.handler.UserCheckHandler;

public class OwnerIdCheckHandler implements CommandHandler{


	private static final Logger LOGGER = Logger.getLogger(UserCheckHandler.class);
	private static final String VIEW_PAGE = "/views/owner/ownerCreate.jsp";
	private IOwnerService ownerService = OwnerServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			return VIEW_PAGE;
			
		}else {
			
		String ownerId = req.getParameter("ownerId");
		OwnerCafeInfoVO ownerVO = ownerService.ownerIdCheck(ownerId);
		
		req.setAttribute("ownerVO", ownerVO);
		
		String url = "/views/owner/ownerCheck.jsp";
		
		return url;
		}
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return false;
	}

}
