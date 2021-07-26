package daily.gsRecruit.vo;

import daily.common.vo.PagingVO;

public class GsRecruitVO extends PagingVO{
	private String gsRecruitNo;     // 그룹방 모집번호
	private String gsBoardTitle;    // 그룹방제목
	private String gsName;          // 그룹방이름
	private String gsLeader;        // 그룹장
	private int gsMemberCnt;         // 그룹인원수
	private String gsStartDate;     // 그룹방 시작일
	private String gsEndDate;       // 그룹방 종료일
	private String gsBoardContent;  // 그룹방모집 내용
	private String gsRegDate;       // 그룹방 모집글 등록일
	private String gsOpenYn;        // 그룹방 모집글 공개여부
	private String gsPw;            // 그룹방 모집글 비밀번호
	private String boardCode;       // 그룹번호
	
	public String getGsRecruitNo() {
		return gsRecruitNo;
	}
	public void setGsRecruitNo(String gsRecruitNo) {
		this.gsRecruitNo = gsRecruitNo;
	}
	public String getGsBoardTitle() {
		return gsBoardTitle;
	}
	public void setGsBoardTitle(String gsBoardTitle) {
		this.gsBoardTitle = gsBoardTitle;
	}
	public String getGsName() {
		return gsName;
	}
	public void setGsName(String gsName) {
		this.gsName = gsName;
	}
	public String getGsLeader() {
		return gsLeader;
	}
	public void setGsLeader(String gsLeader) {
		this.gsLeader = gsLeader;
	}
	public int getGsMemberCnt() {
		return gsMemberCnt;
	}
	public void setGsMemberCnt(int gsMemberCnt) {
		this.gsMemberCnt = gsMemberCnt;
	}
	public String getGsStartDate() {
		return gsStartDate;
	}
	public void setGsStartDate(String gsStartDate) {
		this.gsStartDate = gsStartDate;
	}
	public String getGsEndDate() {
		return gsEndDate;
	}
	public void setGsEndDate(String gsEndDate) {
		this.gsEndDate = gsEndDate;
	}
	public String getGsBoardContent() {
		return gsBoardContent;
	}
	public void setGsBoardContent(String gsBoardContent) {
		this.gsBoardContent = gsBoardContent;
	}
	public String getGsRegDate() {
		return gsRegDate;
	}
	public void setGsRegDate(String gsRegDate) {
		this.gsRegDate = gsRegDate;
	}
	public String getGsOpenYn() {
		return gsOpenYn;
	}
	public void setGsOpenYn(String gsOpenYn) {
		this.gsOpenYn = gsOpenYn;
	}
	public String getGsPw() {
		return gsPw;
	}
	public void setGsPw(String gsPw) {
		this.gsPw = gsPw;
	}
	public String getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}


}
