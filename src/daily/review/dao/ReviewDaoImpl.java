package daily.review.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.review.vo.ReviewVO;

public class ReviewDaoImpl implements IReviewDao{

	private static IReviewDao rewDao;
	
	private ReviewDaoImpl() {
		
	}
	
	public static IReviewDao getInstance() {
		if(rewDao == null) {
			rewDao = new ReviewDaoImpl();
		}
		
		return rewDao;
	}
	
	
	@Override
	public int insertReview(SqlMapClient smc, ReviewVO rv) throws SQLException {
		
		int cnt = 0;
		
		Object obj = smc.insert("review.insertReview", rv);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

	@Override
	public boolean checkReview(SqlMapClient smc, String userId) throws SQLException {


		boolean check = false;
		
		int count = (int) smc.queryForObject("review.checkReview", userId);
		
		if(count > 0) {
			check = true;
		}
		
		return check;
	}

	@Override
	public int getTotalCnt(SqlMapClient smc) throws SQLException {
		int cnt = (int)smc.queryForObject("review.getTotalCnt");
		return cnt;

	}

	@Override
	public List<ReviewVO> getAllReviewList(SqlMapClient smc, PagingVO pagingVO) throws SQLException {


		List<ReviewVO> rewList = 
				smc.queryForList("review.getReviewAll", pagingVO);
		
		return rewList;
	}

	@Override
	public int updateReview(SqlMapClient smc, ReviewVO rv) throws SQLException {


		int cnt = smc.update("review.updateReview", rv);
		
		return cnt;
	}

	@Override
	public int deleteReview(SqlMapClient smc, String reviewNo) throws SQLException {


		int cnt = smc.delete("review.deleteReview", reviewNo);
		
		return cnt;
	}

	@Override
	public List<ReviewVO> getSearchReview(SqlMapClient smc, ReviewVO rv) throws SQLException {


		List<ReviewVO> rewList = 
				smc.queryForList("review.getSearchReview", rv);
		
		return rewList;
	}

	@Override
	public ReviewVO getReview(SqlMapClient smc, String userId) throws SQLException {

		ReviewVO rv = 
				(ReviewVO)smc.queryForObject("review.getReview", userId);
				
				return rv;
		
	}

	@Override
	public ReviewVO getReview2(SqlMapClient smc, String reviewTitle) throws SQLException {
		
		ReviewVO rv = 
				(ReviewVO)smc.queryForObject("review.getReview2", reviewTitle);
				
		return rv;
				
	}

	@Override
	public ReviewVO getReviewNo(SqlMapClient smc, String reviewNo) throws SQLException {
		ReviewVO rv = 
				(ReviewVO)smc.queryForObject("review.getReviewNo", reviewNo);
				
		return rv;
	}

}
