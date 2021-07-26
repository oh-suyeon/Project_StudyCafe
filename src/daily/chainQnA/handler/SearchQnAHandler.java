package daily.chainQnA.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.chainQnA.service.ChainQnAServiceImpl;
import daily.chainQnA.service.IChainQnAService;
import daily.chainQnA.vo.ChainQnAVO;
import daily.common.handler.CommandHandler;

public class SearchQnAHandler implements CommandHandler{

	private static final Logger LOGGER = Logger.getLogger(SearchQnAHandler.class);
	private IChainQnAService chainQnAService = ChainQnAServiceImpl.getInstance();
	private static final String VIEW_PAGE = "/views/chainQnA/resultSearchQnA.jsp";
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String selectSearch = req.getParameter("selectSearch"); //제목인지 내용인지
		String inputSearch = req.getParameter("inputSearch"); //내용적힌 부분
		
		ChainQnAVO chainQnAVO = new ChainQnAVO();
		
		if("title".equals(selectSearch)) {
			chainQnAVO.setChainQnaTitle(inputSearch);
		}else {
			chainQnAVO.setChainQnaContent(inputSearch);
		}
		req.setAttribute("selectSearch", selectSearch);
		req.setAttribute("inputSearch", inputSearch);
		
		List<ChainQnAVO> searchQnAList = new ArrayList<>();
		searchQnAList = chainQnAService.searchQnA(chainQnAVO);
		
		req.setAttribute("searchQnAList", searchQnAList);
		
		
		
		return VIEW_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

}
