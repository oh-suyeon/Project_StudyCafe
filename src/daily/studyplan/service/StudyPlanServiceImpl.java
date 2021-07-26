package daily.studyplan.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.studyplan.dao.IStudyPlanDao;
import daily.studyplan.dao.StudyPlanDaoImpl;
import daily.studyplan.vo.StudyPlanVO;
import daily.util.SqlMapClientFactory;

public class StudyPlanServiceImpl implements IStudyPlanService{
	
	private static IStudyPlanService studyPlanService;
	
	private IStudyPlanDao studyPlanDao;
	private SqlMapClient smc;
	
	private StudyPlanServiceImpl() {
		studyPlanDao = StudyPlanDaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IStudyPlanService getInstance() {
		if(studyPlanService == null) {
			studyPlanService = new StudyPlanServiceImpl();
		}
		return studyPlanService;
	}

	@Override
	public List<StudyPlanVO> retrieveStudyPlanList(String userId) {
		
		List<StudyPlanVO> planList = new ArrayList<StudyPlanVO>();
		
		try {
			planList = studyPlanDao.retrieveStudyPlanList(smc, userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return planList;
	}

	@Override
	public int createStudyPlan(StudyPlanVO spVO) {
		int cnt = 0;
		try {
			cnt = studyPlanDao.createStudyPlan(smc, spVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateStudyPlan(StudyPlanVO spVO) {
		int cnt = 0;
		try {
			cnt = studyPlanDao.updateStudyPlan(smc, spVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteStudyPlan(String studyPlanNo) {
		int cnt = 0;
		try {
			cnt = studyPlanDao.deleteStudyPlan(smc, studyPlanNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

}
