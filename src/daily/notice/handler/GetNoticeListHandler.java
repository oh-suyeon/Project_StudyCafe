package daily.notice.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.cafe.service.CafeServiceImpl;
import daily.cafe.service.ICafeService;
import daily.cafe.vo.CafeRegionNameVO;
import daily.common.handler.CommandHandler;
import daily.notice.service.INoticeService;
import daily.notice.service.NoticeServiceImpl;
import daily.notice.vo.NoticeVO;

public class GetNoticeListHandler implements CommandHandler{

	private INoticeService noticeService = NoticeServiceImpl.getInstance();
	private ICafeService cafeService = CafeServiceImpl.getinstance();
	
	private String VIEW_PAGE = "/views/notice/getNoticeList.jsp";

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		
		// 카페지점 "" 또는 null이면 전체, 0 이상이면 각 지점 공지사항
		String cafeNo = req.getParameter("cafeNo");
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setCafeNo(cafeNo);
		req.setAttribute("cafeNo", cafeNo);
		
		// 카페 지점주 정보 저장
		if(cafeNo != null) {
			CafeRegionNameVO cafeVO = cafeService.retreieveCafe(cafeNo);
			String ownerId = cafeVO.getOwnerId();
			req.setAttribute("ownerId", ownerId);
		}
		
		// 페이징 처리
		
		int pageNo = req.getParameter("pageNo") == null ? 1 : Integer.parseInt(req.getParameter("pageNo"));
		int totalCnt = noticeService.getTotalCnt(noticeVO);
		noticeVO.setTotalCount(totalCnt);
		noticeVO.setCurrentPageNo(pageNo);
		noticeVO.setCountPerPage(10);
		noticeVO.setPageSize(5);
		
		// NoticeVO가 PagingVO를 상속받음. 페이징 처리 시 NoticeVO 객체를 넣어줘야 한다. 
		// 리스트를 가져오기
		List<NoticeVO> noticeList = noticeService.getNoticeList(noticeVO);
		req.setAttribute("noticeList", noticeList);
		req.setAttribute("noticeVO", noticeVO);
		

		return VIEW_PAGE;
	}
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
		
	}
	
}
