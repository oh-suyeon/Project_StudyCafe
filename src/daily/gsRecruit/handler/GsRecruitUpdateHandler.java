package daily.gsRecruit.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.gsRecruit.service.GsRecruitServiceImpl;
import daily.gsRecruit.service.IGsRecruitService;
import daily.gsRecruit.vo.GsRecruitVO;

public class GsRecruitUpdateHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/views/gsRecruit/updateForm.jsp";
	
	private IGsRecruitService gsRecruitService = GsRecruitServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("GET")) {
			String gsRecruitNo = req.getParameter("gsRecruitNo");
			
			GsRecruitVO grv = gsRecruitService.getGsRecruit(gsRecruitNo);
			
			req.setAttribute("grv", grv);
			
			return VIEW_PAGE;
			
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String gsRecruitNo = req.getParameter("gsRecruitNo");
			String gsBoardTitle = req.getParameter("gsBoardTitle");
			String gsName = req.getParameter("gsName");
			String gsLeader = req.getParameter("gsLeader");
			int gsMemberCnt = Integer.parseInt(req.getParameter("gsMemberCnt"));
			String gsStartDate = req.getParameter("gsStartDate");
			String gsEndDate = req.getParameter("gsEndDate");
			String gsBoardContent = req.getParameter("gsBoardContent");
			String gsOpenYn = req.getParameter("gsOpenYn");
			String gsPw = req.getParameter("gsPw");
			
			GsRecruitVO grv = new GsRecruitVO();
			
			grv.setGsRecruitNo(gsRecruitNo);
			grv.setGsBoardTitle(gsBoardTitle);
			grv.setGsName(gsName);
			grv.setGsLeader(gsLeader);
			grv.setGsMemberCnt(gsMemberCnt);
			grv.setGsStartDate(gsStartDate);
			grv.setGsEndDate(gsEndDate);
			grv.setGsBoardContent(gsBoardContent);
			grv.setGsOpenYn(gsOpenYn);
			grv.setGsPw(gsPw);
			
			int cnt = gsRecruitService.updateGs(grv);
			
			String msg = "";
			if(cnt > 0) {
				msg = "성공";
			}else {
				msg = "실패";
			}
		
			String redirectURL = req.getContextPath() + "/gsRecruitList.do?msg=" + URLEncoder.encode(msg, "utf-8");
			return redirectURL;
		}
		
		return null;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			return false;
		}else if(req.getMethod().equals("POST")) {
			return true;
		}
		return false;
	}

}
