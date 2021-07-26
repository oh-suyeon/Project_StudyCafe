package daily.seat.service;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.seat.vo.UserSeatVO;

public interface IUserSeatService {
	/**
	 * 선택한 좌석의 예약 내역 불러오기
	 */
	public List<UserSeatVO> userGetSeatList(UserSeatVO userSeatVO);

	/**
	 * 나의 예약 내역 불러오기
	 */
	public List<UserSeatVO> userGetMySeatList(String userId);
	
	/**
	 * 나의 진행 중인 예약 정보 불러오기
	 */
	public UserSeatVO userGetMySeat(String userId);
	
	/**
	 * 예약 추가 - 개인석 
	 */
	public int userInsertSeat01(UserSeatVO userSeatVO);
	
	/**
	 * 예약 추가 - 스터디룸 
	 */
	public int userInsertSeat02(UserSeatVO userSeatVO);
	
	/**
	 * 예약 추가 - 예약 정보 수정 
	 */
	public int userUpdateSeat(UserSeatVO userSeatVO);
	
	/**
	 * 이용권 결제 번호를 추가
	 */
	public int userUpdateSeatTicketNo(UserSeatVO userSeatVO);
	
	/**
	 * 유저 아이디를 넣어, 최근 발권한 기록의 userSeatNo 찾음
	 */
	public UserSeatVO getUserSeatNo(String userId);

	/**
	 * 예약 정보 삭제 
	 */
	public int userDeleteSeat(String userSeatNo);
	
	/**
	 * 현재 시간 이후의 예약이 존재하는지 확인
	 */
	public int reservationCnt(String cafeSeatNo);
}
