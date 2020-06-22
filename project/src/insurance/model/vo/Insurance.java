package insurance.model.vo;

import java.io.Serializable;

public class Insurance implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6080606541098163966L;
	private String insCode;
	private String insName;
	private String insContent;
	private String kind;
	private int age;
	private int price;
	
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

	
	public Insurance(String insName, String insContent, String kind, int age, int price) {
		this.insName = insName;
		this.insContent = insContent;
		this.kind = kind;
		this.age = age;
		this.price = price;
	}


	public Insurance(String kind, int age) {
		this.kind = kind;
		this.age = age;
	}
	


	public Insurance(String insName, String insContent, int price) {
		super();
		this.insName = insName;
		this.insContent = insContent;
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
		return "Insurance [insCode=" + insCode + ", insName=" + insName + ", insContent=" + insContent + ", kind="
				+ kind + ", age=" + age + ", price=" + price + "]";
	}

	
}


