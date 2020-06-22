package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SketchBoard implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4609252334573919944L;
	private int sbNo;			//스케치북 게시글 번호
	private int memberNo;		//회원번호
	private String sbTitle;		//게시글 제목 
	private String sbContent;	//게시글 내용
	private Date createDate;	//작성일
	private Date modifyDate;	//수정일
	private int count;			//조회수
	private String status;		//회원탈퇴여부
	private String memberName;
	
	public SketchBoard() {
		super();
	}

	
	public SketchBoard(int sbNo) {
		super();
		this.sbNo = sbNo;
	}



	public SketchBoard(int sbNo, int memberNo, String sbTitle, String sbContent, Date createDate, Date modifyDate,
			int count, String status) {
		this.sbNo = sbNo;
		this.memberNo = memberNo;
		this.sbTitle = sbTitle;
		this.sbContent = sbContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.count = count;
		this.status = status;
	}
	
	

	public SketchBoard(int sbNo, int memberNo, String sbTitle, String sbContent, Date createDate, Date modifyDate,
			int count, String status, String memberName) {
		super();
		this.sbNo = sbNo;
		this.memberNo = memberNo;
		this.sbTitle = sbTitle;
		this.sbContent = sbContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.count = count;
		this.status = status;
		this.memberName = memberName;
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

	public String getSbTitle() {
		return sbTitle;
	}

	public void setSbTitle(String sbTitle) {
		this.sbTitle = sbTitle;
	}

	public String getSbContent() {
		return sbContent;
	}

	public void setSbContent(String sbContent) {
		this.sbContent = sbContent;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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
		return "SketchBoard [sbNo=" + sbNo + ", memberNo=" + memberNo + ", sbTitle=" + sbTitle + ", sbContent="
				+ sbContent + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", count=" + count
				+ ", status=" + status + "]";
	}
	
	
	
}