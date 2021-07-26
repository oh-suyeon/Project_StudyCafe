package daily.login.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.user.vo.UserVO;

public interface ISearchIdDao {
	
	/**
	 * 이름과 이메일정보로 아이디 찾기
	 * @param smc
	 * @param userName
	 * @param userEmail
	 * @return
	 */
	public List<UserVO> searchId(SqlMapClient smc, UserVO userVO) throws SQLException;

	/**
	 * 아이디와 이메일 정보로 비밀번호 찾기
	 * @param smc
	 * @param userVO
	 * @return
	 */
	public UserVO selectIdEmail(SqlMapClient smc, String userId) throws SQLException;

	/**
	 * 아이디에 해당하는 비밀번호 바꾸기
	 * @param smc
	 * @param userVO
	 * @return
	 */
	public int updatePw(SqlMapClient smc, UserVO userVO) throws SQLException;

}
