package daily.studyplan.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.studyplan.vo.StudyPlanVO;

public class StudyPlanDaoImpl implements IStudyPlanDao{
	
	private static IStudyPlanDao studyPlanDao;
	
	private StudyPlanDaoImpl() {};
	
	public static IStudyPlanDao getInstance() {
		if(studyPlanDao == null) {
			studyPlanDao = new StudyPlanDaoImpl();
		}
		return studyPlanDao;
	}

	@Override
	public List<StudyPlanVO> retrieveStudyPlanList(SqlMapClient smc, String userId) throws SQLException {
		List<StudyPlanVO> planList = smc.queryForList("studyPlan.retrieveStudyPlanList", userId);
		return planList;
	}

	@Override
	public int createStudyPlan(SqlMapClient smc, StudyPlanVO spVO) throws SQLException {
		Object obj = smc.insert("studyPlan.createStudyPlan", spVO);
		
		int cnt = 0;
		
		if(obj == null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public int updateStudyPlan(SqlMapClient smc, StudyPlanVO spVO) throws SQLException {
		int cnt = smc.update("studyPlan.updateStudyPlan", spVO);
		return cnt;
	}

	@Override
	public int deleteStudyPlan(SqlMapClient smc, String studyPlanNo) throws SQLException {
		int cnt = smc.delete("studyPlan.deleteStudyPlan", studyPlanNo);
		return cnt;
	}

}
