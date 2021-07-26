package daily.chainQnA.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.chainQnA.service.ChainQnAServiceImpl;
import daily.chainQnA.service.IChainQnAService;
import daily.chainQnA.vo.ChainQnAVO;
import daily.common.handler.CommandHandler;

public class ChainQnAChkPwHandler implements CommandHandler{

	private static final Logger LOGGER = Logger.getLogger(ChainAUpdateHandler.class);
	private IChainQnAService chainQnAService = ChainQnAServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String inputPw = req.getParameter("inputPw");
		String qnaNo = req.getParameter("qnaNo");
		ChainQnAVO chainQnAVO = chainQnAService.selectChkPw(inputPw, qnaNo);
		
		req.setAttribute("chainQnAVO", chainQnAVO);
		
		String url = req.getContextPath() + "/views/chainQnA/chainQnAchkPw.jsp";
		return url;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

}
