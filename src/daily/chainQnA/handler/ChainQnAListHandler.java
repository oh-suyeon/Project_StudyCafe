package daily.chainQnA.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.chainQnA.service.ChainQnAServiceImpl;
import daily.chainQnA.service.IChainQnAService;
import daily.chainQnA.vo.ChainQnAVO;
import daily.common.handler.CommandHandler;
import daily.common.vo.PagingVO;

public class ChainQnAListHandler implements CommandHandler{

	private static final Logger LOGGER = Logger.getLogger(ChainQnAListHandler.class);
	private IChainQnAService chainQnAService = ChainQnAServiceImpl.getInstance();
	private static final String VIEW_PAGE = "/views/chainQnA/chainQnAList.jsp";
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		int pageNo = req.getParameter("pageNo") == null ? 1: Integer.parseInt(req.getParameter("pageNo"));
		PagingVO pagingVO = new PagingVO();
		
		int totalCount = chainQnAService.getTotalCnt();
		pagingVO.setTotalCount(totalCount);
		pagingVO.setCurrentPageNo(pageNo);
		pagingVO.setCountPerPage(10);
		pagingVO.setPageSize(5);
		
		List<ChainQnAVO> chainQnaList = chainQnAService.selectQnAList(pagingVO);
		req.setAttribute("chainQnAList", chainQnaList);
		req.setAttribute("pagingVO", pagingVO);
		
		return VIEW_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		return false;
	}

}
