package daily.chainQnA.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.chainQnA.service.ChainQnAServiceImpl;
import daily.chainQnA.service.IChainQnAService;
import daily.chainQnA.vo.ChainQnAVO;
import daily.common.handler.CommandHandler;

public class ChainQnADetailHandler implements CommandHandler{

	private static final Logger LOGGER = Logger.getLogger(ChainQnADetailHandler.class);
	private static final String VIEW_PAGE = "/views/chainQnA/chainQnADetail.jsp";
	private IChainQnAService chainQnAService = ChainQnAServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String chainQnANo = req.getParameter("chainQnaNo");
		
		ChainQnAVO chainQnAVO = chainQnAService.selectQnADetail(chainQnANo);
		
		req.setAttribute("chainQnAVO", chainQnAVO);
		
		
		
		List<ChainQnAVO> chainAList = chainQnAService.selectAList(chainQnANo);
		
		req.setAttribute("chainAList", chainAList);
		
		return VIEW_PAGE;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		return false;
	}

}
