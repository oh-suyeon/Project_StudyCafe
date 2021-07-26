package daily.introduce.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.common.handler.CommandHandler;
import daily.common.vo.AtchFileVO;
import daily.util.SqlMapClientFactory;

public class IntroTestHandler implements CommandHandler{

	private static final Logger LOGGER = Logger.getLogger(IntroTestHandler.class);
	
	private static final String VIEW_PAGE = "/views/introduce/IntroducTest.jsp";
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			
			return VIEW_PAGE; // forward
			
		}else if(req.getMethod().equals("POST")) {
			String cafeNo = req.getParameter("cafeNo");
			AtchFileVO atchVO = new AtchFileVO();
			
			try {
				atchVO = (AtchFileVO)SqlMapClientFactory.getInstance().queryForObject("test.imageTest", "1");
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			req.setAttribute("atchVO", atchVO);
			
			return VIEW_PAGE; // redirect
			
		}
		return null;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

}
