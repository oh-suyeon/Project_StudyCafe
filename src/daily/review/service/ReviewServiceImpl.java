package daily.review.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.review.dao.IReviewDao;
import daily.review.dao.ReviewDaoImpl;
import daily.review.vo.ReviewVO;
import daily.util.SqlMapClientFactory;

public class ReviewServiceImpl implements IReviewService{
	
	
	private IReviewDao revDao;
	
	private static IReviewService revService;
	
	private SqlMapClient smc;
	
	private ReviewServiceImpl() {
		revDao = ReviewDaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IReviewService getInstance() {
		
		if(revService == null) {
			revService = new ReviewServiceImpl();
		}
		
		return revService;
	}

	@Override
	public int insertReview(ReviewVO rv) {

		int cnt = 0;
		
		try {
			cnt = revDao.insertReview(smc, rv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
		
	}

	@Override
	public int deleteReview(String reviewNo) {
		
		int cnt = 0;
		
		try {
			cnt = revDao.deleteReview(smc, reviewNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
		
	}

	@Override
	public int updateReview(ReviewVO rv) {


		int cnt = 0;
		
		try {
			cnt = revDao.updateReview(smc, rv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<ReviewVO> getAllReviewList(PagingVO pagingVO) {
		
		List<ReviewVO> revList = new ArrayList<ReviewVO>();
		
		try {
			revList = revDao.getAllReviewList(smc, pagingVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return revList;
		
	}

	@Override
	public int getTotalCnt() {

		int cnt = 0;
		
		try {
			cnt = revDao.getTotalCnt(smc);
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
				
		return cnt;
		
	}

	@Override
	public boolean checkReview(String userId) {

		boolean chk = false;
		
		try {
			chk = revDao.checkReview(smc, userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return chk;
		
	}

	@Override
	public List<ReviewVO> getSearchReview(ReviewVO rv) {

		List<ReviewVO> revList = new ArrayList<>();
		
		try {
			revList = revDao.getSearchReview(smc, rv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return revList;
		
	}

	@Override
	public ReviewVO getReview(String userId) {
		ReviewVO rv = null;
		try {
			rv = revDao.getReview(smc, userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rv;
	}

	@Override
	public ReviewVO getReview2(String reviewTitle) {
		ReviewVO rv = null;
		try {
			rv = revDao.getReview2(smc, reviewTitle);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rv;
	}

	@Override
	public ReviewVO getReviewNo(String reviewNo) {
		ReviewVO rv = null;
		try {
			rv = revDao.getReviewNo(smc, reviewNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rv;
	}

}
