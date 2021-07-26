package daily.owner.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.owner.service.OwnerServiceImpl;
import daily.owner.service.IOwnerService;
import daily.owner.vo.OwnerCafeInfoVO;
import daily.common.handler.CommandHandler;

public class OwnerGetHandler implements CommandHandler{
	
	public static final String VIEW_PAGE = "/views/owner/ownerGet.jsp";
	private IOwnerService ownerService = OwnerServiceImpl.getInstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String ownerId = req.getParameter("ownerId");
		
		OwnerCafeInfoVO ownerVO = ownerService.getOwner(ownerId);
		
		req.setAttribute("ownerVO", ownerVO);
		
		return VIEW_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

}
