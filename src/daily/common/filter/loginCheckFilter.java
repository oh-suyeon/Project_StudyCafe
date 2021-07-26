package daily.common.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daily.admin.vo.AdminVO;
import daily.owner.vo.OwnerVO;
import daily.user.vo.UserVO;

public class loginCheckFilter implements Filter{

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain fc)
			throws IOException, ServletException {

		
		// 로그인 필터가 필요 없는 페이지는 건너뛴다
		// 로그인 필터 필요 없을 시 passUrlList에 추가하기
		String path = ((HttpServletRequest)req).getContextPath();
		String url = ((HttpServletRequest)req).getRequestURI();
		int idx1 = url.lastIndexOf("/");
		int idx2 = url.lastIndexOf(".");
		String url2 = url.substring(idx1+1, idx2);
		
		List<String> passUrlList = new ArrayList<>();
		passUrlList.add("main");
		passUrlList.add("cafeMain");
		passUrlList.add("searchCafelist");
		passUrlList.add("reviewList");
		passUrlList.add("gsRecruitList");
		passUrlList.add("checkId");
		passUrlList.add("login");
		passUrlList.add("logout");
		passUrlList.add("chainQInsert");
		passUrlList.add("getNoticeList");
		passUrlList.add("getNotice");
		passUrlList.add("searchNoticeList");
		passUrlList.add("filedownload");
		passUrlList.add("chainQnAList");
		passUrlList.add("chainQnADetail");
		passUrlList.add("chainQnAUpdate");
		passUrlList.add("chainQnADelete");
		passUrlList.add("userJoin");
		passUrlList.add("searchId");
		passUrlList.add("selectIdEmail");
		passUrlList.add("updatePw");
		passUrlList.add("chainAInsert");
		passUrlList.add("gsFeedDetail");
/*		passUrlList.add("gsFeedList");*/
		passUrlList.add("chainAUpdate");
		passUrlList.add("chainQnAChkPw");
		passUrlList.add("myInfoUpdate");
		passUrlList.add("cafeInfo");
		
		HttpSession session = ((HttpServletRequest)req).getSession();
		// loginId, loginName, loginType이 ServletRequest에 담겨 간다.
		AdminVO adminVO = (AdminVO)session.getAttribute("adminVO") == null ? null : (AdminVO)session.getAttribute("adminVO");
		OwnerVO ownerVO =  (OwnerVO)session.getAttribute("ownerVO") == null ? null : (OwnerVO)session.getAttribute("ownerVO");
		UserVO userVO = (UserVO)session.getAttribute("userVO") == null ? null : (UserVO)session.getAttribute("userVO");
		
		// 로그인을 하지 않고, 위의 페이지를 제외한 페이지로 들어가려 한다면
		// 로그인 페이지로 간다.
		if(adminVO == null
			&& ownerVO == null
			&& userVO == null
			&& !passUrlList.contains(url2)) {
			
			((HttpServletResponse)resp).sendRedirect(path + "/login.do");
//			RequestDispatcher requestDispatcher = req.getRequestDispatcher(path + "/login.do");
//			requestDispatcher.forward(req, resp);
		
		}else {
			fc.doFilter(req, resp);
		}
			
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
