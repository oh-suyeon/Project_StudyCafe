package daily.user.service;

import java.util.List;

import daily.common.vo.PagingVO;
import daily.review.vo.ReviewVO;
import daily.user.vo.BlacklistVO;
import daily.user.vo.UserVO;

public interface IUserService {
	/**
	 * 회원정보 수정하기
	 * @return
	 * @throws Exception
	 */
	public int updateUser(UserVO userVO);
	
	
	/**
	 * 주어진 회원ID에 해당하는 회원정보를 조회하는 메서드
	 * @param userId 검색할 회원ID
	 * @return 해당ID에 해당하는 회원정보
	 */
	public UserVO getUser(String userId);
	
	
	/**
	 * 전체 회원 목록을 조회하기 위한 메서드
	 * @return 전체 회원목록
	 */
	public List<UserVO> getAllUserList(PagingVO pagingVO);
	
	/**
	 * 전체 회원수 조회
	 * @return 전체 회원수
	 */
	public int getTotalCnt();
	
	
	/**
	 * 주어진 회원ID에 해당하는 회원정보를 조회하는 메서드
	 * @param userId 검색할 회원ID
	 * @return 해당ID에 해당하는 회원정보
	 */
	public UserVO getUserid(String userId);
	
	/**
	 * BlacklistVO에 담겨진 자료를 DB에 insert하는 메서드
	 * @param bv DB에 insert할 자료가 저장된 ReviewVO객체
	 * @return 등록작업이 성공하면 1이상의 값이 반환되고 실패하면 0이 반환됨. 
	 */
	public int insertBlacklist(BlacklistVO bv);
	
	
	/**
	 * 회원 ID를 매개변수로 받아서 그 회원정보를 삭제하는 메서드
	 * @param userId 삭제할 회원ID
	 * @return 작업성공: 1, 작업실패: 0
	 */
	public int deleteBlacklist(String userId);
	
	
	/**
	 * 주어진 회원아이드를 이용하여 회원존재여부 체크
	 * @param userId
	 * @return 회원존재시 true, 존재하지 않으면 false
	 */
	public boolean checkBlacklist(String userId);
	
}



