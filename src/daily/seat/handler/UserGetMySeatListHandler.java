package daily.seat.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.seat.service.IUserSeatService;
import daily.seat.service.UserSeatServiceImpl;
import daily.seat.vo.UserSeatVO;
import daily.ticket.service.ITicketService;
import daily.ticket.service.TicketServiceImpl;
import daily.ticket.vo.TicketCafeNameVO;
import daily.ticket.vo.TicketVO;

public class UserGetMySeatListHandler implements CommandHandler{

	private IUserSeatService userSeatService = UserSeatServiceImpl.getInstance(); 
	private ITicketService ticketService = TicketServiceImpl.getInstance();
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		
		String flag = req.getParameter("flag")==null? "" : req.getParameter("flag");
		
		// 화면 띄우기
		if("".equals(flag)) {
			
			return req.getContextPath() + "/views/seat/userGetMySeatList.jsp";
		
		// 좌석 발권 정보를 보내기 
		}else if("resultSeatList".equals(flag)) {

			String userId = req.getParameter("userId");
			
			List<UserSeatVO> mySeatList = userSeatService.userGetMySeatList(userId);
			req.setAttribute("mySeatList", mySeatList);
			
			return req.getContextPath() + "/views/seat/userGetMySeatListResult.jsp";
			
		// 티켓 결제 정보를 보내기
		}else if("resultTicket".equals(flag)) {
			
			String buyTicketNo = req.getParameter("buyTicketNo");
			TicketCafeNameVO ticketVO = ticketService.getBuyTicketInfo(buyTicketNo);
			
			req.setAttribute("ticketVO", ticketVO);
			
			return req.getContextPath() + "/views/seat/userGetMyTicketInfoResult.jsp";
		}
		
		return null;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	
}
