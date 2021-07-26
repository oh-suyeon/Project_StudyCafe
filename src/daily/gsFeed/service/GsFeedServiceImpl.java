package daily.gsFeed.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.gsFeed.dao.GsFeedDaoImpl;
import daily.gsFeed.dao.IGsFeedDao;
import daily.gsFeed.vo.GsFeedVO;

import daily.util.SqlMapClientFactory;

public class GsFeedServiceImpl implements IGsFeedService{

	private IGsFeedDao gsFeedDao;
	
	private static IGsFeedService gsFeedService; // 자기 자신의 타입 담을 변수
	
	private SqlMapClient smc;
	
	private GsFeedServiceImpl() {
		gsFeedDao = GsFeedDaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IGsFeedService getInstance() {
		if(gsFeedService == null) {
			gsFeedService = new GsFeedServiceImpl();
		}
		return gsFeedService;
	}

	@Override
	public int getTotalCnt(GsFeedVO gsFeedVO) {
		int cnt = 0;
		try {
			cnt = gsFeedDao.getTotalCnt(smc, gsFeedDao);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	
	}

	@Override
	public List<GsFeedVO> getAllGsFeedList(PagingVO pagingVO) {
	
		List<GsFeedVO> getAllGsFeedList = new ArrayList<GsFeedVO>();
		
		try {
			getAllGsFeedList = gsFeedDao.getAllGsFeedList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return getAllGsFeedList;
	}

	@Override
	public GsFeedVO getGsFeed(String gsFeedNo) {
		GsFeedVO gsFeedVO = null;
		try {
			gsFeedVO = gsFeedDao.getGsFeed(smc, gsFeedNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return gsFeedVO;
	}

	@Override
	public int insertFd(GsFeedVO gsFeedVO) {
		
		int cnt= 0;
		try {
			cnt = gsFeedDao.insertFd(smc, gsFeedVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteFd(String gsFeedNo) {
		int cnt = 0;
		try {
			cnt = gsFeedDao.deleteFd(smc, gsFeedNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateFd(GsFeedVO gsFeedVO) {
		int cnt = 0;
		try {
			cnt = gsFeedDao.updateFd(smc, gsFeedVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
}
