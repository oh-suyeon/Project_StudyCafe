package daily.login.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.admin.vo.AdminVO;
import daily.common.vo.CommonVO;
import daily.owner.vo.OwnerVO;
import daily.user.vo.UserVO;

public interface ILoginDao {

	/**
	 * 회원테이블에서 아이디가 존재하는 지 체크 후 회원 정보 반환
	 * @param commonVO
	 * @return 아이디에 해당하는 회원 정보
	 * @throws SQLException
	 */
	public UserVO loginUser(SqlMapClient smc, CommonVO commonVO) throws SQLException;
	
	/**
	 * 관리자테이블에서 아이디가 존재하는 지 체크 후 회원 정보 반환
	 * @param smc
	 * @param commonVO
	 * @return 아이디에 해당하는 회원 정보
	 * @throws SQLException
	 */
	public AdminVO loginAdmin(SqlMapClient smc, CommonVO commonVO) throws SQLException;
	
	/**
	 * 지점주테이블에서 아이디가 존재하는 지 체크 후 회원 정보 반환
	 * @param smc
	 * @param commonVO
	 * @return 아이디에 해당하는 회원 정보
	 * @throws SQLException
	 */
	public OwnerVO loginOwner(SqlMapClient smc, CommonVO commonVO) throws SQLException;
}
