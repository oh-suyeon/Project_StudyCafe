package daily.gsFeed.vo;

import daily.common.vo.PagingVO;

public class GsFeedVO extends PagingVO{
	private String gsFeedNo         ;
	private String gsRecruitNo;
	private String userId           ;
	private String gsFeedTitle      ;
	private String gsFeedContent    ;
	private String gsFeedDate       ;
	private long atchFileId       ;
	private String boardCode        ;
	private String fileOriginalName;
	private String fileName;
	
	public String getGsFeedNo() {
		return gsFeedNo;
	}
	public void setGsFeedNo(String gsFeedNo) {
		this.gsFeedNo = gsFeedNo;
	}
	public String getGsRecruitNo() {
		return gsRecruitNo;
	}
	public void setGsRecruitNo(String gsRecruitNo) {
		this.gsRecruitNo = gsRecruitNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGsFeedTitle() {
		return gsFeedTitle;
	}
	public void setGsFeedTitle(String gsFeedTitle) {
		this.gsFeedTitle = gsFeedTitle;
	}
	public String getGsFeedContent() {
		return gsFeedContent;
	}
	public void setGsFeedContent(String gsFeedContent) {
		this.gsFeedContent = gsFeedContent;
	}
	public String getGsFeedDate() {
		return gsFeedDate;
	}
	public void setGsFeedDate(String gsFeedDate) {
		this.gsFeedDate = gsFeedDate;
	}
	public long getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(long atchFileId) {
		this.atchFileId = atchFileId;
	}
	public String getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}
	public String getFileOriginalName() {
		return fileOriginalName;
	}
	public void setFileOriginalName(String fileOriginalName) {
		this.fileOriginalName = fileOriginalName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	
	
}
