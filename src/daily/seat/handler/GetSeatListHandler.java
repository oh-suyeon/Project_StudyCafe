package daily.seat.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.cafe.service.CafeServiceImpl;
import daily.cafe.service.ICafeService;
import daily.cafe.vo.CafeVO;
import daily.common.handler.CommandHandler;
import daily.seat.service.ISeatService;
import daily.seat.service.IUserSeatService;
import daily.seat.service.SeatServiceImpl;
import daily.seat.service.UserSeatServiceImpl;
import daily.seat.vo.SeatVO;

public class GetSeatListHandler implements CommandHandler{
	
	private ISeatService seatService = SeatServiceImpl.getInstance();
	private ICafeService cafeService = CafeServiceImpl.getinstance();

	private IUserSeatService userSeatService = UserSeatServiceImpl.getInstance();
	
	private static final String VIEW_PAGE = "/views/seat/getSeatListResult.jsp";

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String flag = req.getParameter("flag") == null ? "" : req.getParameter("flag");
		
		//지점주의 좌석 관리
		if("".equals(flag)) {
			// 좌석을 보여주는 뷰 페이지로 가기
			return "/views/seat/getSeatList.jsp";
			
		}else if("result".equals(flag)){
			// 뷰 페이지에서 요청한 좌석 정보를 주기
			
			// 아이디를 받아서 cafeNo를 알아낸다
			String ownerId = req.getParameter("ownerId");
			
			CafeVO cafeVO = new CafeVO();
			cafeVO = cafeService.getCafeToSeat(ownerId);
			String cafeNo = (String)cafeVO.getCafeNo();
			String seatCode = req.getParameter("seatCode");
			
			// select 쿼리에 필요한 정보를 seatVO에 담기
			// cafeNo, seatCode, seatUsingYn
			SeatVO seatVO = new SeatVO();
			seatVO.setCafeNo(cafeNo);
			seatVO.setSeatCode(seatCode);
			
			if(seatCode == null) {
				seatVO.setSeatCode("01");
			}
			
			// seatVO로 좌석 리스트를 가져온다
			List<SeatVO> seatList = new ArrayList<>();
			seatList = seatService.getSeatList(seatVO);
			
			// req에 저장
			req.setAttribute("seatVO", seatVO);
			req.setAttribute("seatList", seatList);
			
			return VIEW_PAGE;
		}
		
		return null;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

}
