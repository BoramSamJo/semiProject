package noticeBoard.model.vo;

public class Pagenation {
	//페이지 처리 변수값 받아주는 객체만들기 위한 클래스
	
	private int currentPage;
	private int listCount;
	private int limit;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int pageBlock;
	private int pageCount;
	
	public Pagenation() {
	}

	public Pagenation(int currentPage, int listCount, int limit, int maxPage, int startPage, int endPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}


	public Pagenation(int currentPage, int listCount, int limit, int maxPage, int startPage, int endPage, int pageBlock,
			int pageCount) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.pageBlock = pageBlock;
		this.pageCount = pageCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	@Override
	public String toString() {
		return "Pagenation [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit + ", maxPage="
				+ maxPage + ", startPage=" + startPage + ", endPage=" + endPage + ", pageBlock=" + pageBlock
				+ ", pageCount=" + pageCount + "]";
	}

	
	
	
	

}
