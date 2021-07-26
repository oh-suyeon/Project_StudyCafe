package daily.studyplan.service;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.studyplan.vo.StudyPlanVO;

public interface IStudyPlanService {
	
	public List<StudyPlanVO> retrieveStudyPlanList(String userId);
	
	public int createStudyPlan(StudyPlanVO spVO);
	
	public int updateStudyPlan(StudyPlanVO spVO);
	
	public int deleteStudyPlan(String studyPlanNo);

}
