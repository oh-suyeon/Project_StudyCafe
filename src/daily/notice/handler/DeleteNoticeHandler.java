package daily.notice.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.notice.service.INoticeService;
import daily.notice.service.NoticeServiceImpl;
import daily.notice.vo.NoticeVO;

public class DeleteNoticeHandler implements CommandHandler{

	INoticeService noticeService = NoticeServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String noticeNo = req.getParameter("noticeNo");
		
		NoticeVO noticeVO = new NoticeVO();
		noticeVO = noticeService.getNotice(noticeNo);
		
		String strCafeNo = "";
		

		if(noticeVO.getCafeNo() == null) {
			strCafeNo = "";
		}else {
			strCafeNo = "?cafeNo=" + noticeVO.getCafeNo();
		}

		int cnt = noticeService.deleteNotice(noticeNo);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "success";
		}else {
			msg = "false";
		}
		
		req.setAttribute(msg, "msg");
		
		String redirectURL = req.getContextPath() + "/getNoticeList.do" + strCafeNo; 
		
		return redirectURL;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}

}
