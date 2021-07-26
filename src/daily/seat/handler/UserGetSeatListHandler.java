package daily.seat.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.seat.service.ISeatService;
import daily.seat.service.IUserSeatService;
import daily.seat.service.SeatServiceImpl;
import daily.seat.service.UserSeatServiceImpl;
import daily.seat.vo.SeatVO;
import daily.seat.vo.UserSeatVO;

public class UserGetSeatListHandler implements CommandHandler{
	
	private IUserSeatService userSeatService = UserSeatServiceImpl.getInstance();
	private ISeatService seatService = SeatServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String flag = req.getParameter("flag") == null ? "" : req.getParameter("flag");
		
		if("".equals(flag)) {
			
			String cafeNo = req.getParameter("cafeNo");
			String seatCode = req.getParameter("seatCode");
			
			// 좌석 예약 시 해당 좌석의 예약 정보를 여기서 보여줄 것
			req.setAttribute("cafeNo", cafeNo);
			req.setAttribute("seatCode", seatCode);
			
			return req.getContextPath() + "/views/seat/userGetSeatList.jsp";
			
		}else if("resultSeatList".equals(flag)){
			
			// 1.해당 카페의 좌석 리스트 정보를 주기
			String cafeNo = req.getParameter("cafeNo");
			String seatCode = req.getParameter("seatCode");
			if("1".equals(seatCode)) {
				seatCode = "01";
			}else if("2".equals(seatCode)) {
				seatCode = "02";
			}
			
			SeatVO seatVO = new SeatVO();
			seatVO.setCafeNo(cafeNo);
			seatVO.setSeatCode(seatCode);
			
			if(seatCode == null) {
				seatVO.setSeatCode("01");
			}
			
			List<SeatVO> seatList = new ArrayList<>();
			seatList = seatService.getSeatList(seatVO);
			
			req.setAttribute("seatList", seatList);
			
			return req.getContextPath() + "/views/seat/userGetSeatListResult.jsp";
			
		}else if("resultSeatInfo".equals(flag)) {
			
			// 2.좌석 예약 정보를 주기
			String cafeSeatNo = req.getParameter("cafeSeatNo");
			String reservationDate = req.getParameter("reservationDate");
			
			UserSeatVO userSeatVO = new UserSeatVO();
			userSeatVO.setCafeSeatNo(cafeSeatNo);
			userSeatVO.setUserSeatStartDate(reservationDate);
			
			List<UserSeatVO> userSeatList = new ArrayList<>();
			userSeatList = userSeatService.userGetSeatList(userSeatVO);
			
			req.setAttribute("userSeatList", userSeatList);
			
			return req.getContextPath() + "/views/seat/userGetSeatInfoResult.jsp";
			
		}
		
		return null;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	
	
}
