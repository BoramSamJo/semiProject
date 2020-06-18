package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1616767325155943627L;
	private int fileNo;
	private int sbNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	
	public Attachment() {
		super();
	}
	
	public Attachment(int fileNo, int sbNo, String originName, String changeName, String filePath, Date uploadDate) {
		super();
		this.fileNo = fileNo;
		this.sbNo = sbNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getSbNo() {
		return sbNo;
	}

	public void setSbNo(int sbNo) {
		this.sbNo = sbNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", sbNo=" + sbNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + "]";
	}
	
	
}
