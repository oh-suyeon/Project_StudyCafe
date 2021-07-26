package daily.gsFeed.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.gsFeed.service.GsFeedServiceImpl;
import daily.gsFeed.service.IGsFeedService;


public class GsFeedDeleteHandler implements CommandHandler{

	private IGsFeedService gsFeedService = GsFeedServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String gsFeedNo = req.getParameter("gsFeedNo");
		
		int cnt = gsFeedService.deleteFd(gsFeedNo);
		
		String msg= "";
		if(cnt > 0) {
			msg= "성공";
		}else {
			msg= "실패";
		}
		
		String redirectURL = req.getContextPath() + "/gsFeedList.do?msg=" + URLEncoder.encode(msg, "utf-8");
		return redirectURL;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return true;
	}

}
