package kr.co.doogle.paging;

public class Paging {
 
	private StringBuilder sb;
	private int viewCnt = 10;				// 한페이지 보여지는 row 수
	private int pageViewCnt = 10;			// 페이지 표시 수
	private int totalCnt = 0;				// 전체 row 수
	private int pageTotalCnt = 0;			// 전체 페이지 수
	private int pageGroupToltalCnt = 1;		// 전체 페이지 그룹 수	
	private int page = 1;					// 현재 페이지
	private int startPage = 1;				// 시작 페이지
	private int endPage = 1;				// 끝 페이지
	private int startRow = 1;				// 시작 줄번호
	private int endRow = 1;					// 끝 줄번호
	private int pageGroup = 1;				// 현재 페이지 그룹번호
	private String pageHtml = "";			// 페이지 HTML
	private boolean prev;					// prev 버튼 상태
	private boolean next;					// next 버튼 상태

	public Paging() {		
		System.out.println("constructor");
		setPaging(page, totalCnt);
	}

	public Paging(int page, int totalCnt) {
		System.out.println("arg constructor");
		setPaging(page, totalCnt);
	}

	public void setPaging(int page, int totalCnt) {
		this.page = page;
		this.totalCnt = totalCnt;

		startRow = (page - 1) * viewCnt + 1;
		endRow = startRow + viewCnt - 1;
		pageTotalCnt = (totalCnt - 1) / viewCnt + 1;
		startPage = (page - 1) / pageViewCnt * pageViewCnt + 1;
		endPage = startPage + pageViewCnt - 1;
		pageGroupToltalCnt = (int)Math.ceil(pageTotalCnt / (pageViewCnt * 1.0d));
		pageGroup = (int)Math.ceil(page / (pageViewCnt * 1.0d));

		if (endPage > pageTotalCnt)
			endPage = pageTotalCnt;

		// 이전 버튼 상태
		prev = pageGroup == 1 ? false : true;
		// 다음 버튼 상태
		next = pageGroup < pageGroupToltalCnt ? true : false;

		setPagingHtml();
	}

	public void setPagingHtml() {
		sb = new StringBuilder();

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

	public int getPageViewCnt() {
		return pageViewCnt;
	}

	public void setPageViewCnt(int pageViewCnt) {
		this.pageViewCnt = pageViewCnt;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getPageTotalCnt() {
		return pageTotalCnt;
	}

	public void setPageTotalCnt(int pageTotalCnt) {
		this.pageTotalCnt = pageTotalCnt;
	}

	public int getPageGroupToltalCnt() {
		return pageGroupToltalCnt;
	}

	public void setPageGroupToltalCnt(int pageGroupToltalCnt) {
		this.pageGroupToltalCnt = pageGroupToltalCnt;
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

	public int getPageGroup() {
		return pageGroup;
	}

	public void setPageGroup(int pageGroup) {
		this.pageGroup = pageGroup;
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
		return "Paging [viewCnt=" + viewCnt + ", pageViewCnt=" + pageViewCnt + ", totalCnt=" + totalCnt
				+ ", pageTotalCnt=" + pageTotalCnt + ", pageGroupToltalCnt=" + pageGroupToltalCnt + ", page=" + page
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", pageGroup=" + pageGroup + ", prev=" + prev + ", next=" + next + "]";
	}

//	public static void main(String[] args) {
//		Paging p = new Paging();
//		Paging p = new Paging(1, 101);
//		p.setPageViewCnt(5);
//		p.setPaging(11, 101);
//		System.out.println(p.toString());
//	}

}