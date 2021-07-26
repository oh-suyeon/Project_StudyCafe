package daily.notice.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.notice.vo.NoticeVO;

public class NoticeDaoImpl implements INoticeDao{

	private static INoticeDao noticeDao;
	
	private NoticeDaoImpl() {
	}
	
	public static INoticeDao getInstance() {
		if(noticeDao == null) {
			noticeDao = new NoticeDaoImpl();
		}
		return noticeDao;
	}
	
	@Override
	public List<NoticeVO> getNoticeList(SqlMapClient smc, NoticeVO noticeVO) throws Exception {
		
		List<NoticeVO> noticeList = smc.queryForList("notice.getNoticeList", noticeVO);
		return noticeList;
	}

	@Override
	public List<NoticeVO> searchNoticeList(SqlMapClient smc, NoticeVO noticeVO) throws Exception {
		
		List<NoticeVO> noticeList = smc.queryForList("notice.searchNoticeList", noticeVO);
		return noticeList;
	}
	

	@Override
	public int getTotalCnt(SqlMapClient smc, NoticeVO noticeVO) throws Exception {

		int cnt = (int) smc.queryForObject("notice.getTotalCnt", noticeVO);
		return cnt;
	}

	
	@Override
	public NoticeVO getNotice(SqlMapClient smc, String noticeNo) throws Exception {
		
		NoticeVO noticeVO = (NoticeVO) smc.queryForObject("notice.getNotice", noticeNo);
		return noticeVO;
	}

	@Override
	public int insertNotice(SqlMapClient smc, NoticeVO noticeVO) throws Exception {

		int cnt = 0;
		Object obj = smc.insert("notice.insertNotice", noticeVO);
		if(obj == null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public int updateNotice(SqlMapClient smc, NoticeVO noticeVO) throws Exception {
		int cnt = smc.update("notice.updateNotice", noticeVO);
		return cnt;
	}

	@Override
	public int deleteNotice(SqlMapClient smc, String noticeNo) throws Exception {
		int cnt = smc.delete("notice.deleteNotice", noticeNo);
		return cnt;
	}

	
	
}
