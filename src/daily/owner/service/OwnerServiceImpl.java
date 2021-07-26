package daily.owner.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.owner.dao.OwnerDaoImpl;
import daily.owner.dao.IOwnerDao;
import daily.owner.vo.OwnerCafeInfoVO;
import daily.util.SqlMapClientFactory;

public class OwnerServiceImpl implements IOwnerService{
	
	private static IOwnerService ownerService;
	private IOwnerDao ownerDao;
	private SqlMapClient smc;
	
	private OwnerServiceImpl() {
		smc = SqlMapClientFactory.getInstance();
		ownerDao = OwnerDaoImpl.getInstance();
	}
	
	public static IOwnerService getInstance() {
		if(ownerService == null) {
			ownerService = new OwnerServiceImpl();
		}
		return ownerService;
	}
	
	@Override
	public List<OwnerCafeInfoVO> retreieveOwnerList(OwnerCafeInfoVO ownerCafeVO) {
		List<OwnerCafeInfoVO> ownerList = new ArrayList<OwnerCafeInfoVO>();
		
		try {
			ownerList = ownerDao.retreieveOwnerList(smc, ownerCafeVO);
		} catch (SQLException e) {
			e.printStackTrace();
		};

		return ownerList;
	}

	@Override
	public int getOwnerCnt(OwnerCafeInfoVO ownerCafeVO) {
		int cnt = 0;
		
		try {
			cnt = ownerDao.getCafeCnt(smc, ownerCafeVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public OwnerCafeInfoVO ownerIdCheck(String ownerId) {
		OwnerCafeInfoVO ownerVO = null;
		
		try {
			ownerVO = ownerDao.ownerIdCheck(smc, ownerId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ownerVO;
	}

	@Override
	public int createOwner(OwnerCafeInfoVO ownerCafeVO) {
		int cnt = 0;
		
		try {
			cnt = ownerDao.createOwner(smc, ownerCafeVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public OwnerCafeInfoVO getOwner(String ownerId) {
		OwnerCafeInfoVO ownerVO = null;
		
		try {
			ownerVO = ownerDao.getOwner(smc, ownerId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ownerVO;
	}

	@Override
	public int deleteOwner(String ownerId) {
		int cnt = 0;
		
		try {
			cnt = ownerDao.deleteOwner(smc, ownerId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateOwner(OwnerCafeInfoVO ownerCafeVO) {
		int cnt = 0;
		
		try {
			cnt = ownerDao.updateOwner(smc, ownerCafeVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

}
