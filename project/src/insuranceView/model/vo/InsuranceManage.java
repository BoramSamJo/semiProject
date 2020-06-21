package insuranceView.model.vo;

import java.io.Serializable;

public class InsuranceManage implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5603161753812866831L;
	private int rNum;
	private String memberName;
	private String enrollDate;
	private String status;
	private String insName;
	private String insContent;
	private int price;
	private String phone;
	private int insNo;
	private String email;
	
	public InsuranceManage() {
	}
	

	public InsuranceManage(String memberName, String enrollDate, String status, String insName, String insContent,
			int price, String phone, int insNo, String email) {
		this.memberName = memberName;
		this.enrollDate = enrollDate;
		this.status = status;
		this.insName = insName;
		this.insContent = insContent;
		this.price = price;
		this.phone = phone;
		this.insNo = insNo;
		this.email = email;
	}


	public InsuranceManage(int rNum, String memberName, String enrollDate, String status, String insName,
			String insContent, int price, String phone, int insNo, String email) {
		this.rNum = rNum;
		this.memberName = memberName;
		this.enrollDate = enrollDate;
		this.status = status;
		this.insName = insName;
		this.insContent = insContent;
		this.price = price;
		this.phone = phone;
		this.insNo = insNo;
		this.email = email;
	}


	public int getrNum() {
		return rNum;
	}


	public void setrNum(int rNum) {
		this.rNum = rNum;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getInsName() {
		return insName;
	}


	public void setInsName(String insName) {
		this.insName = insName;
	}


	public String getInsContent() {
		return insContent;
	}


	public void setInsContent(String insContent) {
		this.insContent = insContent;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public int getInsNo() {
		return insNo;
	}


	public void setInsNo(int insNo) {
		this.insNo = insNo;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	@Override
	public String toString() {
		return "InsuranceManage [rNum=" + rNum + ", memberName=" + memberName + ", enrollDate=" + enrollDate
				+ ", status=" + status + ", insName=" + insName + ", insContent=" + insContent + ", price=" + price
				+ ", phone=" + phone + ", insNo=" + insNo + ", email=" + email + "]";
	}
	
	
	
	
}
