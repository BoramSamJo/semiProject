package board.model.vo;

import java.sql.Date;

public class SbReply {
	
	private int rNo;
	private int sbNo;
	private int memberNo;
	private String rContent;
	private Date createDate;
	private Date modifyDate;
	private String status;
	private String memberName;

	
	public SbReply() {
		super();
	}


	public SbReply(int rNo, int sbNo, int memberNo, String rContent, Date createDate, Date modifyDate, String status, String memberName) {
		super();
		this.rNo = rNo;
		this.sbNo = sbNo;
		this.memberNo = memberNo;
		this.rContent = rContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.memberName = memberName;
	}

	

	public SbReply(int rNo, int sbNo) {
		super();
		this.rNo = rNo;
		this.sbNo = sbNo;
	}


	public SbReply(int sbNo, int memberNo, String rContent) {
		super();
		this.sbNo = sbNo;
		this.memberNo = memberNo;
		this.rContent = rContent;
	}


	public SbReply(int rNo, int sbNo, int memberNo, String rContent) {
		super();
		this.rNo = rNo;
		this.sbNo = sbNo;
		this.memberNo = memberNo;
		this.rContent = rContent;
	}

	
	

	public SbReply(int rNo, int sbNo, int memberNo) {
		super();
		this.rNo = rNo;
		this.sbNo = sbNo;
		this.memberNo = memberNo;
	}


	public int getrNo() {
		return rNo;
	}


	public void setrNo(int rNo) {
		this.rNo = rNo;
	}


	public int getSbNo() {
		return sbNo;
	}


	public void setSbNo(int sbNo) {
		this.sbNo = sbNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getrContent() {
		return rContent;
	}


	public void setrContent(String rContent) {
		this.rContent = rContent;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	
	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	@Override
	public String toString() {
		return "SbReply [rNo=" + rNo + ", sbNo=" + sbNo + ", memberNo=" + memberNo + ", rContent=" + rContent
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	
	
	
}
