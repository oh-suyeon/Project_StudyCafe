package daily.notice.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.cafe.service.CafeServiceImpl;
import daily.cafe.service.ICafeService;
import daily.cafe.vo.CafeRegionNameVO;
import daily.common.handler.CommandHandler;
import daily.common.service.AtchFileServiceImpl;
import daily.common.service.IAtchFileService;
import daily.common.vo.AtchFileVO;
import daily.notice.service.INoticeService;
import daily.notice.service.NoticeServiceImpl;
import daily.notice.vo.NoticeVO;

public class GetNoticeHandler implements CommandHandler{
	
	private INoticeService noticeService = NoticeServiceImpl.getInstance();
	private IAtchFileService fileService = AtchFileServiceImpl.getInstance();
	private ICafeService cafeService = CafeServiceImpl.getinstance();
	
	private static final String VIEW_PAGE = "/views/notice/getNotice.jsp";
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		// 글번호를 파라미터로 가져오기
		String noticeNo = req.getParameter("noticeNo");
		
		// 데이터 가져오기
		NoticeVO noticeVO = new NoticeVO();
		noticeVO = noticeService.getNotice(noticeNo);
		
		// 지점주 정보
		String cafeNo = noticeVO.getCafeNo();
		if(cafeNo != null) {
			CafeRegionNameVO cafeVO = cafeService.retreieveCafe(cafeNo);
			String ownerId = cafeVO.getOwnerId();
			req.setAttribute("ownerId", ownerId);
		}
		
		// 첨부파일 조회
		if(noticeVO.getAtchFileId() > 0) {
			AtchFileVO fileVO = new AtchFileVO();
			fileVO.setAtchFileId(noticeVO.getAtchFileId());
			
			List<AtchFileVO> atchFileList = fileService.getAtchFileList(fileVO);
			req.setAttribute("atchFileList", atchFileList);
		}
		//데이터 전달하기
		req.setAttribute("noticeVO", noticeVO);
		
		return VIEW_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}
	
	
	
}
