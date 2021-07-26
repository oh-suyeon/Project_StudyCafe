package daily.ticket.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.ticket.vo.ChoiceTicketInfoVO;
import daily.ticket.vo.TicketCafeNameVO;
import daily.ticket.vo.TicketVO;

public interface ITicketDao{
	
	
	/**
	 * DB의 TB_BUY_TICKET테이블 전체 레코드를 가져와서 List에 담아 반환하는 메서드
	 * @param smc SqlMapCliet 객체
	 * @param pagingVO 페이징 정보를 담고 있는 객체
	 * @return TicketVO객체를 담고 있는 List객체
	 * @throws SQLException JDBC관련 예외객체
	 */
	
	public List<TicketVO> getAllTicketList(SqlMapClient smc, PagingVO pagingVO) throws SQLException;
	
	
	/**
	 * TicketVO에 담겨진 자료를 DB에 insert하는 메서드
	 * @param smc SqlMapCliet 객체
	 * @param tv DB에 insert할 자료가 저장된 티켓정보
	 * @return DB작업이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환된다.
	 * @throws SQLException JDBC관련 예외 객체
	 */
	public int insertTicket(SqlMapClient smc, TicketVO tv) throws SQLException;
	
	/**
	 * 전체 티켓 수를 알아내는 메서드
	 * @param smc SqlMapCliet 객체
	 * @return 전체 회원수
	 * @throws SQLException JDBC관련 예외 객체
	 */
	public int getTotalCnt(SqlMapClient smc) throws SQLException;
	
	/**
	 * buyTicketNo에 해당하는 결제 정보를 알아내는 메서드
	 * @param smc
	 * @param buyTicketNo
	 * @return
	 * @throws Exception
	 */
	public TicketCafeNameVO getBuyTicketInfo(SqlMapClient smc, String buyTicketNo) throws Exception;
	
	/**
	 * 이용권 최종 결제 전 결제정보를 알아내기 위한 메서드
	 * @param smc
	 * @param infoVO
	 * @return
	 * @throws SQLException
	 */
	public ChoiceTicketInfoVO choiceTicketInfo(SqlMapClient smc, ChoiceTicketInfoVO infoVO) throws SQLException;
}
