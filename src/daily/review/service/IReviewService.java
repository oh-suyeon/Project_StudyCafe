package daily.review.service;

import java.util.List;

import daily.common.vo.PagingVO;
import daily.review.vo.ReviewVO;

/**
 * Service객체는 Dao에 설정된 메서드를 원하는 작업에 맞게 호출하여
 * 결과를 받아오고, 받아온 자료를 Controller에게 보내주는 역할을 수행한다.
 * 보통 Dao의 메서드와 같은 구조를 갖는다.
 * @author SHC
 *
 */
public interface IReviewService {
	/**
	 * ReviewVO에 담겨진 자료를 DB에 insert하는 메서드
	 * @param rv DB에 insert할 자료가 저장된 ReviewVO객체
	 * @return 등록작업이 성공하면 1이상의 값이 반환되고 실패하면 0이 반환됨. 
	 */
	public int insertReview(ReviewVO rv);
	
	
	/**
	 * 회원 ID를 매개변수로 받아서 그 회원정보를 삭제하는 메서드
	 * @param reviewNo 삭제할 회원ID
	 * @return 작업성공: 1, 작업실패: 0
	 */
	public int deleteReview(String reviewNo);
	
	/**
	 * 회원정보를 수정하기 위한 메서드
	 * @param rv 수정할 회원정보
	 * @return 작업성공 : 1 , 작업실패:0
	 */
	public int updateReview(ReviewVO rv);
	
	/**
	 * 전체 회원 목록을 조회하기 위한 메서드
	 * @return 전체 회원목록
	 */
	public List<ReviewVO> getAllReviewList(PagingVO pagingVO);
	
	/**
	 * 전체 회원수 조회
	 * @return 전체 회원수
	 */
	public int getTotalCnt();

	/**
	 * 주어진 회원아이드를 이용하여 회원존재여부 체크
	 * @param userId
	 * @return 회원존재시 true, 존재하지 않으면 false
	 */
	public boolean checkReview(String userId);
	
	/**
	 * 회원정보를 검색하기 위한 메서드
	 * @param rv 검색할 데이터를 담은 VO객체
	 * @return 검색된 결과를 담은 List 객체
	 */
	public List<ReviewVO> getSearchReview(ReviewVO rv);
	
	
	/**
	 * 주어진 회원ID에 해당하는 회원정보를 조회하는 메서드
	 * @param userId 검색할 회원ID
	 * @return 해당ID에 해당하는 회원정보
	 */
	public ReviewVO getReview(String userId);
	
	/**
	 * 주어진 제목에 해당하는 정보를 조회하는 메서드
	 * @param reviewTitle 검색할 회원ID
	 * @return 해당ID에 해당하는 회원정보
	 */
	public ReviewVO getReview2(String reviewTitle);
	
	
	/**
	 * 주어진 제목에 해당하는 정보를 조회하는 메서드
	 * @param reviewNo 검색할 회원ID
	 * @return 해당ID에 해당하는 회원정보
	 */
	public ReviewVO getReviewNo(String reviewNo);
}
