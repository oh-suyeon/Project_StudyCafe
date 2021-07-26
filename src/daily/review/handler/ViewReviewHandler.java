package daily.review.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.common.service.AtchFileServiceImpl;
import daily.common.service.IAtchFileService;
import daily.common.vo.AtchFileVO;
import daily.review.service.IReviewService;
import daily.review.service.ReviewServiceImpl;
import daily.review.vo.ReviewVO;

public class ViewReviewHandler implements CommandHandler{
	
	private static final String VIEW_PAGE="/views/review/select.jsp";
	
	private IReviewService revService = ReviewServiceImpl.getInstance();
	
	private IAtchFileService fileService = AtchFileServiceImpl.getInstance();
						 				   
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userId = req.getParameter("userId");
		
		
		//1. 회원정보 조회
		ReviewVO reviewVO = revService.getReview(userId);
		
		
		// 2. 첨부파일 정보 조회
		if(reviewVO.getAtchFileId() > 0) {// 첨부파일이 존재하면...
			//2=1. 첨부파일 정보 조회
			AtchFileVO fileVO = new AtchFileVO();
			fileVO.setAtchFileId(reviewVO.getAtchFileId());
			
			List<AtchFileVO> atchFileList = fileService.getAtchFileList(fileVO);
			req.setAttribute("atchFileList", atchFileList);
		}
		
		
		// 3. 결과 정보 담기
		req.setAttribute("reviewVO", reviewVO);
		
		
		return VIEW_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

}
