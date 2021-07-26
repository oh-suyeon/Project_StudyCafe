package daily.ticket.service;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.ticket.vo.ChoiceTicketInfoVO;
import daily.ticket.vo.TicketCafeNameVO;
import daily.ticket.vo.TicketVO;

/**
 * Service객체는 Dao에 설정된 메서드를 원하는 작업에 맞게 호출하여
 * 결과를 받아오고, 받아온 자료를 Controller에게 보내주는 역할을 수행한다.
 * 보통 Dao의 메서드와 같은 구조를 갖는다.
 * @author SHC
 *
 */
public interface ITicketService {
	
	/**
	 * TicketVO에 담겨진 자료를 DB에 insert하는 메서드
	 * @param tv DB에 insert할 자료가 저장된 ReviewVO객체
	 * @return 등록작업이 성공하면 1이상의 값이 반환되고 실패하면 0이 반환됨. 
	 */
	public int insertTicket(TicketVO tv);
	
	
	/**
	 * 전체 티켓 목록을 조회하기 위한 메서드
	 * @return 전체 회원목록
	 */
	public List<TicketVO> getAllTicketList(PagingVO pagingVO);
	
	/**
	 * 전체 티켓정보수 조회
	 * @return 전체 회원수
	 */
	public int getTotalCnt();
	
	
	public TicketCafeNameVO getBuyTicketInfo(String buyTicketNo);
	
	/**
	 * 이용권 최종 결제 전 결제정보를 알아내기 위한 메서드
	 * @param infoVO
	 * @return
	 */
	public ChoiceTicketInfoVO choiceTicketInfo(ChoiceTicketInfoVO infoVO);
}
