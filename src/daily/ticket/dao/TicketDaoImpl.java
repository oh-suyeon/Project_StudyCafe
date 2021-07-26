package daily.ticket.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.ticket.vo.ChoiceTicketInfoVO;
import daily.ticket.vo.TicketCafeNameVO;
import daily.ticket.vo.TicketVO;

public class TicketDaoImpl implements ITicketDao{

	private static ITicketDao ticketDao;
	
	private TicketDaoImpl() {
		
	}
	
	public static ITicketDao getInstance() {
		if(ticketDao == null) {
			ticketDao = new TicketDaoImpl();
		}
		return ticketDao;
	}
	
	
	@Override
	public List<TicketVO> getAllTicketList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		List<TicketVO> ticketList = 
				smc.queryForList("ticket.getAllTicket", pagingVO);
		
		return ticketList;
	}

	@Override
	public int insertTicket(SqlMapClient smc, TicketVO tv) throws SQLException {
		
		int cnt = 0;
		
		Object obj = smc.insert("ticket.insertTicket", tv);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

	@Override
	public int getTotalCnt(SqlMapClient smc) throws SQLException {
		int cnt = (int)smc.queryForObject("ticket.getTotalCnt");
		return cnt;

	}

	@Override
	public TicketCafeNameVO getBuyTicketInfo(SqlMapClient smc, String buyTicketNo) throws Exception {
		TicketCafeNameVO ticketVO = (TicketCafeNameVO) smc.queryForObject("ticket.getBuyTicketInfo", buyTicketNo);
		return ticketVO;
	}

	@Override
	public ChoiceTicketInfoVO choiceTicketInfo(SqlMapClient smc, ChoiceTicketInfoVO infoVO) throws SQLException {
		ChoiceTicketInfoVO ticketInfoVO = (ChoiceTicketInfoVO)smc.queryForObject("ticket.choiceTicketInfo", infoVO);
		return ticketInfoVO;
	}
	
	
	
}
