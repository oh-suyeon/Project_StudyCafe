package daily.chainQnA.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.chainQnA.service.ChainQnAServiceImpl;
import daily.chainQnA.service.IChainQnAService;
import daily.chainQnA.vo.ChainQnAVO;
import daily.common.handler.CommandHandler;

public class ChainAUpdateHandler implements CommandHandler{

	private static final Logger LOGGER = Logger.getLogger(ChainAUpdateHandler.class);
	private static final String VIEW_PAGE = "/chainQnAList.do";
	private IChainQnAService chainQnAService = ChainQnAServiceImpl.getInstance();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("GET")) {
			return VIEW_PAGE;
		}else if(req.getMethod().equals("POST")) {
			
		String selectModify = req.getParameter("selectModify");
		String chainQnaNo = req.getParameter("chainQnaNo"); //가맹문의 글 중, 댓글 번호
		
		ChainQnAVO chainQnAVO = new ChainQnAVO();
		chainQnAVO.setChainQnaTitle(selectModify);
		chainQnAVO.setChainQnaNo(chainQnaNo);
		
		int cnt = chainQnAService.updateA(chainQnAVO);
		
		String msg = "";
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		String chainQnaQNo = req.getParameter("chainQnaQNo"); //가맹문의 글 번호
		
		String redirectURL = req.getContextPath() + "/chainQnADetail.do?chainQnaNo=" +chainQnaQNo + "&msg=" + URLEncoder.encode(msg, "utf-8");
		return redirectURL;
		}
		return null;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
		
	}

}
