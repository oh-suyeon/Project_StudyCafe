package daily.chainQnA.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.chainQnA.service.ChainQnAServiceImpl;
import daily.chainQnA.service.IChainQnAService;
import daily.common.handler.CommandHandler;

public class ChainQnADeleteHandler implements CommandHandler{

	private static final Logger LOGGER = Logger.getLogger(ChainQnADeleteHandler.class);
	private IChainQnAService chainQnAService = ChainQnAServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String chainQnaNo = req.getParameter("chainQnaNo");
		
		int cnt = chainQnAService.deleteQnA(chainQnaNo);
		int cnt2 = chainQnAService.deleteA(chainQnaNo);
		String msg= "";
		if(cnt > 0 && cnt2 > 0) {
			msg= "성공";
		}else {
			msg= "실패";
		}
		
		String redirectURL = req.getContextPath() + "/chainQnAList.do?msg=" + URLEncoder.encode(msg, "utf-8");
		return redirectURL;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}

}
