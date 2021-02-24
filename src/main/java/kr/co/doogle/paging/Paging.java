package kr.co.doogle.paging;

public class Paging {

	private StringBuilder sb;
	private int viewCnt = 10;				// 한페이지 보여지는 수
	private int totalCnt = 10;				// 전체 row 수
	private int rowRangeCnt = 10;			// 초기값으로 페이지범위를 10으로 셋팅
	private int page;						// 현재 페이지
	private int startPage;					// 시작 페이지
	private int endPage;					// 끝 페이지
	private int pageTotalCnt;				// 전체 페이지 수	
	private int startRow;					// 시작 줄번호
	private int endRow;						// 끝 줄번호
	private int RowTotalCnt;				// 전체 줄 수
	private int RowCnt;						// 페이지 표시 수
	private String pageHtml;				// 페이지 HTML	
	private boolean prev;
	private boolean next;

	public void setPaging(int totalCnt) {
		this.totalCnt = totalCnt;
		startRow = (page - 1) * viewCnt + 1;
		endRow = startRow + viewCnt -1;

		// 이전 버튼 상태
		prev = rowRangeCnt == 1 ? false : true;
		// 다음 버튼 상태
		next = endPage > RowCnt ? false : true;

		if (endPage > RowCnt) {
			endPage = RowCnt;
			next = false;
		}

		pageTotalCnt = (RowTotalCnt - 1) / RowCnt + 1;
		startPage = (page - 1) / rowRangeCnt * rowRangeCnt + 1;
		endPage = startPage + rowRangeCnt - 1;
		if(endPage > pageTotalCnt) endPage = pageTotalCnt;

		setPagingHtml();
	}

	public void setPagingHtml() {
		if (prev)
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#\">Prev</a></li>");
		else
			sb.append("<li class=\"page-item disabled\"><a class=\"page-link\" href=\"#\">Prev</a></li>");

		sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#\">1</a></li>");

		if (next)
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#\">Next</a></li>");
		else
			sb.append("<li class=\"page-item disabled\"><a class=\"page-link\" href=\"#\">Next</a></li>");

		pageHtml = sb.toString();
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getRowRangeCnt() {
		return rowRangeCnt;
	}

	public void setRowRangeCnt(int rowRangeCnt) {
		this.rowRangeCnt = rowRangeCnt;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
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

	public int getPageTotalCnt() {
		return pageTotalCnt;
	}

	public void setPageTotalCnt(int pageTotalCnt) {
		this.pageTotalCnt = pageTotalCnt;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getRowTotalCnt() {
		return RowTotalCnt;
	}

	public void setRowTotalCnt(int rowTotalCnt) {
		RowTotalCnt = rowTotalCnt;
	}

	public int getRowCnt() {
		return RowCnt;
	}

	public void setRowCnt(int rowCnt) {
		RowCnt = rowCnt;
	}

	public String getPageHtml() {
		return pageHtml;
	}

	public void setPageHtml(String pageHtml) {
		this.pageHtml = pageHtml;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	@Override
	public String toString() {
		return "Paging [viewCnt=" + viewCnt + ", totalCnt=" + totalCnt + ", rowRangeCnt=" + rowRangeCnt + ", page="
				+ page + ", startPage=" + startPage + ", endPage=" + endPage + ", pageTotalCnt=" + pageTotalCnt
				+ ", startRow=" + startRow + ", endRow=" + endRow + ", RowTotalCnt=" + RowTotalCnt + ", RowCnt="
				+ RowCnt + ", prev=" + prev + ", next=" + next + "]";
	}

}