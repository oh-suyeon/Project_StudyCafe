package daily.studyplan.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.studyplan.service.IStudyPlanService;
import daily.studyplan.service.StudyPlanServiceImpl;
import daily.studyplan.vo.StudyPlanVO;

public class retrieveStudyPlanListHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/views/studyplan/fullcalendar.jsp";
	private static final String RESULT_PAGE = "/views/studyplan/studyPlanResult.jsp";

	IStudyPlanService planService = StudyPlanServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String userId = req.getParameter("loginId");
		
		List<StudyPlanVO> planList = planService.retrieveStudyPlanList(userId);
		
		String url = "";
		if(planList.size() > 0) {
			req.setAttribute("planList", planList);
			url = RESULT_PAGE;
			
		}else {
			url = VIEW_PAGE;
		}
		
		return req.getContextPath() + url;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

}
