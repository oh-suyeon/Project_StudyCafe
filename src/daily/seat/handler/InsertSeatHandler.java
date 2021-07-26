package daily.seat.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import daily.common.handler.CommandHandler;
import daily.seat.service.ISeatService;
import daily.seat.service.SeatServiceImpl;
import daily.seat.vo.SeatVO;

public class InsertSeatHandler implements CommandHandler{

	private static final String VIEW_PAGE = "";
	
	private ISeatService seatService = SeatServiceImpl.getInstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("GET")) {
		
			SeatVO seatVO = new SeatVO();
			String cafeNo = req.getParameter("cafeNo");
			String seatCode = req.getParameter("seatCode");
			
			seatVO.setCafeNo(cafeNo);
			seatVO.setSeatCode(seatCode);

			List<SeatVO> seatList = seatService.getSeatList(seatVO);
			
			req.setAttribute("seatList", seatList);
			
			return VIEW_PAGE;
			
		}else if(req.getMethod().equals("POST")) {
			
			// 좌석의 초기상태는 seatUsableYn가 모두 N
			// post로 온 좌석 정보를 받아 updateSeat으로 YN을 바꿔준다. 
			// Y를 선택하면 N로, N을 선택하면 Y로 변경
			String cafeSeatNo = req.getParameter("cafeSeatNo");
			String seatUsableYn = req.getParameter("seatUsableYn");
			
			SeatVO seatVO = new SeatVO();
			seatVO.setCafeSeatNo(cafeSeatNo);
			seatVO.setSeatUsableYn(seatUsableYn);
			
			int resultCnt = seatService.updateSeat(seatVO);
			
			return null;
			
		}
		
		return null;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		boolean flag = false;
		
		if(req.getMethod().equals("GET")) {
			flag = false;
		}else if(req.getMethod().equals("POST")){
			flag = true;
		}
		return flag;
	}
	
	
	
}
