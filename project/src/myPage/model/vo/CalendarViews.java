package myPage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class CalendarViews implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5405082456128569963L;
	
	private  int reservationNo;		// 장례고유번호
	private int productNo;			// 장례유형번호
	private int aNo;				// 예약된동물번호
	private int memberNo;			// 예약고객고유번호
	private String reservationDate;	// 예약날짜
	private String reservationTime;	// 예약시간
	private String status;			// 예약여부
	private String productName;		// 예약유형이름
	private int price;				// 장례가격	
	private String aName;			// 예약된동물이름
	
	public CalendarViews() {
	}

	public CalendarViews(int reservationNo, int productNo, int aNo, int memberNo, String reservationDate,
			String reservationTime, String status, String productName, int price, String aName) {
		this.reservationNo = reservationNo;
		this.productNo = productNo;
		this.aNo = aNo;
		this.memberNo = memberNo;
		this.reservationDate = reservationDate;
		this.reservationTime = reservationTime;
		this.status = status;
		this.productName = productName;
		this.price = price;
		this.aName = aName;
	}

	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getReservationTime() {
		return reservationTime;
	}

	public void setReservationTime(String reservationTime) {
		this.reservationTime = reservationTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	@Override
	public String toString() {
		return "CalendarViews [reservationNo=" + reservationNo + ", productNo=" + productNo + ", aNo=" + aNo
				+ ", memberNo=" + memberNo + ", reservationDate=" + reservationDate + ", reservationTime="
				+ reservationTime + ", status=" + status + ", productName=" + productName + ", price=" + price
				+ ", aName=" + aName + "]";
	}

	

}
