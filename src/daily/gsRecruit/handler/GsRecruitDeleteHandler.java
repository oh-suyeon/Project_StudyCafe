package daily.gsRecruit.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.gsRecruit.service.GsRecruitServiceImpl;
import daily.gsRecruit.service.IGsRecruitService;

public class GsRecruitDeleteHandler implements CommandHandler{

	private IGsRecruitService gsRecruitService = GsRecruitServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String gsRecruitNo = req.getParameter("gsRecruitNo");
		
		int cnt = gsRecruitService.deleteGs(gsRecruitNo);
		
		String msg= "";
		if(cnt > 0) {
			msg= "성공";
		}else {
			msg= "실패";
		}
		
		String redirectURL = req.getContextPath() + "/gsRecruitList.do?msg=" + URLEncoder.encode(msg, "utf-8");
		return redirectURL;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return true;
	}

}
