package daily.seat.service;

import java.util.List;

import daily.seat.vo.SeatVO;

public interface ISeatService {
	
	
	
	/**
	 * 특정 지점의 좌석을 리스트로 가져온다
	 */
	public List<SeatVO> getSeatList(SeatVO seatVO);
	
	/**
	 * 특정 지점의 좌석을 생성한다
	 */
	public int insertSeat(SeatVO seatVO);
	
	/**
	 * 특정 지점의 좌석을 삭제한다
	 */
	public int deleteSeat(SeatVO seatVO);
	
	/**
	 * 특정 지점의 좌석의 정보(seatUsableYN)를 수정한다
	 */
	public int updateSeat(SeatVO seatVO);
	

}
