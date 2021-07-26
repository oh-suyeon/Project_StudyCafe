package daily.common.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import daily.common.handler.CommandHandler;
import daily.common.handler.NullHandler;

public class WebController extends HttpServlet {

/**
	  Command 패턴에 대하여...
	
	정의 => 사용자 요청에 대한 실제 처리 기능을 커맨드 객체로 캡슐화하여 처리하는 패턴
	
	  Command : 사용자 요청을 캡슐화한 객체(실제 처리 기능을 구현한 객체)
	  Invoker : 사용자 요청에 대응되는 적당한 커맨드 객체를 찾아 실행 해 주는 역할을 하는 객체
	
	장점 : 요청을 수행하는 객체(Invoker)로부터 실제 수행처리 기능(Command)을 분리함으로써,
		  새로운 기능을 추가하는데 보다 수월하다. (유지보수가 쉬워진다.)
	
*/
	private static Logger logger = Logger.getLogger(WebController.class);
	
	// 매핑정보 저장(key: 요청 URL, value: 핸들러 객체)
	private Map<String, CommandHandler> cmmHandlerMap = new HashMap<String, CommandHandler>();
	
	/**
	 * 설정파일을 참고하여 요청URL별 대응되는 핸들러 객체를 생성하여 맵에 등록한다.
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		// 설정파일 경로 정보 가져오기
		String configFilePath = config.getInitParameter("handler-config");
		
		Properties prop = new Properties();
		FileReader fr;
		try { 													// os상의 실제경로 (d:/~)
			fr = new FileReader(config.getServletContext().getRealPath(configFilePath));
			
			prop.load(fr); // 프로퍼티스 파일 로드
			
			fr.close();
			
		}catch(IOException ex) {
			ex.printStackTrace();
			
			throw new ServletException(ex);
		}
		
		for(Object key : prop.keySet()) {
			
			String reqURL = (String) key;
			
			try {
				// 동적으로 파일이름 생성(리플랙션 하게?)
				Class<?> klass = Class.forName(prop.getProperty(reqURL));
				
				CommandHandler handler = (CommandHandler) klass.newInstance(); // 클래스 객체 생성
				
				cmmHandlerMap.put(reqURL, handler); // 핸들러 객체 등록
				
			}catch(Exception ex) {
				ex.printStackTrace();
				throw new ServletException();
			}
		}
		
		// 등록된 전체 핸들러 정보 조회하기
		Set<Map.Entry<String, CommandHandler>> entrySet = cmmHandlerMap.entrySet();
		for(Map.Entry<String, CommandHandler> entry : entrySet) {
			logger.info(entry.getKey() + " : " + entry.getValue());
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	/**
	 * 요청처리 메서드(VIEW단으로 forward, redirect 해준다.)
	 * @param req
	 * @param resp
	 */
	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		String reqURI = req.getRequestURI();
		
		//요청 URL : /SampleWebApp/member/list.do
		//요청 URL : /member/list.do
		if(reqURI.indexOf(req.getContextPath()) == 0) {
			reqURI = reqURI.substring(req.getContextPath().length());
		}
		CommandHandler handler = cmmHandlerMap.get(reqURI);
		
		// 이 지점부터 무조건 handler가 null될일 없음
		if(handler == null) {
			handler = new NullHandler(); // 브라우저에서 없는 URL썼을때 500이 아닌 404로 보여주기 위함
		}
		
		// isInfoEnabled 굳이 안써도 되는데 이거쓰면 성능이 조금 향상된다고함
		if(logger.isInfoEnabled()) {
			logger.info("요청URL : " + reqURI);
			logger.info("핸들러객체 : " + handler);
		}
		
		String viewPage = ""; // 뷰화면 정보 (URL)
		try {
			viewPage = handler.process(req, resp); // 핸들러 처리
		}catch(Throwable e) {
			e.printStackTrace();
			throw new ServletException();
		}
		
		logger.info("viewPage 정보 : " + viewPage);
		
		// VIEW 화면 처리하기
		if(viewPage != null) { // 뷰페이지가 존재하면...
			if(handler.isRedirect(req)) { // 리다이렉트 처리가 필요하다면...
				resp.sendRedirect(viewPage);
			}else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
				dispatcher.forward(req, resp);
			}
		}
		
	
	}
}
