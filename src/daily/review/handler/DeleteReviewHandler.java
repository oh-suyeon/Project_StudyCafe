package daily.review.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.review.service.IReviewService;
import daily.review.service.ReviewServiceImpl;

public class DeleteReviewHandler implements CommandHandler{
	
	private IReviewService revService = ReviewServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		// 1. 요청 파라미터 정보 가져오기
		String reviewNo = req.getParameter("reviewNo");
		
		
		
		// 3. 회원정보 삭제하기
		int cnt = revService.deleteReview(reviewNo);
		
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

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return true;
	}

}
