package daily.chainQnA.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.chainQnA.dao.ChainQnADaoImpl;
import daily.chainQnA.dao.IChainQnADao;
import daily.chainQnA.vo.ChainQnAVO;
import daily.common.vo.PagingVO;
import daily.util.SqlMapClientFactory;

public class ChainQnAServiceImpl implements IChainQnAService{

	private IChainQnADao chainQnADao;
	private static IChainQnAService chainQnAService;
	private SqlMapClient smc;
	
	private ChainQnAServiceImpl() {
		chainQnADao = ChainQnADaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}
	public static IChainQnAService getInstance() {
		if(chainQnAService == null) {
			chainQnAService = new ChainQnAServiceImpl();
		}
		
		return chainQnAService;
	}

	@Override
	public int insertQ(ChainQnAVO chainQnAVO) {
		
		int cnt = 0;
		try {
			cnt = chainQnADao.insertQ(smc, chainQnAVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public List<ChainQnAVO> selectQnAList(PagingVO pagingVO) {
		List<ChainQnAVO> chainList = new ArrayList<ChainQnAVO>();
		
		try {
			chainList = chainQnADao.selectQnAList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return chainList;
	}
	@Override
	public int getTotalCnt() {
		int cnt = 0;
		try {
			cnt = chainQnADao.getTotalCnt(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public ChainQnAVO selectQnADetail(String chainQnANo) {
		ChainQnAVO chainQnAVO = null;
		try {
			chainQnAVO = chainQnADao.selectQnADetail(smc, chainQnANo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chainQnAVO;
	}
	@Override
	public int updateQnA(ChainQnAVO chainQnAVO) {
		int cnt = 0;
		try {
			cnt = chainQnADao.updateQnA(smc, chainQnAVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int deleteQnA(String chainQnaNo) {
		int cnt = 0;
		try {
			cnt = chainQnADao.deleteQnA(smc, chainQnaNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int insertA(ChainQnAVO chainQnAVO) {
	
		int cnt = 0;
		try {
			cnt = chainQnADao.insertA(smc, chainQnAVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<ChainQnAVO> selectAList(String chainQnANo) {
		List<ChainQnAVO> chainAList = new ArrayList<ChainQnAVO>();
		
		try {
			chainAList = chainQnADao.selectAList(smc, chainQnANo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return chainAList;
	}
	@Override
	public int updateA(ChainQnAVO chainQnAVO) {
		int cnt = 0;
		try {
			cnt = chainQnADao.updateA(smc, chainQnAVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int deleteA(String chainQnaNo) {
		int cnt = 0;
		try {
			cnt = chainQnADao.deleteA(smc, chainQnaNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public ChainQnAVO selectChkPw(String inputPw, String qnaNo) {
		ChainQnAVO chainQnAVO = null;
		try {
			chainQnAVO = chainQnADao.selectChkPw(smc, inputPw, qnaNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chainQnAVO;
	}
	@Override
	public List<ChainQnAVO> searchQnA(ChainQnAVO chainQnAVO) {
		List<ChainQnAVO> searchQnAList = new ArrayList<ChainQnAVO>();
		try {
			searchQnAList = chainQnADao.searchQnA(smc, chainQnAVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return searchQnAList;
	}
}
