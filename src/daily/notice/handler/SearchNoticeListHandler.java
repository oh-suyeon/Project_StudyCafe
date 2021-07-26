package daily.notice.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.notice.service.INoticeService;
import daily.notice.service.NoticeServiceImpl;
import daily.notice.vo.NoticeVO;

public class SearchNoticeListHandler implements CommandHandler{
	
	INoticeService noticeService = NoticeServiceImpl.getInstance();
	private static final String VIEW_PAGE = "/views/notice/getNoticeList.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		NoticeVO noticeVO = new NoticeVO();
		
		// 카페 지점 확인
		String cafeNo = req.getParameter("cafeNo");
		noticeVO.setCafeNo(cafeNo);
		
		// 조건 확인 (제목, 내용)
		String selectSearch = req.getParameter("selectSearch");
		String inputSearch = req.getParameter("inputSearch");
		if("title".equals(selectSearch)) {
			noticeVO.setNoticeTitle(inputSearch);
		}else {
			noticeVO.setnoticeContent(inputSearch);
		}
		req.setAttribute("selectSearch", selectSearch);
		req.setAttribute("inputSearch", inputSearch);
		
		// 페이징 처리
		int pageNo = req.getParameter("pageNo") == null ? 1 : Integer.parseInt(req.getParameter("pageNo"));
		noticeVO.setCurrentPageNo(pageNo);
		noticeVO.setCountPerPage(10);
		noticeVO.setPageSize(5);
		int totalCnt = noticeService.getTotalCnt(noticeVO);
		noticeVO.setTotalCount(totalCnt);
		
		// 조건 적용한 리스트 가져오기 (페이징 처리 후에 해야 오류가 없음)
		List<NoticeVO> noticeList = new ArrayList<>();
		noticeList = noticeService.searchNoticeList(noticeVO);
		
		// 데이터 전달
		req.setAttribute("noticeList", noticeList);
		req.setAttribute("noticeVO", noticeVO);
		
		return VIEW_PAGE;
	}
	
	
	
}
