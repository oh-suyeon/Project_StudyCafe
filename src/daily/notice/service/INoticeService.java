package daily.notice.service;

import java.util.List;

import daily.notice.vo.NoticeVO;

public interface INoticeService {
	
	/**
	 * 공지사항 목록을 가져오기
	 * @return 
	 * @throws Exception
	 */
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO);
	
	/**
	 * 검색 조건이 적용된 공지사항 목록을 가져오기
	 * @return
	 * @throws Exception
	 */
	public List<NoticeVO> searchNoticeList(NoticeVO noticeVO);

	/**
	 * 공지사항 게시글 수 가져오기
	 * @param smc
	 * @param cafeNo
	 * @return
	 * @throws Exception
	 */
	public int getTotalCnt(NoticeVO noticeVO);
	
	/**
	 * 공지사항 게시글을 읽기
	 * @return
	 * @throws Exception
	 */
	public NoticeVO getNotice(String noticeNo);
	
	/**
	 * 공지사항 게시글을 쓰기
	 * @return
	 * @throws Exception
	 */
	public int insertNotice(NoticeVO noticeVO);
	
	/**
	 * 공지사항 게시글을 수정하기
	 * @return
	 * @throws Exception
	 */
	public int updateNotice(NoticeVO noticeVO);
	
	/**
	 * 공지사항 게시글을 삭제하기
	 * @return
	 * @throws Exception
	 */
	public int deleteNotice(String noticeNo);
	
	
	
	
}
