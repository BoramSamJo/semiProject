package calendar.model.vo;

import java.io.Serializable;

public class CalendarData implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3445797096260886430L;
	private int reservationNo;			// 예약번호
	private int productNo;				// 장례상품 번호
	private int aNo;					// 반려동물고유번호
	private int memberNo;				// 회원번호
	private String reservationDate;		// 예약날짜
	private String reservationTime;		// 예약 시간
	private String status;				// 취소여부
	
	public CalendarData() {
	}
	


	public CalendarData(int reservationNo, int productNo, String reservationDate, String reservationTime) {
		this.reservationNo = reservationNo;
		this.productNo = productNo;
		this.reservationDate = reservationDate;
		this.reservationTime = reservationTime;
	}



	public CalendarData(int reservationNo, int productNo, int aNo, int memberNo, String reservationDate,
			String reservationTime, String status) {
		super();
		this.reservationNo = reservationNo;
		this.productNo = productNo;
		this.aNo = aNo;
		this.memberNo = memberNo;
		this.reservationDate = reservationDate;
		this.reservationTime = reservationTime;
		this.status = status;
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

	@Override
	public String toString() {
		return "CalendarData [reservationNo=" + reservationNo + ", productNo=" + productNo + ", aNo=" + aNo
				+ ", memberNo=" + memberNo + ", reservationDate=" + reservationDate + ", reservationTime="
				+ reservationTime + ", status=" + status + "]";
	}

}
