package daily.gsFeed.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.gsFeed.vo.GsFeedVO;



public class GsFeedDaoImpl implements IGsFeedDao{

	private static IGsFeedDao gsFeedDao; // 자기자신의 타입을 담을 변수
	
	private GsFeedDaoImpl() {
		
	}
	
	//외부에서 객체 사용하도록
	public static IGsFeedDao getInstance() {
		if(gsFeedDao == null) {
			gsFeedDao = new GsFeedDaoImpl();
		}
		return gsFeedDao;
	}

	@Override
	public int getTotalCnt(SqlMapClient smc, IGsFeedDao gsFeedDao) throws SQLException {
		int cnt = (int)smc.queryForObject("gsFeed.getTotalCnt", gsFeedDao);
		return cnt;
	}

	@Override
	public List<GsFeedVO> getAllGsFeedList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		List<GsFeedVO> gsFeedList = smc.queryForList("gsFeed.getAllGsFeedList", pagingVO);
		return gsFeedList;
	}

	@Override
	public GsFeedVO getGsFeed(SqlMapClient smc, String gsFeedNo) throws SQLException {
		GsFeedVO grv = (GsFeedVO)smc.queryForObject("gsFeed.getGsFeed", gsFeedNo);
		return grv;
	}

	@Override
	public int insertFd(SqlMapClient smc, GsFeedVO gsFeedVO) throws SQLException {
		
		int cnt = 0;
		
		Object obj = smc.insert("gsFeed.insertFd", gsFeedVO) ;
		
		if(obj == null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public int deleteFd(SqlMapClient smc, String gsFeedNo) throws SQLException {
		int cnt = smc.delete("gsFeed.deleteFd", gsFeedNo);
		return cnt;
	}

	@Override
	public int updateFd(SqlMapClient smc, GsFeedVO gsFeedVO) throws SQLException {
		
		int cnt = smc.update("gsFeed.updateFd", gsFeedVO);
		return cnt;
	}

}
