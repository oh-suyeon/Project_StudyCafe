package daily.gsFeed.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.gsFeed.service.GsFeedServiceImpl;
import daily.gsFeed.service.IGsFeedService;
import daily.gsFeed.vo.GsFeedVO;


public class GsFeedDetailHandler implements CommandHandler {

	private static final String VIEW_PAGE ="/views/gsFeed/gsFeedDetail.jsp";
	
	private IGsFeedService gsFeedService = GsFeedServiceImpl.getInstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String gsFeedNo = req.getParameter("gsFeedNo");
		
		GsFeedVO gsFeedVO = gsFeedService.getGsFeed(gsFeedNo);
		
		
		req.setAttribute("gsFeedVO", gsFeedVO);
		return VIEW_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
