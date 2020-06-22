package funeral.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Fu_List implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -740723883791380593L;
	private int reservationNo;
	private int productNo;
	private int aNo;
	private Date reservationDate;
	private String reservationTime;
	private String status;
	private String selectCode;
	public Fu_List() {
		super();
	}
	public Fu_List(int reservationNo, int productNo, int aNo, Date reservationDate, String reservationTime,
			String status, String selectCode) {
		super();
		this.reservationNo = reservationNo;
		this.productNo = productNo;
		this.aNo = aNo;
		this.reservationDate = reservationDate;
		this.reservationTime = reservationTime;
		this.status = status;
		this.selectCode = selectCode;
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
	public Date getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(Date reservationDate) {
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
	public String getSelectCode() {
		return selectCode;
	}
	public void setSelectCode(String selectCode) {
		this.selectCode = selectCode;
	}
	@Override
	public String toString() {
		return "Fu_List [reservationNo=" + reservationNo + ", productNo=" + productNo + ", aNo=" + aNo
				+ ", reservationDate=" + reservationDate + ", reservationTime=" + reservationTime + ", status=" + status
				+ ", selectCode=" + selectCode + "]";
	}
	
	
	
}
