package daily.seat.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.seat.service.IUserSeatService;
import daily.seat.service.UserSeatServiceImpl;
import daily.seat.vo.UserSeatVO;

public class UserInsertSeatHandler implements CommandHandler{
	
	private IUserSeatService userSeatService = UserSeatServiceImpl.getInstance(); 
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String cafeNo = req.getParameter("cafeNo");
		String cafeSeatNo = req.getParameter("cafeSeatNo");
		String userSeatStartDate = req.getParameter("userSeatStartDate");
		String userSeatEndDate = req.getParameter("userSeatEndDate");
		String userId = req.getParameter("userId");
//		String buyTicketNo = req.getParameter("buyTicketNo");
		
		UserSeatVO userSeatVO = new UserSeatVO();
		userSeatVO.setCafeSeatNo(cafeSeatNo);
		userSeatVO.setUserSeatStartDate(userSeatStartDate);
		userSeatVO.setUserSeatEndDate(userSeatEndDate);
		userSeatVO.setUserId(userId);
//		userSeatVO.setBuyTicketNo(buyTicketNo);
		
		int resultCnt = userSeatService.userInsertSeat01(userSeatVO);
		
		// 파라미터 보내기
		req.setAttribute("userSeatVO", userSeatVO);
		
		String ticketType = req.getParameter("ticketType");
		String ticketPrice = req.getParameter("ticketPrice");
		
		req.setAttribute("cafeNo", cafeNo);
		req.setAttribute("cafeSeatNo", cafeSeatNo);
		req.setAttribute("ticketType", ticketType);
		req.setAttribute("ticketPrice", ticketPrice);
		req.setAttribute("userId", userId);
		
		String url = req.getContextPath() + "/ticketInsert.do";
		return url;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

}
