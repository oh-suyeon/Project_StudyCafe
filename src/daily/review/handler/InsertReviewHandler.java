package daily.review.handler;

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
import daily.review.service.IReviewService;
import daily.review.service.ReviewServiceImpl;
import daily.review.vo.ReviewVO;

public class InsertReviewHandler implements CommandHandler{
	private static final Logger LOGGER = 
			Logger.getLogger(InsertReviewHandler.class); 
	
	private static final String VIEW_PAGE 
						= "/views/review/insertForm.jsp";
	private IReviewService revService = 
				ReviewServiceImpl.getInstance();
	
	private IAtchFileService fileService =
			  AtchFileServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			return false; // forward
		}else if(req.getMethod().equals("POST")) {
			return true; // redirect
		}
		
		return false;
	}

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
				
				if(fileItemMap.size() > 0) { // 파일이 존재하면...
					atchFileVO = fileService.saveAtchFileList(fileItemMap);
				}
			}
			
			// 1.요청 파라미터정보 가져오기
			
			String reviewNo		 =req.getParameter("reviewNo");	 
			String userId        =req.getParameter("userId");
			String reviewTitle   =req.getParameter("reviewTitle");
			String reviewContent =req.getParameter("reviewContent");
			String reviewRegDate =req.getParameter("reviewRegDate");
			String boardCode     =req.getParameter("boardCode");
			String cafeNo        =req.getParameter("cafeNo");
			
			
			
			ReviewVO rv = new ReviewVO();
			rv.setReviewNo(reviewNo);
			rv.setUserId(userId);
			rv.setReviewTitle(reviewTitle);
			rv.setReviewContent(reviewContent);
			rv.setReviewRegDate(reviewRegDate);
			rv.setBoardCode(boardCode);
			rv.setCafeNo(cafeNo);
			
			rv.setAtchFileId(atchFileVO.getAtchFileId()); // 첨부파일 ID 저장
			
			// 3. 회원등록
			int cnt = revService.insertReview(rv);
			
			String msg = "";
			if(cnt > 0) {
				msg = "성공";
			}else {
				msg = "실패";
			}
			
	
			String redirectURL = req.getContextPath() 
					+ "/reviewList.do?msg=" + URLEncoder.encode(msg, "utf-8");
			return redirectURL;
				
		}
		
		return null;
	}
}
