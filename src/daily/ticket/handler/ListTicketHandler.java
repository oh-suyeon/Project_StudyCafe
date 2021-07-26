package daily.ticket.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.common.vo.PagingVO;
import daily.ticket.service.ITicketService;
import daily.ticket.service.TicketServiceImpl;
import daily.ticket.vo.TicketVO;
import daily.user.service.IUserService;
import daily.user.service.UserServiceImpl;
import daily.user.vo.UserVO;

public class ListTicketHandler implements CommandHandler{//수정중★★★★★★★★★★★★★★★★★★★★★★
	private static final String VIEW_PAGE = "/views/ticket/ticketList.jsp";
	
	private ITicketService ticketService = TicketServiceImpl.getInstance();
	private IUserService userService = UserServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// 1. 요청 페이지 번호 가져오기
		int pageNo = req.getParameter("pageNo") == null ? 
				1 : Integer.parseInt(req.getParameter("pageNo"));
		
		PagingVO pagingVO = new PagingVO();
		
		int totalCnt = ticketService.getTotalCnt();
		
		pagingVO.setTotalCount(totalCnt);
		pagingVO.setCurrentPageNo(pageNo);
		pagingVO.setCountPerPage(5);
		pagingVO.setPageSize(5);

		
		// 2. 회원정보 조회
		List<TicketVO> ticketList = ticketService.getAllTicketList(pagingVO);
		List<UserVO> userList = userService.getAllUserList(pagingVO);
		
		req.setAttribute("ticketList", ticketList);
		req.setAttribute("userList", userList);
		req.setAttribute("pagingVO", pagingVO);
		
		
		return VIEW_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

}
