package daily.review.handler;

import java.net.URLEncoder;
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
import daily.review.service.IReviewService;
import daily.review.service.ReviewServiceImpl;
import daily.review.vo.ReviewVO;



public class UpdateReviewHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/views/review/updateForm.jsp"; 
	
	private IReviewService revService = ReviewServiceImpl.getInstance();
	
	private IAtchFileService fileService = AtchFileServiceImpl.getInstance();
	
	private static final Logger LOGGER = Logger.getLogger(UpdateReviewHandler.class);
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equalsIgnoreCase("GET")) {
			return false; // forward
		}else if(req.getMethod().equalsIgnoreCase("POST")) {
			return true; // redirect
		}
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			
			String reviewNo = req.getParameter("reviewNo");
			
			// 2. 회원정보 조회
			ReviewVO reviewVO = revService.getReviewNo(reviewNo);
			
			// 2. 첨부파일 정보 조회
			if(reviewVO.getAtchFileId() > 0) {// 첨부파일이 존재하면...
				//2-1. 첨부파일 정보 조회
				AtchFileVO fileVO = new AtchFileVO();
				fileVO.setAtchFileId(reviewVO.getAtchFileId());
				
				List<AtchFileVO> atchFileList = fileService.getAtchFileList(fileVO);
				req.setAttribute("atchFileList", atchFileList);
			}
			
			
			
			// 3. request객체에 회원정보 저장
			req.setAttribute("reviewVO", reviewVO);
			
			return VIEW_PAGE;
			
		}else if(req.getMethod().equalsIgnoreCase("POST")) {
			
			// 기존의 첨부파일 아이디 정보가져오기
			long atchFileId = req.getParameter("atchFileId") == null ?
					-1 : Long.parseLong(req.getParameter("atchFileId"));
			
			AtchFileVO atchFileVO = new AtchFileVO();
			atchFileVO.setAtchFileId(atchFileId);
			
			// 멀티파트 처리된 래퍼객체가 맞는지 확인..
			if (FileUploadRequestWrapper.hasWrapper(req)) {

				Map<String, Object> fileItemMap = ((FileUploadRequestWrapper) req).getFileItemMap();

				LOGGER.info("파일 아이템 사이즈 : " + fileItemMap.size());

				if (fileItemMap.size() > 0) { // 파일이 존재하면...
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
			
			rv.setReviewNo(reviewNo);;
			rv.setUserId(userId);
			rv.setReviewTitle(reviewTitle);
			rv.setReviewContent(reviewContent);
			rv.setReviewRegDate(reviewRegDate);
			rv.setBoardCode(boardCode);
			rv.setCafeNo(cafeNo);
			
			rv.setAtchFileId(atchFileVO.getAtchFileId()); // 첨부파일 ID 저장
			
			
			// 3. 회원정보 수정하기
			int cnt = revService.updateReview(rv);
			
			String msg = "";
			if( cnt > 0) {
				msg = "성공";
			}else {
				msg = "실패";
			}
			
			String redirecURL = req.getContextPath() 
					+ "/reviewList.do?msg=" + URLEncoder.encode(msg, "utf-8");
			
			return redirecURL;
		}
		
		return null;
	}

}
