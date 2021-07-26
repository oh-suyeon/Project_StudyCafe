package daily.seat.service;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.seat.dao.ISeatDao;
import daily.seat.dao.SeatDaoImpl;
import daily.seat.vo.SeatVO;
import daily.util.SqlMapClientFactory;

public class SeatServiceImpl implements ISeatService{

	private static ISeatService seatService;
	
	public static ISeatService getInstance() {
		if(seatService == null) {
			seatService = new SeatServiceImpl();
		}
		return seatService;
	}
	
	private ISeatDao seatDao;
	private SqlMapClient smc;
	
	private SeatServiceImpl() {
		seatDao = SeatDaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}
	
	@Override
	public List<SeatVO> getSeatList(SeatVO seatVO) {
		List<SeatVO> seatList = new ArrayList<SeatVO>();
		try {
			seatList = seatDao.getSeatList(smc, seatVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return seatList;
	}

	@Override
	public int insertSeat(SeatVO seatVO) {
		int cnt = 0;
		try {
			cnt = seatDao.insertSeat(smc, seatVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteSeat(SeatVO seatVO) {
		int cnt = 0;
		try {
			cnt = seatDao.deleteSeat(smc, seatVO);
		} catch (Exception e) {
			e.printStackTrace();
		};
		return cnt;
	}

	@Override
	public int updateSeat(SeatVO seatVO) {
		int cnt = 0;
		try {
			cnt = seatDao.updateSeat(smc, seatVO);
		} catch (Exception e) {
			e.printStackTrace();
		};
		return cnt;
	}

	
}
