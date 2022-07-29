package idmb.util;

public class Paging {
	
	private int totalPage;
	private int pageBlock;
	private int startPage;
	private int endPage;
	private int currentPage;
	
	private StringBuffer pageHtml = new StringBuffer();
	
	public Paging(int totalCount, int pageBlock, int pageSize, int currentPage, String url, String searchUrl) {
		//페이징할 총 수, 페이지 블럭, 1페이지당 출력할 개수, 현재 페이지, 이동주소, 검색시 사용주소  
		totalPage = totalCount/pageSize + (totalCount%pageSize == 0 ? 0:1);
		
		this.pageBlock = pageBlock;
	
		startPage = (int)((currentPage-1)/pageBlock)*pageBlock + 1;
		endPage = startPage + pageBlock-1;
		if(endPage>totalPage) { // endPage가 페이지수보다 크다면 endPage를 페이지블록만큼 제한
			endPage = totalPage;
		}
		
		this.currentPage = currentPage;
		
		// pageHtml을 작성
		makePageHtml(url, searchUrl);
	}
	
	private void makePageHtml(String url, String searchUrl) {
		
		pageHtml.append("<div style=\"margin:auto; text-align: center;\">");
		pageHtml.append("<ul style=\"list-style-type: none;\">");
		
		for(int i=startPage;i<=endPage;i++) {
			if(i!=currentPage) {
				pageHtml.append("<li style=\"display:inline\"><a href=\"" + url + "?page=" + i + searchUrl + "\">" + i + "</a>&emsp;</li>");				
			} else {
				pageHtml.append("<li style=\"display:inline\"><span>" + i+ "</span>&emsp;</li>");				
			}
		}
		pageHtml.append("</ul></div>");
	}
	

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
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

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public StringBuffer getPageHtml() {
		return pageHtml;
	}

	public void setPageHtml(StringBuffer pageHtml) {
		this.pageHtml = pageHtml;
	}
}
