package myPage.model.vo;

import java.io.Serializable;

public class IList implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4812752226903926822L;
	private int insNo;
	private String insCode;
	private int memberNo;
	private String enrollDate;
	private String status;
	private String insName;
	private String insContent;
	private String kind;
	private String age;
	private int price;
	
	public IList() {
	}

	public IList(int insNo, String insCode, int memberNo, String enrollDate, String status, String insName,
			String insContent, String kind, String age, int price) {
		this.insNo = insNo;
		this.insCode = insCode;
		this.memberNo = memberNo;
		this.enrollDate = enrollDate;
		this.status = status;
		this.insName = insName;
		this.insContent = insContent;
		this.kind = kind;
		this.age = age;
		this.price = price;
	}

	public int getInsNo() {
		return insNo;
	}

	public void setInsNo(int insNo) {
		this.insNo = insNo;
	}

	public String getInsCode() {
		return insCode;
	}

	public void setInsCode(String insCode) {
		this.insCode = insCode;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "IList [insNo=" + insNo + ", insCode=" + insCode + ", memberNo=" + memberNo + ", enrollDate="
				+ enrollDate + ", status=" + status + ", insName=" + insName + ", insContent=" + insContent + ", kind="
				+ kind + ", age=" + age + ", price=" + price + "]";
	}

	
	

	
}
