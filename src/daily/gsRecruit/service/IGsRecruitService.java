package daily.gsRecruit.service;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import daily.common.vo.PagingVO;
import daily.gsRecruit.vo.GsRecruitVO;

public interface IGsRecruitService {

	/**
	 * 전체공지목록을 조회
	 * @param smc
	 * @return
	 */
	public List<GsRecruitVO> getAllGsRecruitList(PagingVO pagingVO);
	
	/**
	 * 전체 회원 수 조회
	 * @return
	 */
	public int getTotalCnt(GsRecruitVO grv);

	public GsRecruitVO getGsRecruit(String gsRecruitNo);

	public int insertGs(GsRecruitVO grv);

	public int deleteGs(String gsRecruitNo);

	public int updateGs(GsRecruitVO grv);

	public List<GsRecruitVO> SearchGsRecruit(GsRecruitVO grv);
}
