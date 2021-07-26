package daily.gsFeed.handler;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.common.filter.FileUploadRequestWrapper;
import daily.common.handler.CommandHandler;
import daily.common.service.AtchFileServiceImpl;
import daily.common.service.IAtchFileService;
import daily.common.vo.AtchFileVO;
import daily.gsFeed.service.GsFeedServiceImpl;
import daily.gsFeed.service.IGsFeedService;
import daily.gsFeed.vo.GsFeedVO;
import daily.review.handler.InsertReviewHandler;


public class GsFeedInsertHandler implements CommandHandler{

	private static final Logger LOGGER = 
			Logger.getLogger(GsFeedInsertHandler.class);
	
	private static final String VIEW_PAGE = "/views/gsFeed/gsFeedInsertForm.jsp";
	
	private IGsFeedService gsFeedService = GsFeedServiceImpl.getInstance();
	
	private IAtchFileService fileService = AtchFileServiceImpl.getInstance();
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			
			return VIEW_PAGE;
		}else if(req.getMethod().equals("POST")) {
			
			AtchFileVO atchFileVO = new AtchFileVO();
			
			// 멀티파트 처리된 래퍼객체가 맞는지 확인..
			if(FileUploadRequestWrapper.hasWrapper(req)) {
				
				Map<String, Object> fileItemMap = 
						((FileUploadRequestWrapper)req).getFileItemMap();
				
				LOGGER.info("파일 아이템 사이즈 : " + fileItemMap.size());
				
				if(fileItemMap.size() > 0) { 
					atchFileVO = fileService.saveAtchFileList(fileItemMap);
				}
			}
			
			String gsFeedTitle = req.getParameter("gsFeedTitle");
			String userId = req.getParameter("userId");
			String gsFeedContent = req.getParameter("gsFeedContent");
			
			GsFeedVO gsFeedVO = new GsFeedVO();
			
			gsFeedVO.setGsFeedTitle(gsFeedTitle);
			gsFeedVO.setUserId(userId);
			gsFeedVO.setGsFeedContent(gsFeedContent);
			
			gsFeedVO.setAtchFileId(atchFileVO.getAtchFileId());
				
			int cnt = gsFeedService.insertFd(gsFeedVO);
		
			String msg = "";
			if(cnt > 0) {
				
				msg = "성공";
			}else {
				msg = "실패";
			}
		
			String redirectURL = req.getContextPath() + "/gsFeedList.do?msg=" + URLEncoder.encode(msg, "utf-8");
			return redirectURL;
		}
		return null;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			return false;
		}else if(req.getMethod().equals("POST")) {
			return true;
		}
		return false;
	}
	

}
