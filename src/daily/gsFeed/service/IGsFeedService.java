package daily.gsFeed.service;

import java.util.List;

import daily.common.vo.PagingVO;
import daily.gsFeed.vo.GsFeedVO;
import daily.gsRecruit.vo.GsRecruitVO;

public interface IGsFeedService {

	public int getTotalCnt(GsFeedVO gsFeedVO);

	public List<GsFeedVO> getAllGsFeedList(PagingVO pagingVO);

	public GsFeedVO getGsFeed(String gsFeedNo);

	public int insertFd(GsFeedVO gsFeedVO);

	public int deleteFd(String gsFeedNo);

	public int updateFd(GsFeedVO gsFeedVO);

}
