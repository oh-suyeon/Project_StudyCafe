package daily.review.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.common.vo.PagingVO;
import daily.review.service.IReviewService;
import daily.review.service.ReviewServiceImpl;
import daily.review.vo.ReviewVO;
import daily.user.vo.UserVO;

public class ListReviewHandler implements CommandHandler {

	
	private static final String VIEW_PAGE = "/views/review/list.jsp";
	
	
	private IReviewService revService = ReviewServiceImpl.getInstance();
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	//  요청 페이지 번호 가져오기
	int pageNo = req.getParameter("pageNo") == null ? 
			1 : Integer.parseInt(req.getParameter("pageNo"));
	
	PagingVO pagingVO = new PagingVO();
	
	int totalCnt = revService.getTotalCnt();
	
	pagingVO.setTotalCount(totalCnt);
	pagingVO.setCurrentPageNo(pageNo);
	pagingVO.setCountPerPage(10);
	pagingVO.setPageSize(5);

	
	// 리뷰정보 조회
	List<ReviewVO> revList = revService.getAllReviewList(pagingVO);
	
	req.setAttribute("revList", revList);
	req.setAttribute("pagingVO", pagingVO);
	
	// 리뷰 이용자 정보 저장
	
	return VIEW_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}
		
	
}
