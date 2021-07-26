package daily.cafe.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.cafe.service.CafeServiceImpl;
import daily.cafe.service.ICafeService;
import daily.cafe.vo.CafeRegionNameVO;
import daily.common.handler.CommandHandler;
import daily.common.vo.PagingVO;

public class CafeListBuyHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/views/cafe/cafeList.jsp";
	
	private ICafeService cafeService = CafeServiceImpl.getinstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		// 파라미터 클래스로 사용할 VO
		CafeRegionNameVO cafeVO = new CafeRegionNameVO();
		
		// 지역 버튼을 선택했을 경우 post방식으로 지역코드를 검색해서 출력
		String cafeRegionCode = req.getParameter("regionCode");
		String selectDong = req.getParameter("selectDong");
		String txtValue = req.getParameter("txtValue");
		
		// 지역버튼으로 '전체'를 선택했을 경우
		if(!"ALL".equals(cafeRegionCode)) {
			cafeVO.setCafeRegionCode(cafeRegionCode);
		}
		
		if("동이름".equals(selectDong)) {
			cafeVO.setCafeAddr1(txtValue);
		}else if("지점명".equals(selectDong)){
			cafeVO.setCafeName(txtValue);
		}
			
		
		// 페이징처리 
		pagingReflect(req, cafeVO);
		
		List<CafeRegionNameVO> cafeList = cafeService.retreieveCafeList(cafeVO);
		req.setAttribute("cafeList", cafeList);
		
		if(cafeRegionCode != null || selectDong != null || txtValue != null) {
			String queryString = "?regionCode=" + cafeRegionCode + "&selectDong=" + selectDong + "&txtValue=" + txtValue;
			return req.getContextPath() + VIEW_PAGE + queryString;			
			
		}
		return req.getContextPath() + VIEW_PAGE;
		
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		return false;
	}
	
	public void pagingReflect(HttpServletRequest req, CafeRegionNameVO cafeVO) {
		// 페이징처리 
		int pageNo = req.getParameter("pageNo") == null ? 1 : Integer.parseInt(req.getParameter("pageNo"));
		
		int totalCnt = cafeService.getCafeCnt(cafeVO);
		
		cafeVO.setTotalCount(totalCnt); // 전체 페이지 수
		cafeVO.setCurrentPageNo(pageNo); // 현재 페이지 번호
		cafeVO.setCountPerPage(5); // 한 페이지당 게시되는 게시물 건 수
		cafeVO.setPageSize(5); // 한 화면에 보여지는 페이지 번호 개수
		
		req.setAttribute("cafeVO", cafeVO);
	}

}
