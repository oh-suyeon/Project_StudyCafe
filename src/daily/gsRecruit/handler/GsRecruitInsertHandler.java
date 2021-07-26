package daily.gsRecruit.handler;

import java.net.URLEncoder;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import daily.common.handler.CommandHandler;
import daily.gsRecruit.service.GsRecruitServiceImpl;
import daily.gsRecruit.service.IGsRecruitService;
import daily.gsRecruit.vo.GsRecruitVO;

public class GsRecruitInsertHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/views/gsRecruit/insertForm.jsp";
	
	private IGsRecruitService gsRecruitService = GsRecruitServiceImpl.getInstance();
	
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			
			return VIEW_PAGE;
		}else if(req.getMethod().equals("POST")) {
			
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
			
			grv.setGsBoardTitle(gsBoardTitle);
			grv.setGsName(gsName);
			grv.setGsLeader(gsLeader);
			grv.setGsMemberCnt(gsMemberCnt);
			grv.setGsStartDate(gsStartDate);
			grv.setGsEndDate(gsEndDate);
			grv.setGsBoardContent(gsBoardContent);
			grv.setGsOpenYn(gsOpenYn);
			grv.setGsPw(gsPw);
				
			int cnt = gsRecruitService.insertGs(grv);
		
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
