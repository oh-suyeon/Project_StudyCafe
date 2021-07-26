package daily.ticket.vo;

import java.util.Date;

public class TicketVO {
	private String buyTicketNo;
	private String ticketNo;
	private String cafeNo;
	private String userId;
	private Date buyTicketDate;
	private String buyCode;
	private int buyAmount;
	private String userCouponNo;
	private int buyCouponAmount;
	private int buyMileage;
	private int buyRealAmount;
	private String buyRefundYn;
	private String buyRefundReason;
	
	
	public String getBuyTicketNo() {
		return buyTicketNo;
	}
	public void setBuyTicketNo(String buyTicketNo) {
		this.buyTicketNo = buyTicketNo;
	}
	public String getTicketNo() {
		return ticketNo;
	}
	public void setTicketNo(String ticketNo) {
		this.ticketNo = ticketNo;
	}
	public String getCafeNo() {
		return cafeNo;
	}
	public void setCafeNo(String cafeNo) {
		this.cafeNo = cafeNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getBuyTicketDate() {
		return buyTicketDate;
	}
	public void setBuyTicketDate(Date buyTicketDate) {
		this.buyTicketDate = buyTicketDate;
	}
	public String getBuyCode() {
		return buyCode;
	}
	public void setBuyCode(String buyCode) {
		this.buyCode = buyCode;
	}
	public int getBuyAmount() {
		return buyAmount;
	}
	public void setBuyAmount(int buyAmount) {
		this.buyAmount = buyAmount;
	}
	public String getUserCouponNo() {
		return userCouponNo;
	}
	public void setUserCouponNo(String userCouponNo) {
		this.userCouponNo = userCouponNo;
	}
	public int getBuyCouponAmount() {
		return buyCouponAmount;
	}
	public void setBuyCouponAmount(int buyCouponAmount) {
		this.buyCouponAmount = buyCouponAmount;
	}
	public int getBuyMileage() {
		return buyMileage;
	}
	public void setBuyMileage(int buyMileage) {
		this.buyMileage = buyMileage;
	}
	public int getBuyRealAmount() {
		return buyRealAmount;
	}
	public void setBuyRealAmount(int buyRealAmount) {
		this.buyRealAmount = buyRealAmount;
	}
	public String getBuyRefundYn() {
		return buyRefundYn;
	}
	public void setBuyRefundYn(String buyRefundYn) {
		this.buyRefundYn = buyRefundYn;
	}
	public String getBuyRefundReason() {
		return buyRefundReason;
	}
	public void setBuyRefundReason(String buyRefundReason) {
		this.buyRefundReason = buyRefundReason;
	}
	
	
	
}
