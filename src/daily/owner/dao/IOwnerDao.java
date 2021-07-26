package daily.owner.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.owner.vo.OwnerCafeInfoVO;
import daily.user.vo.UserVO;

public interface IOwnerDao {
	
	/**
	 * 관리자 관리화면에서 지점주 리스트를 조회
	 * @param smc
	 * @param ownerCafeVO
	 * @return
	 * @throws SQLException
	 */
	public List<OwnerCafeInfoVO> retreieveOwnerList(SqlMapClient smc, OwnerCafeInfoVO ownerCafeVO) throws SQLException;
	
	/**
	 * 지점주 리스트 페이징 처리를 위한 카운트
	 * @param smc
	 * @param ownerCafeVO
	 * @return
	 * @throws SQLException
	 */
	public int getCafeCnt(SqlMapClient smc, OwnerCafeInfoVO ownerCafeVO) throws SQLException;
	
	/**
	 * 지점주 아이디 체크
	 * @param smc
	 * @param ownerId
	 * @return
	 * @throws SQLException
	 */
	public OwnerCafeInfoVO ownerIdCheck(SqlMapClient smc, String ownerId) throws SQLException;
	
	/**
	 * 지점주 계정 등록
	 * @param smc
	 * @param ownerCafeVO
	 * @return
	 * @throws SQLException
	 */
	public int createOwner(SqlMapClient smc, OwnerCafeInfoVO ownerCafeVO) throws SQLException;
	
	/**
	 * 지점주 정보상세 조회
	 * @param ownerId
	 * @return
	 */
	public OwnerCafeInfoVO getOwner(SqlMapClient smc, String ownerId) throws SQLException;
	
	/**
	 * 지점주 계정 삭제
	 * @param smc
	 * @param ownerId
	 * @return
	 * @throws SQLException
	 */
	public int deleteOwner(SqlMapClient smc, String ownerId) throws SQLException;
	
	/**
	 * 지점주 계정 수정
	 * @param smc
	 * @param ownerCafeVO
	 * @return
	 * @throws SQLException
	 */
	public int updateOwner(SqlMapClient smc, OwnerCafeInfoVO ownerCafeVO) throws SQLException;
}
