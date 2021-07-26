package daily.gsRecruit.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.common.vo.PagingVO;
import daily.gsRecruit.service.GsRecruitServiceImpl;
import daily.gsRecruit.service.IGsRecruitService;
import daily.gsRecruit.vo.GsRecruitVO;

public class GsRecruitListHandler implements CommandHandler{

	private IGsRecruitService gsRecruitService = GsRecruitServiceImpl.getInstance();
	
	private static final String VIEW_PAGE = "/views/gsRecruit/list.jsp";
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		//페이징 처리
	int pageNo = req.getParameter("pageNo") == null ? 1: Integer.parseInt(req.getParameter("pageNo"));
		
		GsRecruitVO grv = new GsRecruitVO();
	
		int totalCnt = gsRecruitService.getTotalCnt(grv);
		grv.setTotalCount(totalCnt);
		grv.setCurrentPageNo(pageNo);
		grv.setCountPerPage(10);
		grv.setPageSize(10);
		
		//2.정보 조회
		List<GsRecruitVO> gsRecruit = gsRecruitService.getAllGsRecruitList(grv); 
		
		req.setAttribute("gsRecruit", gsRecruit);  
		req.setAttribute("pagingVO", grv); //현재페이지에 관한 정보
		
		//3. 뷰페이지  전달
		
		return VIEW_PAGE;
		
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		return false;
	}

}
