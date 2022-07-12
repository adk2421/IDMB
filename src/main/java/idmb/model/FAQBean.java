package idmb.model;

public class FAQBean {

	private int f_num;				// FAQ 번호
	private String f_category;		// FAQ 구분
	private String f_title;			// FAQ 제목
	private String f_contents;		// FAQ 내용


	public int getF_num() {
		return f_num;
	}

	public void setF_num(int f_num) {
		this.f_num = f_num;
	}

	public String getF_category() {
		return f_category;
	}

	public void setF_category(String f_category) {
		this.f_category = f_category;
	}

	public String getF_title() {
		return f_title;
	}

	public void setF_title(String f_title) {
		this.f_title = f_title;
	}

	public String getF_contents() {
		return f_contents;
	}

	public void setF_contents(String f_contents) {
		this.f_contents = f_contents;
	}

}
