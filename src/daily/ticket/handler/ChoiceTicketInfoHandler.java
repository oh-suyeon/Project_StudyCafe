package daily.ticket.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.ticket.service.ITicketService;
import daily.ticket.service.TicketServiceImpl;
import daily.ticket.vo.ChoiceTicketInfoVO;

public class ChoiceTicketInfoHandler implements CommandHandler{
	
	private static final String RESULT_PAGE = "/views/ticket/ChoiceTicketInfoResult.jsp";
	private ITicketService ticketService = TicketServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String ticketType = req.getParameter("ticketType");
		String ticketPrice = req.getParameter("ticketPrice");
		
		ChoiceTicketInfoVO infoVO = new ChoiceTicketInfoVO();
		infoVO.setTicketType(ticketType);
		infoVO.setTicketPrice(ticketPrice);
		
		ChoiceTicketInfoVO ticketInfoVO = ticketService.choiceTicketInfo(infoVO);
		
		req.setAttribute("ticketInfoVO", ticketInfoVO);
		
		return req.getContextPath() + RESULT_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return false;
	}

}
