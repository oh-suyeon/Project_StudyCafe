package daily.gsFeed.handler;

import java.net.URLEncoder;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.filter.FileUploadRequestWrapper;
import daily.common.handler.CommandHandler;
import daily.common.service.AtchFileServiceImpl;
import daily.common.service.IAtchFileService;
import daily.common.vo.AtchFileVO;
import daily.gsFeed.service.GsFeedServiceImpl;
import daily.gsFeed.service.IGsFeedService;
import daily.gsFeed.vo.GsFeedVO;


public class GsFeedUpdateHandler implements CommandHandler{


	
	private static final String VIEW_PAGE = "/views/gsFeed/gsFeedUpdateForm.jsp";
	
	private IGsFeedService gsFeedService = GsFeedServiceImpl.getInstance();

	private IAtchFileService fileService = AtchFileServiceImpl.getInstance();
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("GET")) {
			String gsFeedNo = req.getParameter("gsFeedNo");
			
			GsFeedVO gsFeedVO = gsFeedService.getGsFeed(gsFeedNo);
			
			req.setAttribute("gsFeedVO", gsFeedVO);
			
			return VIEW_PAGE;
			
		}else if(req.getMethod().equals("POST")) {
			
			//기존의 첨부파일 아이디 정보 가져오기
			long atchFileId = req.getParameter("atchFileId") == null ? 
							-1 : Long.parseLong(req.getParameter("atchFileId"));
			
			AtchFileVO atchFileVO = new AtchFileVO();
			atchFileVO.setAtchFileId(atchFileId);
			
			// 멀티파트 처리된 래퍼객체가 맞는지 확인..
			if(FileUploadRequestWrapper.hasWrapper(req)) {
				
				Map<String, Object> fileItemMap = 
						((FileUploadRequestWrapper)req).getFileItemMap();
				
			
				if(fileItemMap.size() > 0) { // 파일이 존재하면...
					atchFileVO = fileService.saveAtchFileList(fileItemMap);
				}
			}
			String gsFeedNo = req.getParameter("gsFeedNo");
			String gsFeedTitle = req.getParameter("gsFeedTitle");
			String userId = req.getParameter("userId");
			String gsFeedContent = req.getParameter("gsFeedContent");

			GsFeedVO gsFeedVO = new GsFeedVO();
			
			gsFeedVO.setGsFeedNo(gsFeedNo);
			gsFeedVO.setGsFeedTitle(gsFeedTitle);
			gsFeedVO.setUserId(userId);
			gsFeedVO.setGsFeedContent(gsFeedContent);
			
			gsFeedVO.setAtchFileId(atchFileVO.getAtchFileId());
				
			int cnt = gsFeedService.updateFd(gsFeedVO);
		
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
