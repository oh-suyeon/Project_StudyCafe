package daily.studyplan.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.studyplan.service.IStudyPlanService;
import daily.studyplan.service.StudyPlanServiceImpl;

public class deleteStudyPlanHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/studyPlan.do";
	IStudyPlanService planService = StudyPlanServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String studyPlanNo = req.getParameter("studyPlanNo");
		
		int cnt = planService.deleteStudyPlan(studyPlanNo);
		
		return req.getContextPath() + VIEW_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}

}
