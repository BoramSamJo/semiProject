package board.model.vo;

import java.io.Serializable;

public class QAnswer implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int qaNo;
	private int mNo;
	private int qNo;
	private String aContent;
	private String createDate;
	private String modifyDate;
	private String status;
	
	
	public QAnswer() {
	}
	public QAnswer(int qaNo, int mNo, int qNo, String aContent, String createDate, String modifyDate, String status) {
		this.qaNo = qaNo;
		this.mNo = mNo;
		this.qNo = qNo;
		this.aContent = aContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}
	
	
	public int getQaNo() {
		return qaNo;
	}
	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
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
	
	
	@Override
	public String toString() {
		return "QAnswer [qaNo=" + qaNo + ", mNo=" + mNo + ", qNo=" + qNo + ", aContent=" + aContent + ", createDate="
				+ createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	
}
