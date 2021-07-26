package daily.cafe.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.cafe.service.CafeServiceImpl;
import daily.cafe.service.ICafeService;
import daily.cafe.vo.CafeRegionNameVO;
import daily.common.handler.CommandHandler;

public class CafeGetHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/views/cafe/cafeGet.jsp";
	
	private ICafeService cafeService = CafeServiceImpl.getinstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String cafeNo = req.getParameter("cafeNo");
		
		CafeRegionNameVO cafeVO = cafeService.retreieveCafe(cafeNo);
		
		req.setAttribute("cafeVO", cafeVO);
		
		return VIEW_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return false;
	}

}
