<%@page import="daily.studyplan.vo.StudyPlanVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


[

<%
List<StudyPlanVO> planList = (List<StudyPlanVO>)request.getAttribute("planList");

for(int i=0; i<planList.size(); i++){
	if(i > 0){
		%>,<%
	}
	StudyPlanVO vo = planList.get(i);
	
	int id = Integer.parseInt(vo.getStudyPlanNo());
	String title = vo.getStudyPlanName();
	String description = vo.getDescription();
	String start = vo.getStudyPlanStartDate();
	String end = vo.getStudyPlanEndDate();
	String type = vo.getPlanType();
	String username = vo.getUserId();
	String backgroundColor = vo.getBackgroundColor();
	String textColor = vo.getTextColor();
	String allDay = vo.getAllDay();
	
	%>
	{
		"_id" : <%=id %>
	    ,"title" : "<%=title %>"
	    ,"description" : "<%=description %>"
	    ,"start" : "<%=start %>"
	    ,"end" : "<%=end %>"
	    ,"type" : "<%=type %>"
	    ,"username" : "<%=username %>"
	    ,"backgroundColor" : "<%=backgroundColor %>"
	    ,"textColor" : "<%=textColor %>"
	    ,"allDay" : "<%=allDay %>"
	}
    <%
}
%>

]
