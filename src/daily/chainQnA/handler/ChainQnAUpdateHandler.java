package daily.chainQnA.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.chainQnA.service.ChainQnAServiceImpl;
import daily.chainQnA.service.IChainQnAService;
import daily.chainQnA.vo.ChainQnAVO;
import daily.common.handler.CommandHandler;

public class ChainQnAUpdateHandler implements CommandHandler{

	private static final Logger LOGGER = Logger.getLogger(ChainQnAUpdateHandler.class);
	private static final String VIEW_PAGE = "/views/chainQnA/chainQnAUpdate.jsp";
	private IChainQnAService chainQnAService = ChainQnAServiceImpl.getInstance();
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			String chainQnANo = req.getParameter("chainQnaNo");
			
			ChainQnAVO chainQnAVO = chainQnAService.selectQnADetail(chainQnANo);
			
			req.setAttribute("chainQnAVO", chainQnAVO);
			
			return VIEW_PAGE;
			
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			
			String chainQnANo = req.getParameter("chainQnaNo");
			String chainQnaTitle = req.getParameter("chainQnaTitle");
			String userId = req.getParameter("userId");
			String writerName = req.getParameter("writerName");
			String chainQnaSido = req.getParameter("chainQnaSido");
			String chainQnaContent = req.getParameter("chainQnaContent");
			String chainQnaHp1 = req.getParameter("chainQnaHp1");
			String chainQnaHp2 = req.getParameter("chainQnaHp2");
			String chainQnaHp3 = req.getParameter("chainQnaHp3");
			String chainQnaHp = chainQnaHp1 + chainQnaHp2 + chainQnaHp3;
			
			ChainQnAVO chainQnAVO = new ChainQnAVO();
			
			chainQnAVO.setChainQnaNo(chainQnANo);
			chainQnAVO.setChainQnaTitle(chainQnaTitle);
			chainQnAVO.setUserId(userId);
			chainQnAVO.setWriterName(writerName);
			chainQnAVO.setChainQnaSido(chainQnaSido);
			chainQnAVO.setChainQnaContent(chainQnaContent);
			chainQnAVO.setChainQnaHp(chainQnaHp);
			
			int cnt = chainQnAService.updateQnA(chainQnAVO);

			String msg = "";
			if(cnt > 0) {
				msg =  "성공";
			}else {
				msg="실패";
			}
			String redirectURL = req.getContextPath() + "/chainQnADetail.do?chainQnaNo=" +chainQnANo + "&msg=" + URLEncoder.encode(msg, "utf-8");
			return redirectURL;
		}
		
		return null;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) {
			return false;
		}else if(req.getMethod().equals("POST")) {
			return true;
		}
		return false;
	}

}
