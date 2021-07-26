package daily.join.service;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.util.SHA256Util;
import daily.util.SqlMapClientFactory;
import daily.join.dao.IUserJoinDao;
import daily.join.dao.UserJoinDaoImpl;
import daily.user.vo.UserVO;

public class UserJoinServiceImpl implements IUserJoinService{
	
	private IUserJoinDao userJoinDao;
	private SqlMapClient smc;
	
	private static IUserJoinService userJoinService;	
	
	private UserJoinServiceImpl() {
		userJoinDao = UserJoinDaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IUserJoinService getInstance() {
		if(userJoinService == null) {
			userJoinService = new UserJoinServiceImpl();
		}
		return userJoinService;
	}

	@Override
	public UserVO checkUser(String userId) {
		UserVO userVO = null;
		try {
			userVO = userJoinDao.checkUser(smc, userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userVO;
	}

	@Override
	public int insertUser(UserVO userVO) {
		int cnt =0;
		try {

            String newUserPw = SHA256Util.getEncrypt(userVO.getUserPw(), userVO.getUserId());
            userVO.setUserPw(newUserPw);

			cnt = userJoinDao.insertUser(smc, userVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateUser(UserVO userVO) {
		int cnt =0;
		try {

            String newUserPw = SHA256Util.getEncrypt(userVO.getUserPw(), userVO.getUserId());
            userVO.setUserPw(newUserPw);

			cnt = userJoinDao.updateUser(smc, userVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}


	
	
	
}
