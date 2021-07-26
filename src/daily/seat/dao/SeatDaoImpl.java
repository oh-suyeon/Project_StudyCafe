package daily.seat.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.cafe.vo.CafeVO;
import daily.seat.vo.SeatVO;

public class SeatDaoImpl implements ISeatDao {

	private static ISeatDao seatDao;
	
	private SeatDaoImpl() {
	}
	
	public static ISeatDao getInstance() {
		if(seatDao == null) {
			seatDao = new SeatDaoImpl();
		}
		return seatDao;
	}
	
	
	
	@Override
	public List<SeatVO> getSeatList(SqlMapClient smc, SeatVO seatVO) throws Exception {
		List<SeatVO> seatList = smc.queryForList("seat.getSeatList", seatVO);
		return seatList;
	}

	@Override
	public int insertSeat(SqlMapClient smc, SeatVO seatVO) throws Exception {
		int cnt = 0;
		Object obj = smc.insert("seat.insertSeat", seatVO);
		if(obj == null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public int deleteSeat(SqlMapClient smc, SeatVO seatVO) throws Exception {
		int cnt = (int) smc.delete("seat.deleteSeat", seatVO);
		return cnt;
	}

	@Override
	public int updateSeat(SqlMapClient smc, SeatVO seatVO) throws Exception {
		int cnt = (int) smc.update("seat.updateSeat", seatVO);
		return cnt;
	}

	
	
	
	
}
