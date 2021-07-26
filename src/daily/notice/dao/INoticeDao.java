package daily.notice.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.notice.vo.NoticeVO;

public interface INoticeDao {
	
	/**
	 * 공지사항 목록을 가져오기
	 * @return 
	 * @throws Exception
	 */
	public List<NoticeVO> getNoticeList(SqlMapClient smc, NoticeVO noticeVO) throws Exception;
	
	/**
	 * 검색 조건이 적용된 공지사항 목록을 가져오기
	 * @return
	 * @throws Exception
	 */
	public List<NoticeVO> searchNoticeList(SqlMapClient smc, NoticeVO noticeVO) throws Exception;

	/**
	 * 공지사항 게시글 수 가져오기
	 * @param smc
	 * @param cafeNo
	 * @return
	 * @throws Exception
	 */
	public int getTotalCnt(SqlMapClient smc, NoticeVO noticeVO) throws Exception;
	
	/**
	 * 공지사항 게시글을 읽기
	 * @return
	 * @throws Exception
	 */
	public NoticeVO getNotice(SqlMapClient smc, String noticeNo) throws Exception;
	
	/**
	 * 공지사항 게시글을 쓰기
	 * @return
	 * @throws Exception
	 */
	public int insertNotice(SqlMapClient smc, NoticeVO noticeVO) throws Exception;
	
	/**
	 * 공지사항 게시글을 수정하기
	 * @return
	 * @throws Exception
	 */
	public int updateNotice(SqlMapClient smc, NoticeVO noticeVO) throws Exception;
	
	/**
	 * 공지사항 게시글을 삭제하기
	 * @return
	 * @throws Exception
	 */
	public int deleteNotice(SqlMapClient smc, String noticeNo) throws Exception;
	
	
	
	
}