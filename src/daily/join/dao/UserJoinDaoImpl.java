package daily.join.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.user.vo.UserVO;

public class UserJoinDaoImpl implements IUserJoinDao{
	
	private static IUserJoinDao userJoinDao;
	
	private UserJoinDaoImpl() {
		
	}
	
	public static IUserJoinDao getInstance() {
		if(userJoinDao == null) {
			userJoinDao = new UserJoinDaoImpl();
		}
		return userJoinDao;
	}
	
	@Override
	public UserVO checkUser(SqlMapClient smc, String userId) throws SQLException {
		
		UserVO userVO = (UserVO)smc.queryForObject("userJoin.checkUser", userId);

		return userVO;
	}

	@Override
	public int insertUser(SqlMapClient smc, UserVO userVO) throws SQLException {
		int cnt = 0;
		
		Object obj = smc.insert("userJoin.insertUser", userVO);
		
		if(obj == null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public int updateUser(SqlMapClient smc, UserVO userVO) throws SQLException {
		
		int cnt = smc.update("userJoin.updateUser", userVO);
		return cnt;
	}
	
}
