package daily.cafe.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.cafe.dao.CafeDaoImpl;
import daily.cafe.dao.ICafeDao;
import daily.cafe.vo.CafeIntroduceVO;
import daily.cafe.vo.CafeRegionNameVO;
import daily.cafe.vo.CafeVO;
import daily.common.vo.PagingVO;
import daily.owner.vo.OwnerVO;
import daily.util.SqlMapClientFactory;

public class CafeServiceImpl implements ICafeService{

	private static ICafeService cafeService;
	private ICafeDao cafeDao;
	private SqlMapClient smc;
	
	private CafeServiceImpl() {
		cafeDao = CafeDaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	};
	
	public static ICafeService getinstance() {
		if(cafeService == null) {
			cafeService = new CafeServiceImpl();
		}
		return cafeService;
	}
	
	@Override
	public List<CafeRegionNameVO> retreieveCafeList(CafeRegionNameVO cafeVO) {
		List<CafeRegionNameVO> cafeList = new ArrayList<>();	
		
		try {
			cafeList = cafeDao.retreieveCafeList(smc, cafeVO);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cafeList;
	}

	@Override
	public int getCafeCnt(CafeRegionNameVO cafeVO) {
		int cnt = 0;
		
		try {
			cnt = cafeDao.getCafeCnt(smc, cafeVO);
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public CafeRegionNameVO retreieveCafe(String cafeNo) {
		CafeRegionNameVO cafeVO = null;

		try {
			cafeVO = cafeDao.retreieveCafe(smc, cafeNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cafeVO;
	}

	@Override
	public CafeIntroduceVO cafeIntroduce(String cafeNo) {
		CafeIntroduceVO introduceVO = null;
		
		try {
			introduceVO = cafeDao.cafeIntroduce(smc, cafeNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return introduceVO;
	}

	@Override
	public int createCafe(CafeVO cafeVO) {
		int cnt = 0;
		
		try {
			cnt = cafeDao.createCafe(smc, cafeVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<OwnerVO> retreieveOwnerList() {
		List<OwnerVO> ownerList = new ArrayList<OwnerVO>();
		
		try {
			ownerList = cafeDao.retreieveOwnerList(smc);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ownerList;
	}

	@Override
	public int updateCafe(CafeVO cafeVO) {
		int cnt = 0;
		
		try {
			cnt = cafeDao.updateCafe(smc, cafeVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteCafe(String cafeNo) {
		int cnt = 0;
		
		try {
			cnt = cafeDao.deleteCafe(smc, cafeNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	
	@Override
	public CafeVO getCafeToSeat(String ownerId) {
		CafeVO cafeVO = new CafeVO();
		try {
			cafeVO = cafeDao.getCafeToSeat(smc, ownerId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cafeVO;
	}
}
