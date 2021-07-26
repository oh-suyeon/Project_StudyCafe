package daily.owner.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.owner.vo.OwnerCafeInfoVO;

public class OwnerDaoImpl implements IOwnerDao{
	
	private static IOwnerDao ownerDao;
	
	private OwnerDaoImpl() {};
	
	public static IOwnerDao getInstance() {
		if(ownerDao == null) {
			ownerDao = new OwnerDaoImpl();
		}
		return ownerDao;
	}

	@Override
	public List<OwnerCafeInfoVO> retreieveOwnerList(SqlMapClient smc, OwnerCafeInfoVO ownerCafeVO) throws SQLException {
		List<OwnerCafeInfoVO> ownerList = smc.queryForList("owner.retreieveOwnerList", ownerCafeVO);
		
		return ownerList;
	}

	@Override
	public int getCafeCnt(SqlMapClient smc, OwnerCafeInfoVO ownerCafeVO) throws SQLException {
		int cnt = (int)smc.queryForObject("owner.getOwnerCnt", ownerCafeVO);
		
		return cnt;
	}

	@Override
	public OwnerCafeInfoVO ownerIdCheck(SqlMapClient smc, String ownerId) throws SQLException {
		OwnerCafeInfoVO ownerVO = (OwnerCafeInfoVO)smc.queryForObject("owner.ownerIdCheck", ownerId);
		return ownerVO;
	}

	@Override
	public int createOwner(SqlMapClient smc, OwnerCafeInfoVO ownerCafeVO) throws SQLException {
		int cnt = 0;
		
		Object obj = smc.insert("owner.createOwner", ownerCafeVO);
		
		if(obj == null) {
			cnt = 1;
		}
		return cnt;
	}

	@Override
	public OwnerCafeInfoVO getOwner(SqlMapClient smc, String ownerId) throws SQLException {
		OwnerCafeInfoVO ownerVO = (OwnerCafeInfoVO)smc.queryForObject("owner.getOwner", ownerId);
		return ownerVO;
	}

	@Override
	public int deleteOwner(SqlMapClient smc, String ownerId) throws SQLException {
		int cnt = smc.delete("owner.deleteOwner", ownerId);
		
		return cnt;
	}

	@Override
	public int updateOwner(SqlMapClient smc, OwnerCafeInfoVO ownerCafeVO) throws SQLException {
		int cnt = smc.update("owner.updateOwner", ownerCafeVO);
		
		return cnt;
	}

}
