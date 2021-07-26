package daily.login.dao;

import java.sql.SQLException;
import com.ibatis.sqlmap.client.SqlMapClient;
import daily.admin.vo.AdminVO;
import daily.common.vo.CommonVO;
import daily.owner.vo.OwnerVO;
import daily.user.vo.UserVO;

public class LoginDaoImpl implements ILoginDao{

	private static ILoginDao loginDao;
	
	private LoginDaoImpl() {

	}
	
	public static ILoginDao getInstance() {
		if(loginDao == null) {
			loginDao = new LoginDaoImpl();
		}
		return loginDao;
	}

	@Override
	public UserVO loginUser(SqlMapClient smc, CommonVO commonVO) throws SQLException {
		UserVO userVO = (UserVO)smc.queryForObject("login.loginUser", commonVO);
		return userVO;
	}

	@Override
	public AdminVO loginAdmin(SqlMapClient smc, CommonVO commonVO) throws SQLException {
		AdminVO adminVO = (AdminVO)smc.queryForObject("login.loginAdmin", commonVO);
		return adminVO;
	}

	@Override
	public OwnerVO loginOwner(SqlMapClient smc, CommonVO commonVO) throws SQLException {
		OwnerVO ownerVO = (OwnerVO)smc.queryForObject("login.loginOwner", commonVO);
		return ownerVO;
	}
	


}
