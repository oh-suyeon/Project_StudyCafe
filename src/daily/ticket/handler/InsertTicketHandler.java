
package daily.ticket.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.common.handler.CommandHandler;
import daily.seat.service.IUserSeatService;
import daily.seat.service.UserSeatServiceImpl;
import daily.seat.vo.UserSeatVO;
import daily.ticket.service.ITicketService;
import daily.ticket.service.TicketServiceImpl;
import daily.ticket.vo.TicketVO;

public class InsertTicketHandler implements CommandHandler {
	private static final Logger LOGGER = Logger.getLogger(InsertTicketHandler.class); 
	
	private static final String VIEW_PAGE = "/views/ticket/ticketBuy.jsp";
	
	private ITicketService ticketService = TicketServiceImpl.getInstance();
	private IUserSeatService userSeatService = UserSeatServiceImpl.getInstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		if(req.getMethod().equals("GET")) {
			
			String cafeNo = req.getParameter("cafeNo");
			String cafeSeatNo = req.getParameter("cafeSeatNo");
			String ticketType = req.getParameter("ticketType");
			String ticketPrice = req.getParameter("ticketPrice");
			
			req.setAttribute("cafeNo", cafeNo);
			req.setAttribute("cafeSeatNo", cafeSeatNo);
			req.setAttribute("ticketType", ticketType);
			req.setAttribute("ticketPrice", ticketPrice);
			
			return VIEW_PAGE;
			
		}else if(req.getMethod().equals("POST")) {
			
		
			// 1.요청 파라미터정보 가져오기
			
			
			String ticketNo        = req.getParameter("ticketNo");
			String cafeNo          = req.getParameter("cafeNo");
			String userId          = req.getParameter("userId");
			String buyCode         = req.getParameter("buyCode");
			int buyAmount       = Integer.parseInt(req.getParameter("buyAmount"));
			String userCouponNo    = req.getParameter("userCouponNo");
			int buyCouponAmount = Integer.parseInt(req.getParameter("buyCouponAmount"));
			int buyMileage      = Integer.parseInt(req.getParameter("buyMileage"));
			int buyRealAmount   = Integer.parseInt(req.getParameter("buyRealAmount"));
			String buyRefundYn     = req.getParameter("buyRefundYn");
			String buyRefundReason = req.getParameter("buyRefundReason");
			
			if(userCouponNo.equals("null")) {
				userCouponNo="";
			};
			
			
			TicketVO tv = new TicketVO();
			
			tv.setTicketNo(ticketNo);
			tv.setCafeNo(cafeNo);
			tv.setUserId(userId);
			tv.setBuyCode(buyCode);
			tv.setBuyAmount(buyAmount);
			tv.setUserCouponNo(userCouponNo);
			tv.setBuyCouponAmount(buyCouponAmount);
			tv.setBuyMileage(buyMileage);
			tv.setBuyRealAmount(buyRealAmount);
			tv.setBuyRefundYn(buyRefundYn);
			tv.setBuyRefundReason(buyRefundReason);
			
		
			
			// 3. 회원등록
			int cnt = ticketService.insertTicket(tv);
			
			String msg = "";
			if(cnt > 0) {
				msg = "성공";
			}else {
				msg = "실패";
			}
			
			// 4. 티켓 번호를 USER_SEAT에 업데이트
			UserSeatVO userSeatVO = new UserSeatVO();
			userSeatVO = userSeatService.getUserSeatNo(userId);
			
			userSeatVO.setUserId(userId);
			cnt = userSeatService.userUpdateSeatTicketNo(userSeatVO);
			
	
//			String redirectURL = req.getContextPath() 
//					+ "/views/main/main.jsp?msg=" + URLEncoder.encode(msg, "utf-8");
			String redirectURL = req.getContextPath() 
					+ "cafeMain.do?cafeNo=" + cafeNo;
			return redirectURL;
				
		}		
		
		return null;

	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {	
			return false; // forward
		}else if(req.getMethod().equals("POST")) {
			return true; // redirect
		}
		
		return false;
	}

}
