package daily.seat.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.seat.vo.UserSeatVO;

public interface IUserSeatDao {
	
	/**
	 * 선택한 좌석의 예약 내역 불러오기
	 * @param smc
	 * @param cafeSeatNo
	 * @return
	 * @throws Exception
	 */
	public List<UserSeatVO> userGetSeatList(SqlMapClient smc, UserSeatVO userSeatVO) throws Exception;

	/**
	 * 나의 예약 내역 불러오기
	 * @param smc
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<UserSeatVO> userGetMySeatList(SqlMapClient smc, String userId) throws Exception;
	
	/**
	 * 나의 진행 중인 예약 정보 불러오기
	 * @param smc
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public UserSeatVO userGetMySeat(SqlMapClient smc, String userId) throws Exception;
	
	/**
	 * 예약 추가 - 개인석 
	 * @param smc
	 * @param userSeatVO
	 * @return
	 * @throws Exception
	 */
	public int userInsertSeat01(SqlMapClient smc, UserSeatVO userSeatVO) throws Exception;
	
	/**
	 * 예약 추가 - 스터디룸 
	 * @param smc
	 * @param userSeatVO
	 * @return
	 * @throws Exception
	 */
	public int userInsertSeat02(SqlMapClient smc, UserSeatVO userSeatVO) throws Exception;
	
	/**
	 * 예약 추가 - 예약 정보 수정 
	 * @param smc
	 * @param userSeatVO
	 * @return
	 * @throws Exception
	 */
	public int userUpdateSeat(SqlMapClient smc, UserSeatVO userSeatVO) throws Exception;

	/**
	 * 이용권 결제 번호를 추가
	 * @param smc
	 * @param userSeatVO
	 * @return
	 * @throws Exception
	 */
	public int userUpdateSeatTicketNo(SqlMapClient smc, UserSeatVO userSeatVO) throws Exception;
	
	/**
	 * 유저 아이디를 넣어, 최근 발권한 기록의 userSeatNo 찾음
	 * @param smc
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public UserSeatVO getUserSeatNo(SqlMapClient smc, String userId) throws Exception;
	
	
	/**
	 * 예약 정보 삭제 
	 * @param smc
	 * @param userSeatNo
	 * @return
	 * @throws Exception
	 */
	public int userDeleteSeat(SqlMapClient smc, String userSeatNo) throws Exception;
	
	
	/**
	 * 현재 시간 이후의 예약이 존재하는지 확인
	 * @param smc
	 * @return
	 * @throws Exception
	 */
	public int reservationCnt(SqlMapClient smc, String cafeSeatNo) throws Exception;
	
}
