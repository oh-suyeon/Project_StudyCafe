package daily.seat.service;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.seat.dao.IUserSeatDao;
import daily.seat.dao.UserSeatDaoImpl;
import daily.seat.vo.UserSeatVO;
import daily.util.SqlMapClientFactory;

public class UserSeatServiceImpl implements IUserSeatService{

	private static IUserSeatService userSeatService;
	
	public static IUserSeatService getInstance() {
		if(userSeatService == null) {
			userSeatService = new UserSeatServiceImpl();
		}
		return userSeatService;
	}
	
	private IUserSeatDao userSeatDao;
	private SqlMapClient smc;
	
	private UserSeatServiceImpl() {
		userSeatDao = UserSeatDaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}
	
	@Override
	public List<UserSeatVO> userGetSeatList(UserSeatVO userSeatVO) {
		List<UserSeatVO> userSeatList = new ArrayList<>();
		try {
			userSeatList = userSeatDao.userGetSeatList(smc, userSeatVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userSeatList;
	}

	@Override
	public List<UserSeatVO> userGetMySeatList(String userId) {
		List<UserSeatVO> userSeatList = new ArrayList<>();
		try {
			userSeatList = userSeatDao.userGetMySeatList(smc, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userSeatList;
	}

	@Override
	public UserSeatVO userGetMySeat(String userId) {
		UserSeatVO userSeat = new UserSeatVO();
		try {
			userSeat = userSeatDao.userGetMySeat(smc, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userSeat;
	}

	@Override
	public int userInsertSeat01(UserSeatVO userSeatVO) {
		int cnt = 0;
		
		try {
			cnt = userSeatDao.userInsertSeat01(smc, userSeatVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int userInsertSeat02(UserSeatVO userSeatVO) {
		int cnt = 0;
		
		try {
			cnt = userSeatDao.userInsertSeat02(smc, userSeatVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int userUpdateSeat(UserSeatVO userSeatVO) {
		int cnt = 0;
		
		try {
			cnt = userSeatDao.userUpdateSeat(smc, userSeatVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int userDeleteSeat(String userSeatNo) {
		int cnt = 0;
		
		try {
			cnt = userSeatDao.userDeleteSeat(smc, userSeatNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int userUpdateSeatTicketNo(UserSeatVO userSeatVO) {
		int cnt = 0;
		
		try {
			cnt = userSeatDao.userUpdateSeatTicketNo(smc, userSeatVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public UserSeatVO getUserSeatNo(String userId) {
		
		UserSeatVO userSeatVO = new UserSeatVO();
		
		try {
			userSeatVO = userSeatDao.getUserSeatNo(smc, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userSeatVO;
	}

	@Override
	public int reservationCnt(String cafeSeatNo) {
		int cnt = 0;
		
		try {
			cnt = userSeatDao.reservationCnt(smc, cafeSeatNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

}
