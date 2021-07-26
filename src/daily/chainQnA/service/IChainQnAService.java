package daily.chainQnA.service;

import java.util.List;

import daily.chainQnA.vo.ChainQnAVO;
import daily.common.vo.PagingVO;

public interface IChainQnAService {

	/**
	 * 가맹문의 글 등록(Q)
	 * @param chainQnAVO
	 * @return
	 */
	public int insertQ(ChainQnAVO chainQnAVO);

	/**
	 * 가맹 문의 글 조회
	 * @param pagingVO
	 * @return
	 */
	public List<ChainQnAVO> selectQnAList(PagingVO pagingVO);

	/**
	 * 가맹 문의 글 갯수 조회
	 * @return
	 */
	public int getTotalCnt();

	/**
	 * 가맹 문의 상세 조회
	 * @param chainQnANo
	 * @return
	 */
	public ChainQnAVO selectQnADetail(String chainQnANo);

	/**
	 * 가맹 문의 수정
	 * @param chainQnAVO
	 * @return
	 */
	public int updateQnA(ChainQnAVO chainQnAVO);

	/**
	 * 가맹 문의 삭제
	 * @param chainQnaNo
	 * @return
	 */
	public int deleteQnA(String chainQnaNo);

	/**
	 * 관리자 댓글 등록
	 * @param chainQnaNo
	 * @param comment
	 * @return
	 */
	public int insertA(ChainQnAVO chainQnAVO);

	/**
	 * 관리자 댓글 조회
	 * @param chainQnaQNo
	 * @return
	 */
	public List<ChainQnAVO> selectAList(String chainQnANo);

	/**
	 * 관리자 댓글 수정
	 * @param modifyT
	 * @param chainQnaQNo
	 * @return
	 */
	public int updateA(ChainQnAVO chainQnAVO);

	/**
	 * 게시글 삭제시 관리자 댓글 삭제
	 * @param chainQnaNo
	 * @return
	 */
	public int deleteA(String chainQnaNo);

	/**
	 * 게시글 조회시 비밀번호 검사
	 * @param inputPw
	 * @param qnaNo
	 * @return
	 */
	public ChainQnAVO selectChkPw(String inputPw, String qnaNo);

	/**
	 * 가맹문의 검색
	 * @param chainQnAVO
	 * @return
	 */
	public List<ChainQnAVO> searchQnA(ChainQnAVO chainQnAVO);

}
