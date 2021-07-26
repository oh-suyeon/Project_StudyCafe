package daily.cafe.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.cafe.service.CafeServiceImpl;
import daily.cafe.service.ICafeService;
import daily.cafe.vo.CafeIntroduceVO;
import daily.cafe.vo.CafeRegionNameVO;
import daily.common.handler.CommandHandler;
import daily.seat.service.ISeatService;
import daily.seat.service.SeatServiceImpl;
import daily.seat.vo.SeatVO;

public class CafeMainHandler implements CommandHandler{
	
	private static final String CAFE_MAIN_VIEW = "/views/cafe/cafeMain.jsp";
	
	private ICafeService cafeService = CafeServiceImpl.getinstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String cafeNo = req.getParameter("cafeNo");
		
		CafeRegionNameVO cafeVO = cafeService.retreieveCafe(cafeNo);
		CafeIntroduceVO introduceVO = cafeService.cafeIntroduce(cafeNo);
		
		req.setAttribute("cafeVO", cafeVO);
		req.setAttribute("introduceVO", introduceVO);
		
		return CAFE_MAIN_VIEW;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

}
