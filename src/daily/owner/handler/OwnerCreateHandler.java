package daily.owner.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import daily.owner.dao.OwnerDaoImpl;
import daily.owner.dao.IOwnerDao;
import daily.owner.service.OwnerServiceImpl;
import daily.owner.service.IOwnerService;
import daily.owner.vo.OwnerCafeInfoVO;
import daily.common.handler.CommandHandler;

public class OwnerCreateHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/views/owner/ownerCreate.jsp"; 
	private IOwnerService ownerService = OwnerServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if("GET".equals(req.getMethod())) {
			return VIEW_PAGE;
			
		}else {
			
		req.setCharacterEncoding("UTF-8");
		OwnerCafeInfoVO ownerVO = new OwnerCafeInfoVO();
		BeanUtils.populate(ownerVO, req.getParameterMap());
		
		String ownerHp1 = req.getParameter("ownerHp1");
		String ownerHp2 = req.getParameter("ownerHp2");
		String ownerHp3 = req.getParameter("ownerHp3");
		String ownerHp = ownerHp1 + ownerHp2 + ownerHp3;
		ownerVO.setOwnerHp(ownerHp);
				
		int cnt = ownerService.createOwner(ownerVO);
		
		req.setAttribute("resultCount", cnt);
		
		String url = "/views/owner/resultCount.jsp";
		return url;
		}
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

}
