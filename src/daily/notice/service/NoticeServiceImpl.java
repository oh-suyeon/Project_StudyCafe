package daily.notice.service;

import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.notice.dao.INoticeDao;
import daily.notice.dao.NoticeDaoImpl;
import daily.notice.vo.NoticeVO;
import daily.util.SqlMapClientFactory;

public class NoticeServiceImpl implements INoticeService{

	private static INoticeService noticeService;
	
	public static INoticeService getInstance() {
		if(noticeService == null) {
			noticeService = new NoticeServiceImpl();
		}
		return noticeService;
	}
	
	private INoticeDao noticeDao;
	
	private SqlMapClient smc;
	
	private NoticeServiceImpl() {
		noticeDao = NoticeDaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}
	
	@Override
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO) {
		
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		
		try {
			noticeList = noticeDao.getNoticeList(smc, noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return noticeList;
	}

	@Override
	public List<NoticeVO> searchNoticeList(NoticeVO noticeVO) {
		
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		
		try {
			noticeList = noticeDao.searchNoticeList(smc, noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return noticeList;
	}

	@Override
	public int getTotalCnt(NoticeVO noticeVO) {

		int cnt = 0;
		
		try {
			cnt = noticeDao.getTotalCnt(smc, noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public NoticeVO getNotice(String noticeNo) {
		
		NoticeVO noticeVO = new NoticeVO();
		
		try {
			noticeVO = noticeDao.getNotice(smc, noticeNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return noticeVO;
	}

	@Override
	public int insertNotice(NoticeVO noticeVO) {
		
		int cnt = 0;
		
		try {
			cnt = noticeDao.insertNotice(smc, noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		};
		
		return cnt;
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) {

		int cnt = 0;
		
		try {
			cnt = noticeDao.updateNotice(smc, noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int deleteNotice(String noticeNo) {
		
		int cnt = 0;
		
		try {
			cnt = noticeDao.deleteNotice(smc, noticeNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

}
