package daily.user.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.common.vo.PagingVO;
import daily.user.service.IUserService;
import daily.user.service.UserServiceImpl;
import daily.user.vo.UserVO;

public class listUserHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/views/user/userList.jsp";
	private IUserService userService = UserServiceImpl.getInstance();
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// 1. 요청 페이지 번호 가져오기
		int pageNo = req.getParameter("pageNo") == null ? 
				1 : Integer.parseInt(req.getParameter("pageNo"));
		
		PagingVO pagingVO = new PagingVO();
		
		int totalCnt = userService.getTotalCnt();
		
		pagingVO.setTotalCount(totalCnt);
		pagingVO.setCurrentPageNo(pageNo);
		pagingVO.setCountPerPage(10);
		pagingVO.setPageSize(5);

		
		// 2. 회원정보 조회
		List<UserVO> userList = userService.getAllUserList(pagingVO);
		
		req.setAttribute("userList", userList);
		req.setAttribute("pagingVO", pagingVO);
		
		
		return VIEW_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return false;
	}

}
