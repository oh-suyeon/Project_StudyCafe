package daily.gsRecruit.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.gsRecruit.vo.GsRecruitVO;

public class GsRecruitDaoImpl implements IGsRecruitDao{

	private static IGsRecruitDao gsRecruitDao; // 자기자신의 타입을 담을 변수
	
	private GsRecruitDaoImpl() {
		
	}
	
	//외부에서 객체 사용하도록
	public static IGsRecruitDao getInstance() {
		if(gsRecruitDao == null) {
			gsRecruitDao = new GsRecruitDaoImpl();
		}
		return gsRecruitDao;
	}
	
	@Override
	public List<GsRecruitVO> getAllGsRecruitList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		
		List<GsRecruitVO> gsRecruitList = smc.queryForList("gsRecruit.getAllGsRecruitList", pagingVO);
		return gsRecruitList;
	}


	@Override
	public int getTotalCnt(SqlMapClient smc, GsRecruitVO grv) throws SQLException {
		
		int cnt = (int)smc.queryForObject("gsRecruit.getTotalCnt", grv);
		return cnt;
//		return 0;
	}

	@Override
	public GsRecruitVO getGsRecruit(SqlMapClient smc, String gsRecruitNo) throws SQLException {
		
		GsRecruitVO grv = (GsRecruitVO)smc.queryForObject("gsRecruit.getGsRecruit", gsRecruitNo);
		return grv;
	}

	@Override
	public int insertGs(SqlMapClient smc, GsRecruitVO grv) throws SQLException {
		
		int cnt = 0;
		
		Object obj = smc.insert("gsRecruit.insertGs", grv) ;
		
		if(obj == null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public int deleteGs(SqlMapClient smc, String gsRecruitNo)  throws SQLException{
		int cnt = smc.delete("gsRecruit.deleteGs", gsRecruitNo);
		return cnt;
	}

	@Override
	public int updateGs(SqlMapClient smc, GsRecruitVO grv) throws SQLException {
		
		int cnt = smc.update("gsRecruit.updateGs", grv);
		return cnt;
	}

	@Override
	public List<GsRecruitVO> searchGsRecruitList(SqlMapClient smc, GsRecruitVO grv) throws SQLException {
	
		List<GsRecruitVO> gsRecruitList = smc.queryForList("gsRecruit.searchGsRecruit", grv);
		return gsRecruitList;
	}

}
