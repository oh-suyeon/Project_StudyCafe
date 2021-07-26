package daily.owner.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.owner.service.OwnerServiceImpl;
import daily.owner.service.IOwnerService;
import daily.owner.vo.OwnerCafeInfoVO;
import daily.common.handler.CommandHandler;

public class OwnerManageListHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/views/owner/ownerManage.jsp";

	private IOwnerService ownerService = OwnerServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		OwnerCafeInfoVO ownerCafeVO = new OwnerCafeInfoVO();
		IOwnerService ownerService = OwnerServiceImpl.getInstance();
		
			
		// 검색을 통해 지점주 정보 리스트를 조회하는 경우
		String radioVal = req.getParameter("radioSrchOwner");
		String inputVal = req.getParameter("inputRadioTxt");
		String regionVal = req.getParameter("selectRegion");
		String cafeRunVal = req.getParameter("selectCafeRun");
		// 라디오버튼의 지점지이름/지점이름 으로 검색한 경우
		// 지점주 이름 선택일때
		if("ownerName".equals(radioVal)) {
			ownerCafeVO.setOwnerName(inputVal);
		// 지점이름 선택일때
		}else {
			ownerCafeVO.setCafeName(inputVal);
		}
	
		// 지역 셀렉트버튼으로 검색한 경우
		if(!"가맹지역".equals(regionVal)) {
			ownerCafeVO.setRegionName(regionVal);
		}
		
		// 카페운영상태 셀렉트버튼으로 검색한 경우
		if(!"운영상태".equals(cafeRunVal)) {
			ownerCafeVO.setRunName(cafeRunVal);
		}	
		// 페이징처리 
		pagingReflect(req, ownerCafeVO);
		
		List<OwnerCafeInfoVO> ownerList = ownerService.retreieveOwnerList(ownerCafeVO);
		req.setAttribute("ownerList", ownerList);
		
		if(radioVal != null || inputVal != null || regionVal != null || cafeRunVal != null) {
			
			String queryString = "?radioSrchOwner=" + radioVal + "&inputRadioTxt=" + inputVal + "&selectRegion=" + regionVal +  "&selectCafeRun=" + cafeRunVal;
			return req.getContextPath() + VIEW_PAGE + queryString;
		}
		return req.getContextPath() + VIEW_PAGE;
		
		
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}
	
	public void pagingReflect(HttpServletRequest req, OwnerCafeInfoVO ownerCafeVO) {
		// 페이징처리 
		int pageNo = req.getParameter("pageNo") == null ? 1 : Integer.parseInt(req.getParameter("pageNo"));
		
		int totalCnt = ownerService.getOwnerCnt(ownerCafeVO);
		
		ownerCafeVO.setTotalCount(totalCnt); // 전체 페이지 수
		ownerCafeVO.setCurrentPageNo(pageNo); // 현재 페이지 번호
		ownerCafeVO.setCountPerPage(10); // 한 페이지당 게시되는 게시물 건 수
		ownerCafeVO.setPageSize(5); // 한 화면에 보여지는 페이지 번호 개수
		
		req.setAttribute("ownerCafeVO", ownerCafeVO);
	}

}
