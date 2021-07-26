package daily.gsRecruit.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.dao.AtchFileDaoImpl;
import daily.common.handler.CommandHandler;
import daily.common.service.AtchFileServiceImpl;
import daily.common.service.IAtchFileService;
import daily.common.vo.AtchFileVO;
import daily.gsRecruit.service.GsRecruitServiceImpl;
import daily.gsRecruit.service.IGsRecruitService;
import daily.gsRecruit.vo.GsRecruitVO;

public class GsRecruitDetailHandler implements CommandHandler{

	private static final String VIEW_PAGE ="/views/gsRecruit/detail.jsp";
	
	private IGsRecruitService gsRecruitService = GsRecruitServiceImpl.getInstance();
	

	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		String gsRecruitNo = req.getParameter("gsRecruitNo");
		
		GsRecruitVO grv = gsRecruitService.getGsRecruit(gsRecruitNo);
		
		
		req.setAttribute("grv", grv);
		return VIEW_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return false;
	}

}
