package daily.seat.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.seat.vo.UserSeatVO;

public class UserSeatDaoImpl implements IUserSeatDao{

	private static IUserSeatDao userSeatDao;
	
	private UserSeatDaoImpl() {
	}
	
	public static IUserSeatDao getInstance() {
		if(userSeatDao == null) {
			userSeatDao = new UserSeatDaoImpl();
		}
		return userSeatDao;
	};
	
	
	@Override
	public List<UserSeatVO> userGetSeatList(SqlMapClient smc, UserSeatVO userSeatVO) throws Exception {
		List<UserSeatVO> userSeatList = smc.queryForList("userSeat.userGetSeatList", userSeatVO);
		return userSeatList;
	}

	@Override
	public List<UserSeatVO> userGetMySeatList(SqlMapClient smc, String userId) throws Exception {
		List<UserSeatVO> userSeatList = smc.queryForList("userSeat.userGetMySeatList", userId);
		return userSeatList;
	}

	@Override
	public UserSeatVO userGetMySeat(SqlMapClient smc, String userId) throws Exception {
		UserSeatVO userSeat = (UserSeatVO) smc.queryForObject("userSeat.userGetMySeat", userId);
		return userSeat;
	}

	@Override
	public int userInsertSeat01(SqlMapClient smc, UserSeatVO userSeatVO) throws Exception {
		int cnt = 0;
		Object obj = smc.insert("userSeat.userInsertSeat01", userSeatVO);
		if(obj == null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public int userInsertSeat02(SqlMapClient smc, UserSeatVO userSeatVO) throws Exception {
		int cnt = 0;
		Object obj = smc.insert("userSeat.userInsertSeat02", userSeatVO);
		if(obj == null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public int userUpdateSeat(SqlMapClient smc, UserSeatVO userSeatVO) throws Exception {
		int cnt = smc.update("userSeat.userUpdateSeat", userSeatVO);
		return cnt;
	}
	
	@Override
	public int userUpdateSeatTicketNo(SqlMapClient smc, UserSeatVO userSeatVO) throws Exception {
		int cnt = smc.update("userSeat.userUpdateSeatTicketNo", userSeatVO);
		return cnt;
	}

	@Override
	public UserSeatVO getUserSeatNo(SqlMapClient smc, String userId) throws Exception {
		UserSeatVO userSeatNo = (UserSeatVO) smc.queryForObject("userSeat.getUserSeatNo", userId);
		
		return userSeatNo;
	}

	@Override
	public int userDeleteSeat(SqlMapClient smc, String userSeatNo) throws Exception {
		int cnt = smc.update("userSeat.userDeleteSeat", userSeatNo);
		return cnt;
	}

	@Override
	public int reservationCnt(SqlMapClient smc, String cafeSeatNo) throws Exception {
		int cnt = (int) smc.queryForObject("userSeat.reservationCnt", cafeSeatNo);
		return cnt;
	}


}
