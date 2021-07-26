package daily.join.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.user.vo.UserVO;

public interface IUserJoinDao {
	
	/**
	 * 입력한 아이디가 회원 아이디에 존재하는지 여부를 알아내는 메서드
	 * @param smc
	 * @param userId
	 * @return 해당 회원 아이디가 있으면 해당 아이디의 회원 정보 가져옴
	 * @throws SQLException
	 */
	public UserVO checkUser(SqlMapClient smc, String userId) throws SQLException;
	
	/**
	 * 입력한 회원 정보를 바탕으로 회원 등록해주는 메서드
	 * @param smc
	 * @param uv
	 * @return DB 저장 작업이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환됨
	 * @throws SQLException
	 */
	public int insertUser(SqlMapClient smc, UserVO userVO) throws SQLException;

	public int updateUser(SqlMapClient smc, UserVO userVO)throws SQLException;
}
