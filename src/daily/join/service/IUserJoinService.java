package daily.join.service;

import daily.user.vo.UserVO;

public interface IUserJoinService {
	
	/**
	 * 주어진 회원 아이디를 이용하여 회원 존재여부 체크
	 * @param userId
	 * @return 아이디에 해당하는 회원 정보 리턴
	 */
	public UserVO checkUser(String userId);
	
	/**
	 * UserVO에 담겨진 자료를 DB에 등록하는 메서드
	 * @param userVO
	 * @return 등록작업이 성공하면 1이상의 값이 반환되고 실패하면 0이 반환됨
	 */
	public int insertUser(UserVO userVO);

	public int updateUser(UserVO userVO);
}
