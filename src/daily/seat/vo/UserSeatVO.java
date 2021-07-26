package daily.seat.vo;

public class UserSeatVO {

	private String userSeatNo; 
	private String cafeSeatNo;
	private String buyTicketNo;
	private String userSeatStartDate;
	private String userSeatEndDate;
	private String checkInDate;
	private String checkOutDate;
	private byte[] checkBarcode; // 바코드는 파일로 저장하지 않고 그냥 userSeatNo 값으로 바코드, 큐알코드를 js에서 그때 그때 생성해주기로 한다.
	private int roomUserCnt;
	private String userId;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserSeatNo() {
		return userSeatNo;
	}
	public void setUserSeatNo(String userSeatNo) {
		this.userSeatNo = userSeatNo;
	}
	public String getCafeSeatNo() {
		return cafeSeatNo;
	}
	public void setCafeSeatNo(String cafeSeatNo) {
		this.cafeSeatNo = cafeSeatNo;
	}
	public String getBuyTicketNo() {
		return buyTicketNo;
	}
	public void setBuyTicketNo(String buyTicketNo) {
		this.buyTicketNo = buyTicketNo;
	}
	public String getUserSeatStartDate() {
		return userSeatStartDate;
	}
	public void setUserSeatStartDate(String userSeatStartDate) {
		this.userSeatStartDate = userSeatStartDate;
	}
	public String getUserSeatEndDate() {
		return userSeatEndDate;
	}
	public void setUserSeatEndDate(String userSeatEndDate) {
		this.userSeatEndDate = userSeatEndDate;
	}
	public String getCheckInDate() {
		return checkInDate;
	}
	public void setCheckInDate(String checkInDate) {
		this.checkInDate = checkInDate;
	}
	public String getCheckOutDate() {
		return checkOutDate;
	}
	public void setCheckOutDate(String checkOutDate) {
		this.checkOutDate = checkOutDate;
	}
	public byte[] getCheckBarcode() {
		return checkBarcode;
	}
	public void setCheckBarcode(byte[] checkBarcode) {
		this.checkBarcode = checkBarcode;
	}
	public int getRoomUserCnt() {
		return roomUserCnt;
	}
	public void setRoomUserCnt(int roomUserCnt) {
		this.roomUserCnt = roomUserCnt;
	}
	
	
	
}
