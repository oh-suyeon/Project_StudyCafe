package daily.cafe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.cafe.service.CafeServiceImpl;
import daily.cafe.vo.CafeIntroduceVO;
import daily.cafe.vo.CafeRegionNameVO;
import daily.cafe.vo.CafeVO;
import daily.owner.vo.OwnerVO;

public class CafeDaoImpl implements ICafeDao{

	private static ICafeDao cafeDao;
	
	private CafeDaoImpl() {};
	
	public static ICafeDao getInstance() {
		if(cafeDao == null) {
			cafeDao = new CafeDaoImpl();
		}
		return cafeDao;
	}
	
	@Override
	public List<CafeRegionNameVO> retreieveCafeList(SqlMapClient smc, CafeRegionNameVO cafeVO) throws SQLException {
		
		List<CafeRegionNameVO> cafeList = smc.queryForList("cafe.retreieveCafeList", cafeVO);
		
		return cafeList;
	}

	@Override
	public int getCafeCnt(SqlMapClient smc, CafeRegionNameVO cafeVO) throws SQLException {
		int cnt = (int)smc.queryForObject("cafe.getCafeCnt", cafeVO);
		
		return cnt;
	}

	@Override
	public CafeRegionNameVO retreieveCafe(SqlMapClient smc, String cafeNo) throws SQLException {
		
		CafeRegionNameVO cafeVO = (CafeRegionNameVO)smc.queryForObject("cafe.retreieveCafe", cafeNo);
		
		return cafeVO;
	}

	@Override
	public CafeIntroduceVO cafeIntroduce(SqlMapClient smc, String cafeNo) throws SQLException {
		CafeIntroduceVO introduceVO = (CafeIntroduceVO)smc.queryForObject("cafe.cafeIntroduce", cafeNo);
		
		return introduceVO;
	}

	@Override
	public int createCafe(SqlMapClient smc, CafeVO cafeVO) throws SQLException {
		int cnt = 0;
		
		Object obj = smc.insert("cafe.createCafe", cafeVO);
		
		if(obj == null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public List<OwnerVO> retreieveOwnerList(SqlMapClient smc) throws SQLException {

		List<OwnerVO> ownerList = smc.queryForList("cafe.retreieveOwnerList");
		
		return ownerList;
	}

	@Override
	public int updateCafe(SqlMapClient smc, CafeVO cafeVO) throws SQLException {

		int cnt = smc.update("cafe.updateCafe", cafeVO);
		
		return cnt;
	}

	@Override
	public int deleteCafe(SqlMapClient smc, String cafeNo) throws SQLException {
		int cnt = smc.delete("cafe.deleteCafe", cafeNo);
		return cnt;
	}

	
	@Override
	public CafeVO getCafeToSeat(SqlMapClient smc, String ownerId) throws Exception {
		CafeVO cafeVO = (CafeVO) smc.queryForObject("cafe.getCafeToSeat", ownerId);
		return cafeVO;
	}
}
