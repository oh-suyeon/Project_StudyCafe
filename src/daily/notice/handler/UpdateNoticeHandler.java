package daily.notice.handler;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.common.filter.FileUploadRequestWrapper;
import daily.common.handler.CommandHandler;
import daily.common.service.AtchFileServiceImpl;
import daily.common.service.IAtchFileService;
import daily.common.vo.AtchFileVO;
import daily.notice.service.INoticeService;
import daily.notice.service.NoticeServiceImpl;
import daily.notice.vo.NoticeVO;

public class UpdateNoticeHandler implements CommandHandler{

	private static final String VIEW_PAGE = "/views/notice/updateNotice.jsp";
	private static final Logger LOGGER = Logger.getLogger(InsertNoticeHandler.class);
	
	private INoticeService noticeService = NoticeServiceImpl.getInstance();
	private IAtchFileService fileService = AtchFileServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {

		boolean flag = false;
		
		if(req.getMethod().equals("GET")) {
			flag = false;
		}else if(req.getMethod().equals("POST")) {
			flag = true;
		}
		
		return flag;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("GET")) {
			
			String noticeNo = req.getParameter("noticeNo");
			NoticeVO noticeVO = new NoticeVO();
			noticeVO = noticeService.getNotice(noticeNo);
			
			// 첨부파일
			if(noticeVO.getAtchFileId() > 0) {
				AtchFileVO fileVO = new AtchFileVO();
				fileVO.setAtchFileId(noticeVO.getAtchFileId());
				
				List<AtchFileVO> atchFileList = fileService.getAtchFileList(fileVO);
				
				req.setAttribute("atchFileList", atchFileList);
			}
			
			req.setAttribute("noticeVO", noticeVO);
			
			return VIEW_PAGE;
			
		}else if(req.getMethod().equals("POST")) {
			
			// 파일 처리
			long atchFileId = req.getParameter("atchFileId") == null ? -1 : Long.parseLong(req.getParameter("atchFileId"));
			
			AtchFileVO atchFileVO = new AtchFileVO();
			atchFileVO.setAtchFileId(atchFileId);
			
			if(FileUploadRequestWrapper.hasWrapper(req)) {
				Map<String, Object> fileItemMap = ((FileUploadRequestWrapper)req).getFileItemMap();
				LOGGER.info("파일 아이템 사이즈 : " + fileItemMap.size());
				
				if(fileItemMap.size() > 0) {
					atchFileVO = fileService.saveAtchFileList(fileItemMap);
				}
			}
			
			String noticeNo = req.getParameter("noticeNo");
			String noticeTitle = req.getParameter("noticeTitle");
			String noticeContent = req.getParameter("noticeContent");
			
			NoticeVO noticeVO = new NoticeVO();
			noticeVO.setNoticeNo(noticeNo);
			noticeVO.setNoticeTitle(noticeTitle);
			noticeVO.setnoticeContent(noticeContent);
			noticeVO.setAtchFileId(atchFileVO.getAtchFileId());
			
			int cnt = noticeService.updateNotice(noticeVO);
			
			String msg = "";
			
			if(cnt > 0) {
				msg = "success";
			}else {
				msg = "fail";
			}
			
			String strCafeNo = "";
			
			if(noticeVO.getCafeNo() == null) {
				strCafeNo = "";
			}else {
				strCafeNo = "?cafeNo=" + noticeVO.getCafeNo();
			}
			
			req.setAttribute(msg, "msg");
			
			String redirectURL = req.getContextPath() + "/getNotice.do?noticeNo=" + noticeNo; 
			return redirectURL;
			
		}
		
		return null;
	}

	
	
}
