package daily.ticket.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.ticket.dao.ITicketDao;
import daily.ticket.dao.TicketDaoImpl;
import daily.ticket.vo.ChoiceTicketInfoVO;
import daily.ticket.vo.TicketCafeNameVO;
import daily.ticket.vo.TicketVO;
import daily.util.SqlMapClientFactory;

public class TicketServiceImpl implements ITicketService{

	
	private ITicketDao ticketDao;
	
	
	private static ITicketService ticketService;
	
	private SqlMapClient smc;
	
	private TicketServiceImpl() {
		ticketDao = TicketDaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}
	public static ITicketService getInstance() {
		
		if(ticketService == null) {
			ticketService = new TicketServiceImpl();
		}
		
		return ticketService;
	}

	@Override
	public int insertTicket(TicketVO tv) {
		int cnt = 0;
		try {
			cnt = ticketDao.insertTicket(smc, tv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	@Override
	public List<TicketVO> getAllTicketList(PagingVO pagingVO) {
		
		List<TicketVO> ticketList = new ArrayList<TicketVO>();
		
		try {
			ticketList = ticketDao.getAllTicketList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ticketList;
		
	}
	@Override
	public int getTotalCnt() {
		int cnt = 0;
		
		try {
			cnt = ticketDao.getTotalCnt(smc);
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
				
		return cnt;
	}
	@Override
	public TicketCafeNameVO getBuyTicketInfo(String buyTicketNo) {
		
		TicketCafeNameVO ticketVO = new TicketCafeNameVO();
		
		try {
			ticketVO = ticketDao.getBuyTicketInfo(smc, buyTicketNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ticketVO;
	}
	@Override
	public ChoiceTicketInfoVO choiceTicketInfo(ChoiceTicketInfoVO infoVO) {
		ChoiceTicketInfoVO ticketInfoVO = null;
		
		try {
			ticketInfoVO = ticketDao.choiceTicketInfo(smc, infoVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ticketInfoVO;
	}
	
	
	
	
}
