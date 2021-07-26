package daily.studyplan.vo;

public class StudyPlanVO {
	
	private String studyPlanNo        ; 
	private String userId             ;
	private String studyPlanName      ;
	private String studyPlanStartDate ;
	private String studyPlanEndDate   ;
	private String planType           ;
	private String description        ;
	private String backgroundColor    ;
	private String textColor          ;
	private String allDay             ;
	
	public String getStudyPlanNo() {
		return studyPlanNo;
	}
	public void setStudyPlanNo(String studyPlanNo) {
		this.studyPlanNo = studyPlanNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getStudyPlanName() {
		return studyPlanName;
	}
	public void setStudyPlanName(String studyPlanName) {
		this.studyPlanName = studyPlanName;
	}
	public String getStudyPlanStartDate() {
		return studyPlanStartDate;
	}
	public void setStudyPlanStartDate(String studyPlanStartDate) {
		this.studyPlanStartDate = studyPlanStartDate;
	}
	public String getStudyPlanEndDate() {
		return studyPlanEndDate;
	}
	public void setStudyPlanEndDate(String studyPlanEndDate) {
		this.studyPlanEndDate = studyPlanEndDate;
	}
	public String getPlanType() {
		return planType;
	}
	public void setPlanType(String planType) {
		this.planType = planType;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public String getAllDay() {
		return allDay;
	}
	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}
	
	
}
