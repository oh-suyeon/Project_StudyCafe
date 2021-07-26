package daily.user.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.review.vo.ReviewVO;
import daily.user.vo.BlacklistVO;
import daily.user.vo.UserVO;

public interface IUserDao {
	
	
	/**
	 * 회원정보 수정하기
	 * @return
	 * @throws Exception
	 */
	public int updateUser(SqlMapClient smc, UserVO userVO) throws Exception;
	
	
	
	
	/**
	 * 주어진 회원ID에 해당하는 회원정보를 알아내는 메서드
	 * @param smc SqlMapCliet 객체
	 * @param userId 검색할 회원ID
	 * @return 회원정보를 담은 userVO객체
	 * @throws SQLException JDBC관련 예외 객체
	 */
	public UserVO getUser(SqlMapClient smc, String userId) throws SQLException;
	
	
	/**
	 * DB의 TB_USER테이블 전체 레코드를 가져와서 List에 담아 반환하는 메서드
	 * @param smc SqlMapCliet 객체
	 * @param pagingVO 페이징 정보를 담고 있는 객체
	 * @return UserVO객체를 담고 있는 List객체
	 * @throws SQLException JDBC관련 예외객체
	 */
	public List<UserVO> getAllUserList(SqlMapClient smc, PagingVO pagingVO) throws SQLException;
	
	/**
	 * 전체 회원수를 알아내는 메서드
	 * @param smc SqlMapCliet 객체
	 * @return 전체 회원수
	 * @throws SQLException JDBC관련 예외 객체
	 */
	public int getTotalCnt(SqlMapClient smc) throws SQLException;
	
	
	/**
	 * 주어진 회원ID에 해당하는 회원정보를 알아내는 메서드
	 * @param smc SqlMapCliet 객체
	 * @param userId 검색할 회원ID
	 * @return 회원정보를 담은 UserVO객체
	 * @throws SQLException JDBC관련 예외 객체
	 */
	public UserVO getUserid(SqlMapClient smc, String userId) throws SQLException;
	
	/**
	 * BlacklistVO에 담겨진 자료를 DB에 insert하는 메서드
	 * @param smc SqlMapCliet 객체
	 * @param bv DB에 insert할 자료가 저장된 회원정보
	 * @return DB작업이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환된다.
	 * @throws SQLException JDBC관련 예외 객체
	 */
	public int insertBlacklist(SqlMapClient smc, BlacklistVO bv) throws SQLException;
	
	
	/**
	 * 회원ID를 매개변수로 받아서 그 회원정보를 삭제하는 메서드
	 * @param smc SqlMapCliet 객체
	 * @param userId 삭제할 회원ID
	 * @return 작업 성공: 1, 작업 실패: 0
	 * @throws SQLException JDBC관련 예외객체
	 */
	public int deleteBlacklist(SqlMapClient smc, String userId) throws SQLException;
	
	
	/**
	 * 블랙리스트 회원ID가 존재하는지 여부를 알아내는 메서드
	 * @param smc SqlMapCliet 객체
	 * @param userId 검색할 회원ID
	 * @return 해당 회원ID가 있으면 true, 없으면 false
	 * @throws SQLException JDBC관련 예외 객체
	 */
	public boolean checkBlacklist(SqlMapClient smc, String userId) throws SQLException;
	
}


