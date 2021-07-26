package daily.gsRecruit.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.gsRecruit.dao.GsRecruitDaoImpl;
import daily.gsRecruit.dao.IGsRecruitDao;
import daily.gsRecruit.vo.GsRecruitVO;
import daily.util.SqlMapClientFactory;

public class GsRecruitServiceImpl implements IGsRecruitService{

	private IGsRecruitDao gsRecruitDao;
	
	private static IGsRecruitService gsRecruitService; // 자기 자신의 타입 담을 변수
	
	private SqlMapClient smc;
	
	private GsRecruitServiceImpl() {
		gsRecruitDao = GsRecruitDaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IGsRecruitService getInstance() {
		if(gsRecruitService == null) {
			gsRecruitService = new GsRecruitServiceImpl();
		}
		return gsRecruitService;
	}
	
	@Override
	public List<GsRecruitVO> getAllGsRecruitList(PagingVO pagingVO) {
		
		List<GsRecruitVO> gsRecruitList = new ArrayList<GsRecruitVO>();
		
		try {
			gsRecruitList = gsRecruitDao.getAllGsRecruitList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return gsRecruitList;
	}

	@Override
	public int getTotalCnt(GsRecruitVO grv) {
		System.out.println("smc : " + smc);
		int cnt = 0;
		try {
			cnt = gsRecruitDao.getTotalCnt(smc, grv);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public GsRecruitVO getGsRecruit(String gsRecruitNo) {
		
		GsRecruitVO grv = null;
		try {
			grv = gsRecruitDao.getGsRecruit(smc, gsRecruitNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return grv;
	}

	@Override
	public int insertGs(GsRecruitVO grv) {
		
		int cnt= 0;
		try {
			cnt = gsRecruitDao.insertGs(smc, grv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteGs(String gsRecruitNo) {
		int cnt = 0;
		try {
			cnt = gsRecruitDao.deleteGs(smc, gsRecruitNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateGs(GsRecruitVO grv) {
		int cnt = 0;
		try {
			cnt = gsRecruitDao.updateGs(smc, grv);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<GsRecruitVO> SearchGsRecruit(GsRecruitVO grv) {
		
		List<GsRecruitVO> gsRecruitList = new ArrayList<GsRecruitVO>();
		
		try {
			gsRecruitList = gsRecruitDao.searchGsRecruitList(smc, grv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return gsRecruitList;
		
	}

}
