package daily.cafe.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import daily.cafe.service.CafeServiceImpl;
import daily.cafe.service.ICafeService;
import daily.cafe.vo.CafeVO;
import daily.common.handler.CommandHandler;

public class CafeCreateHandler implements CommandHandler{
	
	private static final String VIEW_PAGE = "/views/cafe/cafeCreate.jsp";
	private static final String RESULT_PAGE = "/cafeManage.do";
	
	private ICafeService cafeService = CafeServiceImpl.getinstance();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if("GET".equals(req.getMethod())) {
			return VIEW_PAGE;
			
		}else if("POST".equals(req.getMethod())){
			CafeVO cafeVO = new CafeVO();
			BeanUtils.populate(cafeVO, req.getParameterMap());
			
			String cafeHp1 = req.getParameter("cafeHp1");
			String cafeHp2 = req.getParameter("cafeHp2");
			String cafeHp3 = req.getParameter("cafeHp3");
			String cafeTel = cafeHp1 + cafeHp2 + cafeHp3;
			cafeVO.setCafeTel(cafeTel);
			
			int cnt = cafeService.createCafe(cafeVO);
			
			String msg = "";
			if(cnt > 0) {
				msg = "success";
			}else {
				msg = "fail";
			}
			
			return req.getContextPath() + RESULT_PAGE + "?msg=" + msg;
		}
		
		return null;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if("GET".equals(req.getMethod())) {
			return false;
			
		}else if("POST".equals(req.getMethod())){
			return true;
			
		}
		return false;
	}
	
	

}
