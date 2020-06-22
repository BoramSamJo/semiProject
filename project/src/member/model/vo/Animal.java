package member.model.vo;

import java.io.Serializable;

public class Animal implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3864965501226129936L;
	private String aNo;
	private int mNo;
	private String aName;
	private String kind;
	private String weight;
	private String status;
	
	
	public Animal() {
	}
	
	public Animal(String aNo, int mNo, String aName, String kind, String weight, String status) {
		this.aNo = aNo;
		this.mNo = mNo;
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
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
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
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
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
	
	
	@Override
	public String toString() {
		return "Animal [aNo=" + aNo + ", mNo=" + mNo + ", aName=" + aName + ", kind=" + kind + ", weight=" + weight
				+ ", status=" + status + "]";
	}
	
	
}
