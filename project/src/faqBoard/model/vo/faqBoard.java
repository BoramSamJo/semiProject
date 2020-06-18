package faqBoard.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class faqBoard implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1419042349478418673L;
	
	private int fno;				//FAQ 글 번호
	private int cno;				//카테고리 번호
	private int memberNo;			//회원번호
	private String fTitle;			//FAQ 제목
	private String fContent;		//FAQ 내용
	private Date createDate;		//생성 날짜
	private Date modifyDage;		//수정 날짜
	private String status;			//삭제 여부
	
	
	public faqBoard() {
		super();
	}
	
	public faqBoard(int fno, int cno, int memberNo, String fTitle, String fContent, Date createDate, Date modifyDage,
			String status) {
		super();
		this.fno = fno;
		this.cno = cno;
		this.memberNo = memberNo;
		this.fTitle = fTitle;
		this.fContent = fContent;
		this.createDate = createDate;
		this.modifyDage = modifyDage;
		this.status = status;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getfTitle() {
		return fTitle;
	}

	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}

	public String getfContent() {
		return fContent;
	}

	public void setfContent(String fContent) {
		this.fContent = fContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDage() {
		return modifyDage;
	}

	public void setModifyDage(Date modifyDage) {
		this.modifyDage = modifyDage;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "faqBoard [fno=" + fno + ", cno=" + cno + ", memberNo=" + memberNo + ", fTitle=" + fTitle + ", fContent="
				+ fContent + ", createDate=" + createDate + ", modifyDage=" + modifyDage + ", status=" + status + "]";
	}
	
	
	
	
	
	
	
}
