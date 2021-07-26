package daily.cafe.service;

import java.sql.SQLException;
import java.util.List;

import daily.cafe.vo.CafeIntroduceVO;
import daily.cafe.vo.CafeRegionNameVO;
import daily.cafe.vo.CafeVO;
import daily.owner.vo.OwnerVO;

public interface ICafeService {
	
	/**
	 * 데일리 지점찾기&예약 페이지의 카페 지점 리스트 조회
	 * @param cafeVO 지역, 지점명, 주소 등 검색 파라미터로 활용
	 * @return 검색 지점 수
	 */
	public List<CafeRegionNameVO> retreieveCafeList(CafeRegionNameVO cafeVO);
	
	/**
	 * 전체 또는 검색 지점 조회수
	 * @return 전체 또는 검색 지점수
	 */
	public int getCafeCnt(CafeRegionNameVO cafeVO);
	
	/**
	 * 해당 카페지점 정보를 조회
	 * @param cafeNo
	 * @return
	 */
	public CafeRegionNameVO retreieveCafe(String cafeNo);
	
	/**
	 * 해당 카페지점 소개정보를 조회
	 * @param cafeNo
	 * @return
	 */
	public CafeIntroduceVO cafeIntroduce(String cafeNo);
	
	/**
	 * 카페지점 생성
	 * @param cafeVO
	 * @return
	 */
	public int createCafe(CafeVO cafeVO);
	
	/**
	 * 카페지점 등록시 지점주 아이디를 찾기위해 지점주 아이디 리스트 조회
	 * @param smc
	 * @return
	 * @throws SQLException
	 */
	public List<OwnerVO> retreieveOwnerList();
	
	/**
	 * 카페 지점 수정
	 * @param cafeVO
	 * @return
	 */
	public int updateCafe(CafeVO cafeVO);
	
	/**
	 * 카페 지점 삭제
	 * @param cafeNo
	 * @return
	 */
	public int deleteCafe(String cafeNo);
	
	
	
	/**
	 * 지점주의 아이디로 소유한 지점 번호를 알아낸다
	 */
	public CafeVO getCafeToSeat (String ownerId);
}
