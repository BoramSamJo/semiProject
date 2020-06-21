package calendar.model.vo;

import java.io.Serializable;

public class CalendarViews implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5405082456128569963L;
	private int reservationNo;
	private int productNo;
	private int aNo;
	private int memberNo;
	private String reservationDate;
	private String reservationTime;
	private String status;
	private String productName;
	private int price;
	private String aName;
	private String kind;
	private int weight;
	private String memberName;
	
	public CalendarViews() {
	}

	public CalendarViews(int reservationNo, int productNo, int aNo, int memberNo, String reservationDate,
			String reservationTime, String status, String productName, int price, String aName, String kind, int weight,
			String memberName) {
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
		this.kind = kind;
		this.weight = weight;
		this.memberName = memberName;
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

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "CalendarViews [reservationNo=" + reservationNo + ", productNo=" + productNo + ", aNo=" + aNo
				+ ", memberNo=" + memberNo + ", reservationDate=" + reservationDate + ", reservationTime="
				+ reservationTime + ", status=" + status + ", productName=" + productName + ", price=" + price
				+ ", aName=" + aName + ", kind=" + kind + ", weight=" + weight + ", memberName=" + memberName + "]";
	}

}
