package daily.gsRecruit.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.gsRecruit.vo.GsRecruitVO;

public interface IGsRecruitDao {
	/**
	 * 그룹방 게시글 목록 조회
	 * @param smc
	 * @param pagingVO
	 * @return
	 * @throws SQLException
	 */
	public List<GsRecruitVO> getAllGsRecruitList(SqlMapClient smc, PagingVO pagingVO) throws SQLException;
	

	public int getTotalCnt(SqlMapClient smc, GsRecruitVO grv)throws SQLException;


	public GsRecruitVO getGsRecruit(SqlMapClient smc, String gsRecruitNo)throws SQLException;


	public int insertGs(SqlMapClient smc, GsRecruitVO grv) throws SQLException;


	public int deleteGs(SqlMapClient smc, String gsRecruitNo)throws SQLException;


	public int updateGs(SqlMapClient smc, GsRecruitVO grv)throws SQLException;


	public List<GsRecruitVO> searchGsRecruitList(SqlMapClient smc, GsRecruitVO grv)throws SQLException;
	
	
}
