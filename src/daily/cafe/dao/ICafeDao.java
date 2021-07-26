package daily.cafe.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.cafe.vo.CafeIntroduceVO;
import daily.cafe.vo.CafeRegionNameVO;
import daily.cafe.vo.CafeVO;
import daily.owner.vo.OwnerVO;

public interface ICafeDao {

	/**
	 * DB의 TB_CAFE테이블 전체 또는 검색된 레코드를 가져와서 List에 담아 반환하는 메서드
	 * @param smc
	 * @param cafeVO
	 * @param pagingVO
	 * @return
	 * @throws SQLException
	 */
	public List<CafeRegionNameVO> retreieveCafeList(SqlMapClient smc, CafeRegionNameVO cafeVO) throws SQLException;
	
	/**
	 * 카페지점 페이징 처리를 위한 카운트
	 * @param smc
	 * @param cafeVO
	 * @return
	 * @throws SQLException
	 */
	public int getCafeCnt(SqlMapClient smc, CafeRegionNameVO cafeVO) throws SQLException;
	
	/**
	 * 해당 카페지점 정보를 조회
	 * @param smc
	 * @param cafeNo
	 * @return
	 * @throws SQLException
	 */
	public CafeRegionNameVO retreieveCafe(SqlMapClient smc, String cafeNo) throws SQLException;
	
	/**
	 * 해당 카페지점 소개정보 조회
	 * @param smc
	 * @param cafeNo
	 * @return
	 * @throws SQLException
	 */
	public CafeIntroduceVO cafeIntroduce(SqlMapClient smc, String cafeNo) throws SQLException;
	
	/**
	 * 카페지점 등록
	 * @param smc
	 * @param cafeVO
	 * @return
	 * @throws SQLException
	 */
	public int createCafe(SqlMapClient smc, CafeVO cafeVO) throws SQLException;
	
	/**
	 * 카페지점 등록시 지점주 아이디를 찾기위해 지점주 아이디 리스트 조회
	 * @param smc
	 * @return
	 * @throws SQLException
	 */
	public List<OwnerVO> retreieveOwnerList(SqlMapClient smc) throws SQLException;
	
	/**
	 * 카페 지점 수정
	 * @param smc
	 * @param cafeVO
	 * @return
	 * @throws SQLException
	 */
	public int updateCafe(SqlMapClient smc, CafeVO cafeVO) throws SQLException;
	
	/**
	 * 카페 지점 삭제
	 * @param smc
	 * @param CafeNo
	 * @return
	 * @throws SQLException
	 */
	public int deleteCafe(SqlMapClient smc, String cafeNo) throws SQLException;
	
	
	
	
	/**
	 * 지점주의 아이디로 소유한 지점 번호를 알아낸다
	 * @param smc
	 * @param cafeVO
	 * @return
	 * @throws Exception
	 */
	public CafeVO getCafeToSeat (SqlMapClient smc, String ownerId) throws Exception;
	
}
