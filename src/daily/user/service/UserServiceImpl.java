package daily.user.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.review.vo.ReviewVO;
import daily.user.dao.IUserDao;
import daily.user.dao.UserDaoImpl;
import daily.user.vo.BlacklistVO;
import daily.user.vo.UserVO;
import daily.util.SqlMapClientFactory;

public class UserServiceImpl implements IUserService{

private static IUserService userService;
	
	public static IUserService getInstance() {
		if(userService == null) {
			userService = new UserServiceImpl();
		}
		return userService;
	}
	
	private IUserDao userDao;
	
	private SqlMapClient smc;
	
	private UserServiceImpl() {
		userDao = UserDaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}

	@Override
	public int updateUser(UserVO userVO) {
		
		int cnt = 0;
		
		try {
			cnt = userDao.updateUser(smc, userVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public UserVO getUser(String userId) {
		UserVO uv = null;
		try {
			uv = userDao.getUser(smc, userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return uv;
	}

	@Override
	public List<UserVO> getAllUserList(PagingVO pagingVO) {
			List<UserVO> userList = new ArrayList<UserVO>();
		
		try {
			userList = userDao.getAllUserList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userList;
	}

	@Override
	public int getTotalCnt() {
		int cnt = 0;
		
		try {
			cnt = userDao.getTotalCnt(smc);
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
				
		return cnt;
	}

	@Override
	public UserVO getUserid(String userId) {
		UserVO uv = null;
		try {
			uv = userDao.getUserid(smc, userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return uv;
	}

	@Override
	public int insertBlacklist(BlacklistVO bv) {
		int cnt = 0;
		
		try {
			cnt = userDao.insertBlacklist(smc, bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int deleteBlacklist(String userId) {
		int cnt = 0;
		
		try {
			cnt = userDao.deleteBlacklist(smc, userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public boolean checkBlacklist(String userId) {
			boolean chk = false;
		
		try {
			chk = userDao.checkBlacklist(smc, userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return chk;
	}
	
	
}
