package daily.login.service;

import java.util.List;

import daily.user.vo.UserVO;

public interface ISearchIdService {
	
	/**
	 * 이름과 이메일 정보로 아이디 찾기
	 * @param userName
	 * @param userEmail
	 * @return
	 */
	public List<UserVO> searchId(UserVO userVO);

	/**
	 * 아이디와 이메일 정보로 비밀번호 찾기
	 * @param userVO
	 * @return
	 */
	public UserVO selectIdEmail(String userId);

	/**
	 * 아이디에 해당하는 비밀번호 난수로 바꾸기
	 * @param userVO
	 * @return
	 */
	public int updatePw(UserVO userVO);

}
