package daily.cafe.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.cafe.service.CafeServiceImpl;
import daily.cafe.service.ICafeService;
import daily.common.handler.CommandHandler;

public class CafeDeleteHandler implements CommandHandler{

	private static final String RESULT_PAGE = "/cafeManage.do";
	
	private ICafeService cafeService = CafeServiceImpl.getinstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String cafeNo = req.getParameter("cafeNo");
		
		int cnt = cafeService.deleteCafe(cafeNo);
		
		String msg = "";
		if(cnt > 0) {
			msg = "success";
		}else {
			msg = "fail";
		}
		
		return req.getContextPath() + RESULT_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}

}
