package board.model.vo;

import java.io.Serializable;

public class QnABoard implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5936050684188970879L;
	private int rowNum;
	private int qNo;
	private String mName;
	private String qTitle;
	private String qContent;
	private String createDate;
	private String modifyDate;
	private String qPwd;
	private String answer;
	private String qCName;//조인해서 카테고리명 가져올거라 string
	private String status;
	
	
	public QnABoard() {
	}
	public QnABoard(int rowNum, int qNo, String mName, String qTitle, String qContent, String createDate, String modifyDate,
			String qPwd, String answer, String qCName, String status) {
		this.rowNum = rowNum;
		this.qNo = qNo;
		this.mName = mName;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.qPwd = qPwd;
		this.answer = answer;
		this.qCName = qCName;
		this.status = status;
	}
	
	
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
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
	public String getqPwd() {
		return qPwd;
	}
	public void setqPwd(String qPwd) {
		this.qPwd = qPwd;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getqCName() {
		return qCName;
	}
	public void setqCName(String qCName) {
		this.qCName = qCName;
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
		return "QnABoard [rowNum=" + rowNum + ", qNo=" + qNo + ", mName=" + mName + ", qTitle=" + qTitle + ", qContent="
				+ qContent + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", qPwd=" + qPwd
				+ ", answer=" + answer + ", qCName=" + qCName + ", status=" + status + "]";
	}
	
	
	
}
