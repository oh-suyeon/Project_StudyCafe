package daily.cafe.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.cafe.service.CafeServiceImpl;
import daily.cafe.service.ICafeService;
import daily.common.handler.CommandHandler;
import daily.owner.service.IOwnerService;
import daily.owner.service.OwnerServiceImpl;
import daily.owner.vo.OwnerVO;

public class CafeOwnerListHandler implements CommandHandler{
	
	private static final String OWNER_RESULT = "/views/cafe/cafeOwnerResult.jsp";
	
	private ICafeService cafeService = CafeServiceImpl.getinstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		List<OwnerVO> ownerList = cafeService.retreieveOwnerList();
		
		req.setAttribute("ownerList", ownerList);
		
		return OWNER_RESULT;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		return false;
	}

}
