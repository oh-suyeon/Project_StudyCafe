package daily.common.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHandler {

	/**
	 * 요청한 내용을 실제 처리하는 메서드
	 * @param req
	 * @param resp
	 * @return 뷰페이지 정보
	 * @throws Exception
	 */
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception;
	
	/**
	 * 해당 화면에 대해 포워드 및 리다이렉트 여부 결정하기 위한 메서드
	 * @param req
	 * @return true 리다이렉트 false 포워드
	 */
	public boolean isRedirect(HttpServletRequest req);
	
}
