package daily.seat.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import daily.common.handler.CommandHandler;
import daily.seat.service.ISeatService;
import daily.seat.service.IUserSeatService;
import daily.seat.service.SeatServiceImpl;
import daily.seat.service.UserSeatServiceImpl;
import daily.seat.vo.SeatVO;

public class UpdateSeatHandler implements CommandHandler{
	
	private ISeatService seatService = SeatServiceImpl.getInstance();
	private IUserSeatService userSeatService = UserSeatServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String flag = req.getParameter("flag") == null? "" : req.getParameter("flag");
		
		String VIEW_PAGE = "";
		
		// seatNo update 안됨
		if("saveSeatNo".equals(flag)) {
			
			String cafeSeatNo = req.getParameter("cafeSeatNo");
			String seatNo = req.getParameter("seatNo");
			
			SeatVO seatVO = new SeatVO();
			seatVO.setCafeSeatNo(cafeSeatNo);
			seatVO.setSeatNo(seatNo);
			
			int resultCnt = seatService.updateSeat(seatVO);
			
			VIEW_PAGE = req.getContextPath() + "/views/main/main.jsp";
		
		// using YN update
		}else if("usingYNUpdate".equals(flag)){
			String cafeSeatNo = req.getParameter("cafeSeatNo");
			
			int cnt = userSeatService.reservationCnt(cafeSeatNo);
			SeatVO vo = new SeatVO();
			
			if(cnt > 0) {
				vo.setCafeSeatNo(cafeSeatNo);
				vo.setSeatUsingYn("Y");
			}else {
				vo.setCafeSeatNo(cafeSeatNo);
				vo.setSeatUsingYn("N");
			}
			int c = seatService.updateSeat(vo);
		
		// usable YN update
		}else {
			
			String cafeSeatNo = req.getParameter("cafeSeatNo");
			String cafeNo = req.getParameter("cafeNo");
			String seatUsableYn = req.getParameter("seatUsableYn");

			SeatVO seatVO = new SeatVO();
			seatVO.setCafeSeatNo(cafeSeatNo);
			seatVO.setCafeNo(cafeNo);
			seatVO.setSeatUsableYn(seatUsableYn);
			
			int resultCnt = seatService.updateSeat(seatVO);
			
			String ownerId = req.getParameter("ownerId");
			VIEW_PAGE = req.getContextPath() + "/getSeatList.do?flag=result&ownerId=" + ownerId; 
		}
		
		
		return VIEW_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}

}
