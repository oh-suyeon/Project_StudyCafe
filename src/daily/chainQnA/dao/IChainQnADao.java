package daily.chainQnA.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.chainQnA.vo.ChainQnAVO;
import daily.common.vo.PagingVO;

public interface IChainQnADao {

	/**
	 * 가맹 문의 글 등록(Q)
	 * @param smc
	 * @param chainQnAVO
	 * @return
	 */
	public int insertQ(SqlMapClient smc, ChainQnAVO chainQnAVO) throws SQLException;
	
	/**
	 * 가맹문의 글 조회
	 * @param smc
	 * @return
	 */
	public List<ChainQnAVO> selectQnAList(SqlMapClient smc, PagingVO pagingVO) throws SQLException;

	/**
	 * 가맹문의 글 갯수 조회
	 * @param smc
	 * @param chainQnAVO
	 * @return
	 */
	public int getTotalCnt(SqlMapClient smc) throws SQLException;

	/**
	 * 가맹 문의 글 상세 조회
	 * @param smc
	 * @param chainQnANo
	 * @return
	 */
	public ChainQnAVO selectQnADetail(SqlMapClient smc, String chainQnANo) throws SQLException;

	/**
	 * 가맹 문의 글 수정
	 * @param smc
	 * @param chainQnAVO
	 * @return
	 */
	public int updateQnA(SqlMapClient smc, ChainQnAVO chainQnAVO) throws SQLException;

	/**
	 * 가맹 문의 글 삭제
	 * @param smc
	 * @param chainQnaNo
	 * @return
	 * @throws SQLException
	 */
	public int deleteQnA(SqlMapClient smc, String chainQnaNo) throws SQLException;

	/**
	 * 관리자 댓글 등록
	 * @param smc
	 * @param chainQnAVO
	 * @return
	 */
	public int insertA(SqlMapClient smc, ChainQnAVO chainQnAVO) throws SQLException;

	/**
	 * 관리자 댓글 조회
	 * @param smc
	 * @param chainQnaQNo
	 * @return
	 */
	public List<ChainQnAVO> selectAList(SqlMapClient smc, String chainQnANo) throws SQLException;

	/**
	 * 관리자 댓글 수정
	 * @param smc
	 * @param modifyT
	 * @param chainQnaQNo
	 * @return
	 * @throws SQLException
	 */
	public int updateA(SqlMapClient smc, ChainQnAVO chainQnAVO) throws SQLException;

	/**
	 * 게시글 삭제시 관리자 댓글 삭제
	 * @param smc
	 * @param chainQnaNo
	 * @return
	 */
	public int deleteA(SqlMapClient smc, String chainQnaNo) throws SQLException;

	/**
	 * 게시글 조회시 비밀번호 검사
	 * @param smc
	 * @param inputPw
	 * @param qnaNo
	 * @return
	 */
	public ChainQnAVO selectChkPw(SqlMapClient smc, String inputPw, String qnaNo) throws SQLException;

	/**
	 * 가맹문의 글 검색
	 * @param smc
	 * @param chainQnAVO
	 * @return
	 */
	public List<ChainQnAVO> searchQnA(SqlMapClient smc, ChainQnAVO chainQnAVO) throws SQLException;
}
