package Funeral.model.vo;

import java.io.Serializable;

public class Reservation implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -70043624326401290L;	
	private String plusDate;		//날짜
	private String plusTime;		//시간
	private String funeralSelect;	//장례서비스여부
	private String funeralSelect1;	//수의여부
	private String funeralSelect2;	//관여부
	private String funeralSelect3;	//화장후 여부
	/* 다른테이블에서 불러올 값 */
	private String userName;		//예약자명
	private String phone;			//예약자번호
    private String address;			//예약자주소
    /* 기존 테이블에 있을 값 */
    private String pName;			//반려동물명
    private String pWeight;			//반려동물무게
    private String pKindMain;		//반려동물종류
    private String pKindService;	//반려동물품종
	public Reservation() {
		super();
	}
	public Reservation(String plusDate, String plusTime, String funeralSelect, String funeralSelect1,
			String funeralSelect2, String funeralSelect3, String userName, String phone, String address, String pName,
			String pWeight, String pKindMain, String pKindService) {
		super();
		this.plusDate = plusDate;
		this.plusTime = plusTime;
		this.funeralSelect = funeralSelect;
		this.funeralSelect1 = funeralSelect1;
		this.funeralSelect2 = funeralSelect2;
		this.funeralSelect3 = funeralSelect3;
		this.userName = userName;
		this.phone = phone;
		this.address = address;
		this.pName = pName;
		this.pWeight = pWeight;
		this.pKindMain = pKindMain;
		this.pKindService = pKindService;
	}
	public String getPlusDate() {
		return plusDate;
	}
	public void setPlusDate(String plusDate) {
		this.plusDate = plusDate;
	}
	public String getPlusTime() {
		return plusTime;
	}
	public void setPlusTime(String plusTime) {
		this.plusTime = plusTime;
	}
	public String getFuneralSelect() {
		return funeralSelect;
	}
	public void setFuneralSelect(String funeralSelect) {
		this.funeralSelect = funeralSelect;
	}
	public String getFuneralSelect1() {
		return funeralSelect1;
	}
	public void setFuneralSelect1(String funeralSelect1) {
		this.funeralSelect1 = funeralSelect1;
	}
	public String getFuneralSelect2() {
		return funeralSelect2;
	}
	public void setFuneralSelect2(String funeralSelect2) {
		this.funeralSelect2 = funeralSelect2;
	}
	public String getFuneralSelect3() {
		return funeralSelect3;
	}
	public void setFuneralSelect3(String funeralSelect3) {
		this.funeralSelect3 = funeralSelect3;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpWeight() {
		return pWeight;
	}
	public void setpWeight(String pWeight) {
		this.pWeight = pWeight;
	}
	public String getpKindMain() {
		return pKindMain;
	}
	public void setpKindMain(String pKindMain) {
		this.pKindMain = pKindMain;
	}
	public String getpKindService() {
		return pKindService;
	}
	public void setpKindService(String pKindService) {
		this.pKindService = pKindService;
	}
	@Override
	public String toString() {
		return "Reservation [plusDate=" + plusDate + ", plusTime=" + plusTime + ", funeralSelect=" + funeralSelect
				+ ", funeralSelect1=" + funeralSelect1 + ", funeralSelect2=" + funeralSelect2 + ", funeralSelect3="
				+ funeralSelect3 + ", userName=" + userName + ", phone=" + phone + ", address=" + address + ", pName="
				+ pName + ", pWeight=" + pWeight + ", pKindMain=" + pKindMain + ", pKindService=" + pKindService + "]";
	}
	
	
	
	
    
    
	
    
}
