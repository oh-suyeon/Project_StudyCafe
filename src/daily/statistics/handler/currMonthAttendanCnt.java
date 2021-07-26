package daily.statistics.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daily.common.handler.CommandHandler;

public class currMonthAttendanCnt implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		return null;
	}

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		return false;
	}

}
