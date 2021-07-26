package daily.gsRecruit.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.gsRecruit.service.GsRecruitServiceImpl;
import daily.gsRecruit.service.IGsRecruitService;
import daily.gsRecruit.vo.GsRecruitVO;
import daily.notice.service.INoticeService;
import daily.notice.service.NoticeServiceImpl;
import daily.notice.vo.NoticeVO;

public class GsRecruitSearchHandler implements CommandHandler{
	
	IGsRecruitService gsRecruitService = GsRecruitServiceImpl.getInstance();
	private static final String VIEW_PAGE = "/views/gsRecruit/list.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		GsRecruitVO grv = new GsRecruitVO();
		
		String selectSearch = req.getParameter("selectSearch");
		String inputSearch = req.getParameter("inputSearch");
		if("title".equals(selectSearch)) {
			grv.setGsBoardTitle(inputSearch);
		}else if("leader".equals(selectSearch)){
			grv.setGsLeader(inputSearch);
		}else {
			grv.setGsBoardContent(selectSearch);
		}
		
		// 페이징 처리
		int pageNo = req.getParameter("pageNo") == null ? 1 : Integer.parseInt(req.getParameter("pageNo"));
		grv.setCurrentPageNo(pageNo);
		grv.setCountPerPage(5);
		grv.setPageSize(5);
		int totalCnt = gsRecruitService.getTotalCnt(grv);
		grv.setTotalCount(totalCnt);
		
		// 조건 적용한 리스트 가져오기 (페이징 처리 후에 해야 오류가 없음)
		List<GsRecruitVO> gsRecruitList = gsRecruitService.SearchGsRecruit(grv);
		
		req.setAttribute("gsRecruitList", gsRecruitList);
		req.setAttribute("noticeVO", grv);
		
		return VIEW_PAGE;
	}
	
	
	
}
