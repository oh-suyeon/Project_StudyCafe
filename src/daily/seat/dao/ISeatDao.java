package daily.seat.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.cafe.vo.CafeVO;
import daily.seat.vo.SeatVO;

public interface ISeatDao {

	/**
	 * 특정 지점의 좌석을 리스트로 가져온다
	 * @param smc
	 * @param seatVO cafeNo지점 번호, seatCode좌석 코드를 필수로 입력한다. seatUsingYn좌석 이용 가능 여부도 입력 가능하다.
	 * @return 좌석 리스트
	 * @throws Exception
	 */
	public List<SeatVO> getSeatList(SqlMapClient smc, SeatVO seatVO) throws Exception;
	
	/**
	 * 특정 지점의 좌석을 생성한다
	 * @param smc
	 * @param seatVO
	 * @return 성공 시 1, 실패 시 0
	 * @throws Exception
	 */
	public int insertSeat(SqlMapClient smc, SeatVO seatVO) throws Exception;
	
	/**
	 * 특정 지점의 좌석을 삭제한다
	 * @param smc
	 * @param seatVO cafeNo지점 번호를 필수로 입력한다. seatNo좌석 번호도 입력 가능하다.
	 * @return 성공 시 1, 실패 시 0
	 * @throws Exception
	 */
	public int deleteSeat(SqlMapClient smc, SeatVO seatVO) throws Exception;
	
	/**
	 * 특정 지점의 좌석의 정보(seatUsableYN)를 수정한다
	 * @param smc
	 * @param seatVO
	 * @return 성공 시 1, 실패 시 0
	 * @throws Exception
	 */
	public int updateSeat(SqlMapClient smc, SeatVO seatVO) throws Exception;
	
}
