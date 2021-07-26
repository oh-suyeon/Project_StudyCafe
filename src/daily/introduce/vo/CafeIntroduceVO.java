package daily.introduce.vo;

public class CafeIntroduceVO {
	
	private String introduceNo     ;
	private String introduceCode   ;
	private String introduceContent;
	private long atchFileId = -1     ;
	private String adminId         ;
	private String cafeNo          ;
	
	public String getIntroduceNo() {
		return introduceNo;
	}
	public void setIntroduceNo(String introduceNo) {
		this.introduceNo = introduceNo;
	}
	public String getIntroduceCode() {
		return introduceCode;
	}
	public void setIntroduceCode(String introduceCode) {
		this.introduceCode = introduceCode;
	}
	public String getIntroduceContent() {
		return introduceContent;
	}
	public void setIntroduceContent(String introduceContent) {
		this.introduceContent = introduceContent;
	}
	public long getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(long atchFileId) {
		this.atchFileId = atchFileId;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getCafeNo() {
		return cafeNo;
	}
	public void setCafeNo(String cafeNo) {
		this.cafeNo = cafeNo;
	}
	
	
}
