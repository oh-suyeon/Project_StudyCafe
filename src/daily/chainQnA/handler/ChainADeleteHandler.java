package daily.chainQnA.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.chainQnA.service.ChainQnAServiceImpl;
import daily.chainQnA.service.IChainQnAService;
import daily.chainQnA.vo.ChainQnAVO;
import daily.common.handler.CommandHandler;

public class ChainADeleteHandler implements CommandHandler{

	private static final Logger LOGGER = Logger.getLogger(ChainADeleteHandler.class);
	//private static final String VIEW_PAGE = "/chainQnAList.do";
	private IChainQnAService chainQnAService = ChainQnAServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String chainQnaNo = req.getParameter("chainQnaNo");
		int cnt = chainQnAService.deleteQnA(chainQnaNo);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		String chainQnaQNo =req.getParameter("chainQnaQNo");
	
		String redirectURL = req.getContextPath() + "/chainQnADetail.do?chainQnaNo=" +chainQnaQNo + "&msg=" + URLEncoder.encode(msg, "utf-8");
		return redirectURL;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}

}
