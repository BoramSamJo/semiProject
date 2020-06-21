package funeral.model.vo;

import java.io.Serializable;

public class Reservation implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -70043624326401290L;
	private static final String pKindService = null;	
	private String plusDate;		//�궇吏�
	private String plusTime;		//�떆媛�
	private String funeralSelect;	//�옣濡��꽌鍮꾩뒪�뿬遺�
	private String funeralSelect1;	//�닔�쓽�뿬遺�
	private String funeralSelect2;	//愿��뿬遺�
	private String funeralSelect3;	//�솕�옣�썑 �뿬遺�
	/* �떎瑜명뀒�씠釉붿뿉�꽌 遺덈윭�삱 媛� */
	private String userName;		//�삁�빟�옄紐�
	private String phone;			//�삁�빟�옄踰덊샇
    private String address;			//�삁�빟�옄二쇱냼
    /* 湲곗〈 �뀒�씠釉붿뿉 �엳�쓣 媛� */
    private String pName;			//諛섎젮�룞臾쇰챸
    private String pWeight;			//諛섎젮�룞臾쇰Т寃�
    private String pKindMain;		//諛섎젮�룞臾쇱쥌瑜�
    private String pKindServe;	//諛섎젮�룞臾쇳뭹醫�
	public Reservation() {
		super();
	}
	

	public Reservation(String plusDate, String plusTime, String funeralSelect, String funeralSelect1,
			String funeralSelect2, String funeralSelect3, String userName, String phone, String address, String pName,
			String weight, String pKindMain, String pKindServe) {
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
		this.pWeight = weight;
		this.pKindMain = pKindMain;
		this.pKindServe = pKindServe;
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
	public String getpKindServe() {
		return pKindServe;
	}
	public void setpKindServe(String pKindServe) {
		this.pKindServe = pKindServe;
	}
	@Override
	public String toString() {
		return "Reservation [plusDate=" + plusDate + ", plusTime=" + plusTime + ", funeralSelect=" + funeralSelect
				+ ", funeralSelect1=" + funeralSelect1 + ", funeralSelect2=" + funeralSelect2 + ", funeralSelect3="
				+ funeralSelect3 + ", userName=" + userName + ", phone=" + phone + ", address=" + address + ", pName="
				+ pName + ", pWeight=" + pWeight + ", pKindMain=" + pKindMain + ", pKindServe=" + pKindServe + "]";
	}
	
	
	
	
    
    
	
    
}
