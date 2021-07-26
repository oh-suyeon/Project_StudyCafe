package daily.gsFeed.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;
import daily.common.service.AtchFileServiceImpl;
import daily.common.service.IAtchFileService;
import daily.common.vo.AtchFileVO;
import daily.common.vo.PagingVO;
import daily.gsFeed.service.GsFeedServiceImpl;
import daily.gsFeed.service.IGsFeedService;
import daily.gsFeed.vo.GsFeedVO;
import daily.gsRecruit.service.GsRecruitServiceImpl;
import daily.gsRecruit.service.IGsRecruitService;
import daily.gsRecruit.vo.GsRecruitVO;

public class GsFeedListHandler implements CommandHandler{

	private IGsFeedService gsFeedService = GsFeedServiceImpl.getInstance();
	
	private static final String VIEW_PAGE = "/views/gsFeed/gsFeedList.jsp";
	
	private IAtchFileService atchFileService = AtchFileServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		//페이징 처리
	int pageNo = req.getParameter("pageNo") == null ? 1: Integer.parseInt(req.getParameter("pageNo"));
		
		GsFeedVO gsFeedVO = new GsFeedVO();
	
		int totalCnt = gsFeedService.getTotalCnt(gsFeedVO);
		gsFeedVO.setTotalCount(totalCnt);
		gsFeedVO.setCurrentPageNo(pageNo);
		gsFeedVO.setCountPerPage(5);
		gsFeedVO.setPageSize(5);
		
		//2.정보 조회
		List<GsFeedVO> gsFeedList =  gsFeedService.getAllGsFeedList(gsFeedVO);
		
//		List<AtchFileVO> atchFileList = new ArrayList<AtchFileVO>();
//		for(GsFeedVO gs: gsFeedList) {
//			
			// 첨부파일 관련 처리
//			if (gs.getAtchFileId() > 0) {
//				// 첨부파일이 존재한다면
//				AtchFileVO atchFileVO = new AtchFileVO();
//				atchFileVO.setAtchFileId(gs.getAtchFileId());
//				atchFileVO.setFileSn(0);
//				// gs의 파일 id를 새로운 atchVO에 저장
//				
//				//.getAtchFileList(atchFileVO);
//				AtchFileVO gsAtchVO = atchFileService.getAtchFileDetail(atchFileVO);
//				
//				atchFileList.add(gsAtchVO);
//			}
//		}
//		req.setAttribute("atchFileList", atchFileList);
		
		req.setAttribute("gsFeedList", gsFeedList);  
		req.setAttribute("pagingVO", gsFeedVO); //현재페이지에 관한 정보
			
		//3. 뷰페이지  전달
		
		return VIEW_PAGE;
		
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		return false;
	}

}
