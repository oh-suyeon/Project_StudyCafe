package daily.login.service;

import daily.admin.vo.AdminVO;
import daily.common.vo.CommonVO;
import daily.owner.vo.OwnerVO;
import daily.user.vo.UserVO;

public interface ILoginService {

	/**
	 * 회원 테이블에 아이디가 존재하는 지 체크 후 정보 반환
	 * @param commonVO
	 * @return
	 */
	public UserVO loginUser (CommonVO commonVO);
	
	/**
	 * 관리자 테이블에 아이디가 존재하는 지 체크 후 정보 반환
	 * @param commonVO
	 * @return
	 */
	public AdminVO loginAdmin (CommonVO commonVO);
	
	/**
	 * 지점주 테이블에 아이디가 존재하는 지 체크 후 정보 반환
	 * @param commonVO
	 * @return
	 */
	public OwnerVO loginOwner (CommonVO commonVO);


}
