package daily.review.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.review.vo.ReviewVO;

/**
 * 실제 DB와 연결해서 SQL문을 수행한 결과를 작성하여
 * Service에 전달하는 DAO의 Interface
 * @author SEM
 */
public interface IReviewDao {
	
	
		/**
		 * ReviewVO에 담겨진 자료를 DB에 insert하는 메서드
		 * @param smc SqlMapCliet 객체
		 * @param rv DB에 insert할 자료가 저장된 회원정보
		 * @return DB작업이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환된다.
		 * @throws SQLException JDBC관련 예외 객체
		 */
		public int insertReview(SqlMapClient smc, ReviewVO rv) throws SQLException;
		
		/**
		 * 주어진 회원ID가 존재하는지 여부를 알아내는 메서드
		 * @param smc SqlMapCliet 객체
		 * @param userId 검색할 회원ID
		 * @return 해당 회원ID가 있으면 true, 없으면 false
		 * @throws SQLException JDBC관련 예외 객체
		 */
		public boolean checkReview(SqlMapClient smc, String userId) throws SQLException;

		/**
		 * 전체 회원수를 알아내는 메서드
		 * @param smc SqlMapCliet 객체
		 * @return 전체 회원수
		 * @throws SQLException JDBC관련 예외 객체
		 */
		public int getTotalCnt(SqlMapClient smc) throws SQLException;
		
		/**
		 * DB의 TB_CAFE_REVIEW테이블 전체 레코드를 가져와서 List에 담아 반환하는 메서드
		 * @param smc SqlMapCliet 객체
		 * @param pagingVO 페이징 정보를 담고 있는 객체
		 * @return ReviewVO객체를 담고 있는 List객체
		 * @throws SQLException JDBC관련 예외객체
		 */
		public List<ReviewVO> getAllReviewList(SqlMapClient smc, PagingVO pagingVO) throws SQLException;
		
		/**
		 * 하나의 회원자료를 DB에 update하는 메서드
		 * @param smc SqlMapCliet 객체
		 * @param rv update할 회원 정보가 들어있는 ReviewVO객체
		 * @return 작업 성공: 1, 작업 실패: 0
		 * @throws SQLException JDBC관련 예외객체
		 */
		public int updateReview(SqlMapClient smc, ReviewVO rv) throws SQLException;
		
		/**
		 * 회원ID를 매개변수로 받아서 그 회원정보를 삭제하는 메서드
		 * @param smc SqlMapCliet 객체
		 * @param userId 삭제할 회원ID
		 * @return 작업 성공: 1, 작업 실패: 0
		 * @throws SQLException JDBC관련 예외객체
		 */
		public int deleteReview(SqlMapClient smc, String userId) throws SQLException;
		
		/**
		 * 회원정보를 검색하기 위한 메서드
		 * @param smc SqlMapCliet 객체
		 * @param rv 검색할 회원 정보
		 * @return 검색된 회원정보를 담은 List객체
		 * @throws SQLException JDBC관련 예외객체 
		 */
		public List<ReviewVO> getSearchReview(SqlMapClient smc, ReviewVO rv) throws SQLException;
		
		
		/**
		 * 주어진 회원ID에 해당하는 회원정보를 알아내는 메서드
		 * @param smc SqlMapCliet 객체
		 * @param userId 검색할 회원ID
		 * @return 회원정보를 담은 ReviewVO객체
		 * @throws SQLException JDBC관련 예외 객체
		 */
		public ReviewVO getReview(SqlMapClient smc, String userId) throws SQLException;
		
		/**
		 * 주어진 회원ID에 해당하는 회원정보를 알아내는 메서드
		 * @param smc SqlMapCliet 객체
		 * @param reviewTitle 검색할 제목
		 * @return 회원정보를 담은 ReviewVO객체
		 * @throws SQLException JDBC관련 예외 객체
		 */
		public ReviewVO getReview2(SqlMapClient smc, String reviewTitle) throws SQLException;
		
		/**
		 * 주어진 회원ID에 해당하는 회원정보를 알아내는 메서드
		 * @param smc SqlMapCliet 객체
		 * @param userId 검색할 회원ID
		 * @return 회원정보를 담은 ReviewVO객체
		 * @throws SQLException JDBC관련 예외 객체
		 */
		public ReviewVO getReviewNo(SqlMapClient smc, String reviewNo) throws SQLException;
		
}
