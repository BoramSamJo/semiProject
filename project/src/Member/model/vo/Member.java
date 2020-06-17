package Member.model.vo;

import java.io.Serializable;

public class Member implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1830203434908932392L;
	
	private String userId;
	private String phone;
	private String address;
	public Member() {
		super();
	}
	
	
	public Member(String userId) {
		this.userId = userId;
	}


	public Member(String userId, String phone, String address) {
		super();
		this.userId = userId;
		this.phone = phone;
		this.address = address;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", phone=" + phone + ", address=" + address + "]";
	}
	
	
	
}
