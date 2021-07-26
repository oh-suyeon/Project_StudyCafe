package daily.login.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.login.dao.ISearchIdDao;
import daily.login.dao.SearchIdDaoImpl;
import daily.user.vo.UserVO;
import daily.util.SHA256Util;
import daily.util.SqlMapClientFactory;

public class SearchIdServiceImpl implements ISearchIdService {
	
	private ISearchIdDao searchIdDao;
	private SqlMapClient smc;
	
	private static ISearchIdService searchIdService;
	
	private  SearchIdServiceImpl() {
		searchIdDao = SearchIdDaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static ISearchIdService getInstance() {
		if(searchIdService == null) {
			searchIdService = new SearchIdServiceImpl();
		}
		return searchIdService;
	}
	
	
	@Override
	public List<UserVO> searchId(UserVO userVO) {
		List<UserVO> userList = new ArrayList<UserVO>();
		try {
			userList = searchIdDao.searchId(smc, userVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}

	@Override
	public UserVO selectIdEmail(String userId) {
		UserVO userVO = null;
		try {
			userVO = searchIdDao.selectIdEmail(smc, userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userVO;
	}

	@Override
	public int updatePw(UserVO userVO) {
		int cnt = 0;
		try {
			//비밀번호 암호화 작업 해주고 넣어주기
			 String newUserPw = SHA256Util.getEncrypt(userVO.getUserPw(), userVO.getUserId());
	         userVO.setUserPw(newUserPw);
			cnt = searchIdDao.updatePw(smc, userVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
