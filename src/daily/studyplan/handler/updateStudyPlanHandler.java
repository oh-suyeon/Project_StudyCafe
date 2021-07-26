package daily.studyplan.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.studyplan.service.IStudyPlanService;
import daily.studyplan.service.StudyPlanServiceImpl;
import daily.studyplan.vo.StudyPlanVO;

public class updateStudyPlanHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/studyPlan.do";
	private IStudyPlanService planService = StudyPlanServiceImpl.getInstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String studyPlanNo = req.getParameter("_id");
		String studyPlanName = req.getParameter("title");
		String studyPlanStartDate = req.getParameter("start");
		String studyPlanEndDate = req.getParameter("end");
		String description = req.getParameter("description");
		String planType = req.getParameter("type");
		String userId = req.getParameter("username");
		String backgroundColor = req.getParameter("backgroundColor");
		String textColor = req.getParameter("textColor");
		String allDay = req.getParameter("allDay");
		
		StudyPlanVO planVO = new StudyPlanVO();
		
		planVO.setStudyPlanNo(studyPlanNo);
		planVO.setStudyPlanName(studyPlanName);
		planVO.setStudyPlanStartDate(studyPlanStartDate);
		planVO.setStudyPlanEndDate(studyPlanEndDate);
		planVO.setDescription(description);
		planVO.setPlanType(planType);
		planVO.setUserId(userId);
		planVO.setBackgroundColor(backgroundColor);
		planVO.setTextColor(textColor);
		planVO.setAllDay(allDay);
		
		int cnt = planService.updateStudyPlan(planVO);
		
		return VIEW_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}

}
