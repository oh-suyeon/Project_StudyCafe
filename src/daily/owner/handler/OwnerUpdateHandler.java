package daily.owner.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import daily.owner.service.OwnerServiceImpl;
import daily.owner.service.IOwnerService;
import daily.owner.vo.OwnerCafeInfoVO;
import daily.common.handler.CommandHandler;

public class OwnerUpdateHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/views/owner/ownerUpdate.jsp";
	private static final String RESULT_PAGE = "/ownerManage.do";
	
	
	private IOwnerService ownerService = OwnerServiceImpl.getInstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String url= "";
		
		if(req.getMethod().equals("GET")) {
			
			String ownerId = req.getParameter("ownerId");
			
			OwnerCafeInfoVO ownerVO = ownerService.getOwner(ownerId);
			
			req.setAttribute("ownerVO", ownerVO);
			
			url = VIEW_PAGE;
			
		}else if(req.getMethod().equals("POST")){
			
			OwnerCafeInfoVO ownerVO = new OwnerCafeInfoVO();
			BeanUtils.populate(ownerVO, req.getParameterMap());
			
			String ownerHp1 = req.getParameter("ownerHp1");
			String ownerHp2 = req.getParameter("ownerHp2");
			String ownerHp3 = req.getParameter("ownerHp3");
			String ownerHp = ownerHp1 + ownerHp2 + ownerHp3;
			ownerVO.setOwnerHp(ownerHp);
			
			int cnt = ownerService.updateOwner(ownerVO);
			
			String msg = "";
			if(cnt > 0) {
				msg = "success";
			}else {
				msg = "fail";
			}
			
			url = req.getContextPath() + RESULT_PAGE + "?msg=" + msg;
		}
		
		
		return url;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			return false;
			
		}else if(req.getMethod().equals("POST")){
			return true;
		}
		return false;
	}

}
