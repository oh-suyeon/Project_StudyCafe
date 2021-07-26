package daily.gsFeed.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.gsFeed.vo.GsFeedVO;

public interface IGsFeedDao {

	public int getTotalCnt(SqlMapClient smc, IGsFeedDao gsFeedDao)throws SQLException;

	public List<GsFeedVO> getAllGsFeedList(SqlMapClient smc, PagingVO pagingVO)throws SQLException;

	public GsFeedVO getGsFeed(SqlMapClient smc, String gsFeedNo)throws SQLException;

	public int insertFd(SqlMapClient smc, GsFeedVO gsFeedVO)throws SQLException;

	public int deleteFd(SqlMapClient smc, String gsFeedNo)throws SQLException;

	public int updateFd(SqlMapClient smc, GsFeedVO gsFeedVO)throws SQLException;


}
