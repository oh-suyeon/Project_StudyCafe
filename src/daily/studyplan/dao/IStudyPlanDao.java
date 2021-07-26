package daily.studyplan.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.studyplan.vo.StudyPlanVO;

public interface IStudyPlanDao {
	
	public List<StudyPlanVO> retrieveStudyPlanList(SqlMapClient smc, String userId) throws SQLException;
	
	public int createStudyPlan(SqlMapClient smc, StudyPlanVO spVO) throws SQLException;
	
	public int updateStudyPlan(SqlMapClient smc, StudyPlanVO spVO) throws SQLException;
	
	public int deleteStudyPlan(SqlMapClient smc, String studyPlanNo) throws SQLException;

}
