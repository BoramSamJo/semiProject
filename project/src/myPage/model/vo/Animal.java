package myPage.model.vo;

import java.io.Serializable;

public class Animal implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1378381011741285737L;
	private String aNo;		// 동물고유번호
	private int memberNo;	// 회원번호
	private String aName;	// 동물이름
	private String kind;	// 동물품종
	private int weight;		// 동물무게
	private String status;	// 사망여부
	
	public Animal() {
	}

	public Animal(String aNo, int memberNo) {
		this.aNo = aNo;
		this.memberNo = memberNo;
	}

	public Animal(int memberNo, String aName, String kind, int weight) {
		this.memberNo = memberNo;
		this.aName = aName;
		this.kind = kind;
		this.weight = weight;
	}

	public Animal(String aNo, int memberNo, String aName, String kind, int weight) {
		this.aNo = aNo;
		this.memberNo = memberNo;
		this.aName = aName;
		this.kind = kind;
		this.weight = weight;
	}

	public Animal(String aNo, int memberNo, String aName, String kind, int weight, String status) {
		this.aNo = aNo;
		this.memberNo = memberNo;
		this.aName = aName;
		this.kind = kind;
		this.weight = weight;
		this.status = status;
	}

	public String getaNo() {
		return aNo;
	}

	public void setaNo(String aNo) {
		this.aNo = aNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Animal [aNo=" + aNo + ", memberNo=" + memberNo + ", aName=" + aName + ", kind=" + kind + ", weight="
				+ weight + ", status=" + status + "]";
	}
	
	

}
