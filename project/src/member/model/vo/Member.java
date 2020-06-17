package member.model.vo;

import java.io.Serializable;

public class Member implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4682182484310434843L;
	private int mNo;
	private int insCode;
	private String mId;
	private String mPwd;
	private String mName;
	private String phone;
	private String email;
	private String address;
	private String enrollDate;
	private String modifyDate;
	private String status;
	private String mailServie;
	
	public Member() {
	}
	public Member(int mNo, int insCode, String mId, String mPwd, String mName, String phone, String email,
			String address, String enrollDate, String modifyDate, String status) {
		this.mNo = mNo;
		this.insCode = insCode;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}
	
	public Member(int mNo, int insCode, String mId, String mPwd, String mName, String phone, String email,
			String address, String enrollDate, String modifyDate, String status, String mailServie) {
		this.mNo = mNo;
		this.insCode = insCode;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.mailServie = mailServie;
	}

	public Member(String mId, String mName, String email) {
		this.mId = mId;
		this.mName = mName;
		this.email = email;
	}
	public Member(String mId, String mPwd) {
		this.mId = mId;
		this.mPwd = mPwd;
	}
	
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public int getInsCode() {
		return insCode;
	}
	public void setInsCode(int insCode) {
		this.insCode = insCode;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPwd() {
		return mPwd;
	}
	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getMailServie() {
		return mailServie;
	}
	public void setMailServie(String mailServie) {
		this.mailServie = mailServie;
	}
	
	
	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", insCode=" + insCode + ", mId=" + mId + ", mPwd=" + mPwd + ", mName=" + mName
				+ ", phone=" + phone + ", email=" + email + ", address=" + address + ", enrollDate=" + enrollDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + ", mailServie=" + mailServie + "]";
	}
	
	
	
	
	
}
