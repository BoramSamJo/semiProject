package myPage.model.vo;

import java.io.Serializable;

public class Insurance implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4812752226903926822L;
	private String insCode;		// 보험고유넘버
	private String insName;		// 보험이름
	private String insContent;	// 보험내용
	private String kind;		// 보험적용동물품종
	private int age;			// 동물나이
	private int price;			// 보험가격
	
	public Insurance() {
	}

	public Insurance(String insCode, String insName, String insContent, String kind, int age, int price) {
		this.insCode = insCode;
		this.insName = insName;
		this.insContent = insContent;
		this.kind = kind;
		this.age = age;
		this.price = price;
	}

	public String getInsCode() {
		return insCode;
	}

	public void setInsCode(String insCode) {
		this.insCode = insCode;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
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
		return "insurance [insCode=" + insCode + ", insName=" + insName + ", insContent=" + insContent + ", kind="
				+ kind + ", age=" + age + ", price=" + price + "]";
	}
	
}
