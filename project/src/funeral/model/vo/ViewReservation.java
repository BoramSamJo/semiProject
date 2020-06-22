package funeral.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ViewReservation implements Serializable{
	

	/*
	 * 
	 */
	private static final long serialVersionUID = -113813619511564794L;
	
	private Date reservationDate;		// 예약날짜
	private String reservationTime;		// 예약시간
	private String prodcutName;			// 장례상품명
	private String selectShroud;		// 선택한 장례수의
	private String selectCoffin;		// 선택한 장례관
	private String selectCremation;		// 선택한 장례후 선택
	private String memberName;			// 예약자명
	private String phone;				// 예약자번호
	private String address;				// 예약자주소
	private String aName;				// 반려동물명
	private double weight;				// 반려동물무게
	private String kind;				// 반려동물 (종류)품종
	
	public ViewReservation() {
		super();
	}
	public ViewReservation(Date reservationDate, String reservationTime, String prodcutName, String selectShroud,
			String selectCoffin, String selectCremaion, String memberName, String phone, String address, String aName,
			double weight, String kind) {
		super();
		this.reservationDate = reservationDate;
		this.reservationTime = reservationTime;
		this.prodcutName = prodcutName;
		this.selectShroud = selectShroud;
		this.selectCoffin = selectCoffin;
		this.selectCremation = selectCremaion;
		this.memberName = memberName;
		this.phone = phone;
		this.address = address;
		this.aName = aName;
		this.weight = weight;
		this.kind = kind;
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
	public String getProdcutName() {
		return prodcutName;
	}
	public void setProdcutName(String prodcutName) {
		this.prodcutName = prodcutName;
	}
	public String getSelectShroud() {
		return selectShroud;
	}
	public void setSelectShroud(String selectShroud) {
		this.selectShroud = selectShroud;
	}
	public String getSelectCoffin() {
		return selectCoffin;
	}
	public void setSelectCoffin(String selectCoffin) {
		this.selectCoffin = selectCoffin;
	}
	public String getSelectCremaion() {
		return selectCremation;
	}
	public void setSelectCremaion(String selectCremaion) {
		this.selectCremation = selectCremaion;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	@Override
	public String toString() {
		return "veiwReservation [reservationDate=" + reservationDate + ", reservationTime=" + reservationTime
				+ ", prodcutName=" + prodcutName + ", selectShroud=" + selectShroud + ", selectCoffin=" + selectCoffin
				+ ", selectCremaion=" + selectCremation + ", memberName=" + memberName + ", phone=" + phone
				+ ", address=" + address + ", aName=" + aName + ", weight=" + weight + ", kind=" + kind + "]";
	}
	
	
	
}
