package daily.chainQnA.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.chainQnA.vo.ChainQnAVO;
import daily.common.vo.PagingVO;

public class ChainQnADaoImpl implements IChainQnADao {

	private static IChainQnADao chainQnADao;
	
	private ChainQnADaoImpl() {

	}
	public static IChainQnADao getInstance() {
		if(chainQnADao == null) {
			chainQnADao = new ChainQnADaoImpl();
		}
		return chainQnADao;
	}
	
	@Override
	public int insertQ(SqlMapClient smc, ChainQnAVO chainQnAVO) throws SQLException {
		int cnt = 0;
		
		Object obj = smc.insert("chainQnA.chainQInsert", chainQnAVO);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}
	@Override
	public List<ChainQnAVO> selectQnAList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {
		List<ChainQnAVO> chainList = smc.queryForList("chainQnA.selectQnAList", pagingVO);
		return chainList;
	}
	@Override
	public int getTotalCnt(SqlMapClient smc) throws SQLException {
		int cnt = (int) smc.queryForObject("chainQnA.getTotalCnt");
		return cnt;
	}
	@Override
	public ChainQnAVO selectQnADetail(SqlMapClient smc, String chainQnANo) throws SQLException {
		ChainQnAVO chainQnAVO = (ChainQnAVO) smc.queryForObject("chainQnA.selectQnADetail", chainQnANo);
		return chainQnAVO;
	}
	@Override
	public int updateQnA(SqlMapClient smc, ChainQnAVO chainQnAVO) throws SQLException {
		int cnt = smc.update("chainQnA.updateQnA", chainQnAVO);
		
		return cnt;
	}
	@Override
	public int deleteQnA(SqlMapClient smc, String chainQnaNo) throws SQLException {
		int cnt = smc.delete("chainQnA.deleteQnA", chainQnaNo);
		return cnt;
	}
	@Override
	public int insertA(SqlMapClient smc, ChainQnAVO chainQnAVO) throws SQLException {
		int cnt = 0;
		
		Object obj = smc.insert("chainQnA.chainAInsert", chainQnAVO);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}
	@Override
	public List<ChainQnAVO> selectAList(SqlMapClient smc, String chainQnANo) throws SQLException {
		List<ChainQnAVO> chainAList = smc.queryForList("chainQnA.selectAList", chainQnANo);
		return chainAList;
	}
	@Override
	public int updateA(SqlMapClient smc, ChainQnAVO chainQnAVO) throws SQLException {
		int cnt = smc.update("chainQnA.updateA", chainQnAVO);
		
		return cnt;
	}
	@Override
	public int deleteA(SqlMapClient smc, String chainQnaNo) throws SQLException {
		int cnt = smc.delete("chainQnA.deleteA", chainQnaNo);
		return cnt;
	}
	@Override
	public ChainQnAVO selectChkPw(SqlMapClient smc, String inputPw, String qnaNo) throws SQLException {
		HashMap<String, String> pwNo = new HashMap<>();
		pwNo.put("inputPw", inputPw);
		pwNo.put("qnaNo", qnaNo);
		ChainQnAVO chainQnAVO = (ChainQnAVO) smc.queryForObject("chainQnA.selectChkPw", pwNo);
		return chainQnAVO;
	}
	@Override
	public List<ChainQnAVO> searchQnA(SqlMapClient smc, ChainQnAVO chainQnAVO) throws SQLException {
		List<ChainQnAVO> searchQnAList = smc.queryForList("chainQnA.searchQnA", chainQnAVO);
		return searchQnAList;
	}

}
