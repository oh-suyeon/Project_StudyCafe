package daily.user.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.review.vo.ReviewVO;
import daily.user.vo.BlacklistVO;
import daily.user.vo.UserVO;

public class UserDaoImpl implements IUserDao{
	
private static IUserDao userDao;
	
	private UserDaoImpl() {
	}
	
	public static IUserDao getInstance() {
		if(userDao == null) {
			userDao = new UserDaoImpl();
		}
		return userDao;
	}

	
	
	@Override
	public int updateUser(SqlMapClient smc, UserVO userVO) throws Exception {
		int cnt = smc.update("user.updateUser", userVO);
		return cnt;
	}

	@Override
	public UserVO getUser(SqlMapClient smc, String userId) throws SQLException {
		UserVO uv = 
				(UserVO)smc.queryForObject("user.getReview", userId);
				
				return uv;
	}
	
	

	@Override
	public List<UserVO> getAllUserList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		List<UserVO> rewList = 
				smc.queryForList("user.getUserAll", pagingVO);
		
		return rewList;
	}

	@Override
	public int getTotalCnt(SqlMapClient smc) throws SQLException {
		int cnt = (int)smc.queryForObject("user.getTotalCnt");
		return cnt;
	}

	@Override
	public UserVO getUserid(SqlMapClient smc, String userId) throws SQLException {
		UserVO uv = 
				(UserVO)smc.queryForObject("user.getUserid", userId);
		
				return uv;
	}

	@Override
	public int insertBlacklist(SqlMapClient smc, BlacklistVO bv) throws SQLException {
		int cnt = 0;
		
		Object obj = smc.insert("blacklist.insertBlacklist", bv);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

	@Override
	public int deleteBlacklist(SqlMapClient smc, String userId) throws SQLException {
		int cnt = smc.delete("blacklist.deleteBlacklist", userId);
		
		return cnt;
	}

	@Override
	public boolean checkBlacklist(SqlMapClient smc, String userId) throws SQLException {
		
		boolean check = false;
		
		int count = (int) smc.queryForObject("blacklist.checkBlacklist", userId);
		
		if(count > 0) {
			check = true;
		}
		
		return check;
	}

	

}
