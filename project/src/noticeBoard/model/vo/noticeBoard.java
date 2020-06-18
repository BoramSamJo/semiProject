package noticeBoard.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class noticeBoard implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -229766387432222095L;
	
	private int nNo;			//공지사항 번호
	private int memberNo;		//회원번호
	private String nTitle;		//공지사항 제목
	private String nContent;	//공지사항 내용
	private Date createDate;	//생성날짜
	private Date modifyDate;	//수정날짜
	private String status;		//삭제여부
	
	public noticeBoard() {
	}
	
	

	public noticeBoard(int nNo, int memberNo, String nTitle, String nContent) {
		super();
		this.nNo = nNo;
		this.memberNo = memberNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
	}



	//수정(update)을 위한 생성자
	public noticeBoard(int nNo, String nTitle, String nContent) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
	}


	public noticeBoard(int nNo, int memberNo, String nTitle, String nContent, Date createDate, Date modifyDate,
			String status) {
		super();
		this.nNo = nNo;
		this.memberNo = memberNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
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

	@Override
	public String toString() {
		return "noticeBoard [nNo=" + nNo + ", memberNo=" + memberNo + ", nTitle=" + nTitle + ", nContent=" + nContent
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	
	
	
	
}
