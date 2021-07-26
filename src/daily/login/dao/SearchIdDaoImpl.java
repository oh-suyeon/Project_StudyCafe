package daily.login.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.user.vo.UserVO;

public class SearchIdDaoImpl implements ISearchIdDao{

	private static ISearchIdDao searchDao;
	
	private SearchIdDaoImpl() {

	}
	public static ISearchIdDao getInstance() {
		if(searchDao == null) {
			searchDao = new SearchIdDaoImpl();
		}
		return searchDao;
	}

	@Override
	public List<UserVO> searchId(SqlMapClient smc, UserVO userVO) throws SQLException {
		List<UserVO> userList = smc.queryForList("idSearch.searchId", userVO);
		return userList;
	}
	@Override
	public UserVO selectIdEmail(SqlMapClient smc, String userId) throws SQLException{
		UserVO userVO = (UserVO) smc.queryForObject("idSearch.selectIdEmail", userId);
		return userVO;
	}
	@Override
	public int updatePw(SqlMapClient smc, UserVO userVO) throws SQLException {
		int cnt = smc.update("idSearch.updatePw", userVO);
		return cnt;
	}

}
