package daily.notice.handler;

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

public class InsertNoticeHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/views/notice/insertNotice.jsp";
	
	private static final Logger LOGGER = Logger.getLogger(InsertNoticeHandler.class);
	private INoticeService noticeService = NoticeServiceImpl.getInstance();
	private IAtchFileService fileService = AtchFileServiceImpl.getInstance();
	
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

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("GET")) {
			String cafeNo = req.getParameter("cafeNo");
			req.setAttribute("cafeNo", cafeNo);
			return VIEW_PAGE;
			
		}else if(req.getMethod().equals("POST")) {
			
			AtchFileVO atchFileVO = new AtchFileVO();
			
			if(FileUploadRequestWrapper.hasWrapper(req)) {
				Map<String, Object> fileItemMap = ((FileUploadRequestWrapper)req).getFileItemMap();
				LOGGER.info("파일 아이템 사이즈 : " + fileItemMap.size());
				
				if(fileItemMap.size()>0) {
					atchFileVO = fileService.saveAtchFileList(fileItemMap);
				}
			}
			
			String cafeNo = req.getParameter("cafeNo");
			String noticeTitle = req.getParameter("noticeTitle");
			String noticeContent = req.getParameter("noticeContent");
			
			NoticeVO noticeVO = new NoticeVO(); 
			
			noticeVO.setCafeNo(cafeNo);
			noticeVO.setNoticeTitle(noticeTitle);
			noticeVO.setnoticeContent(noticeContent);
			noticeVO.setAtchFileId(atchFileVO.getAtchFileId());
			
			int cnt = noticeService.insertNotice(noticeVO);
		
			String msg = "";
			
			if(cnt > 0) {
				msg = "success";
			}else {
				msg = "fail";
			}
			
			String strCafeNo = "";
	
			if(cafeNo == null) {
				strCafeNo = "";
			}else {
				strCafeNo = "?cafeNo=" + cafeNo;
			}
			
			req.setAttribute(msg, "msg");
			
			String redirectURL = req.getContextPath() + "/getNoticeList.do" + strCafeNo;
			return redirectURL;
		}
		
		return null;
	}

	
}
