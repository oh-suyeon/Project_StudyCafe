package daily.owner.service;

import java.util.List;


import daily.owner.vo.OwnerCafeInfoVO;

public interface IOwnerService {
	
	/**
	 * 관리자가 지점주 리스트 조회
	 * @param ownerCafeVO
	 * @return
	 */
	public List<OwnerCafeInfoVO> retreieveOwnerList(OwnerCafeInfoVO ownerCafeVO);
	
	/**
	 * 지점주 리스트 페이징 처리를 위한 카운트
	 * @param ownerCafeVO
	 * @return
	 */
	public int getOwnerCnt(OwnerCafeInfoVO ownerCafeVO);
	
	/**
	 * 지점주 아이디 체크
	 * @param ownerId
	 * @return
	 */
	public OwnerCafeInfoVO ownerIdCheck(String ownerId);
	
	/**
	 * 지점주 계정 등록
	 * @param ownerCafeVO
	 * @return
	 */
	public int createOwner(OwnerCafeInfoVO ownerCafeVO);
	
	/**
	 * 지점주 정보상세 조회
	 * @param ownerId
	 * @return
	 */
	public OwnerCafeInfoVO getOwner(String ownerId);

	/**
	 * 지점주 계정 삭제
	 * @param ownerId
	 * @return
	 */
	public int deleteOwner(String ownerId);
	
	/**
	 * 지점주 계정 수정
	 * @param ownerVO
	 * @return
	 */
	public int updateOwner(OwnerCafeInfoVO ownerCafeVO);
}
