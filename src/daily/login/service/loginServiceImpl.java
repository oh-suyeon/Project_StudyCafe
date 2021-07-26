package daily.login.service;


import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.admin.vo.AdminVO;
import daily.common.vo.CommonVO;
import daily.login.dao.ILoginDao;
import daily.login.dao.LoginDaoImpl;
import daily.owner.vo.OwnerVO;
import daily.user.vo.UserVO;
import daily.util.SqlMapClientFactory;

public class loginServiceImpl implements ILoginService {

	private ILoginDao loginDao;
	private SqlMapClient smc;
	
	private static ILoginService loginService;
	
	private loginServiceImpl() {
		loginDao = LoginDaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static ILoginService getInstance() {
		if(loginService == null) {
			loginService = new loginServiceImpl();
		}
		return loginService;
	}
	

	@Override
	public UserVO loginUser(CommonVO commonVO) {
		UserVO userVO = null;
		
		try {
			userVO = loginDao.loginUser(smc, commonVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userVO;
	}

	@Override
	public AdminVO loginAdmin(CommonVO commonVO) {
		AdminVO adminVO = null;
		try {
			adminVO = loginDao.loginAdmin(smc, commonVO);
		} catch (SQLException e) {
			e.printStackTrace();
		};
		return adminVO;
	}

	@Override
	public OwnerVO loginOwner(CommonVO commonVO) {
		OwnerVO ownerVO = null;
		try {
			ownerVO = loginDao.loginOwner(smc, commonVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ownerVO;
	}

}
