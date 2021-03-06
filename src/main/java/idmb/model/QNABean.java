package idmb.model;

import java.util.Date;

public class QNABean {

	private int q_num;				// 문의 번호
	private String q_id;			// 문의 작성자
	private int q_code;				// 문의 상품코드
	private String q_category;		// 문의 구분
	private String q_title;			// 문의 제목
	private String q_contents;		// 문의 내용
	private Date q_date;			// 문의 날짜
	private String q_product;		// 문의 상품
	private String q_status;		// 문의 상태
	private String q_contentspw;	// 문의 게시글 암호
	private int q_relevel;			// 문의 답글 여부
	private int q_groupnum;			// 문의 그룹 번호


	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getQ_id() {
		return q_id;
	}

	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}

	public int getQ_code() {
		return q_code;
	}

	public void setQ_code(int q_code) {
		this.q_code = q_code;
	}

	public String getQ_category() {
		return q_category;
	}

	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_contents() {
		return q_contents;
	}

	public void setQ_contents(String q_contents) {
		this.q_contents = q_contents;
	}

	public Date getQ_date() {
		return q_date;
	}

	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}

	public String getQ_product() {
		return q_product;
	}

	public void setQ_product(String q_product) {
		this.q_product = q_product;
	}

	public String getQ_status() {
		return q_status;
	}

	public void setQ_status(String q_status) {
		this.q_status = q_status;
	}

	public String getQ_contentspw() {
		return q_contentspw;
	}

	public void setQ_contentspw(String q_contentspw) {
		this.q_contentspw = q_contentspw;
	}

	public int getQ_relevel() {
		return q_relevel;
	}

	public void setQ_relevel(int q_relevel) {
		this.q_relevel = q_relevel;
	}

	public int getQ_groupnum() {
		return q_groupnum;
	}

	public void setQ_groupnum(int q_groupnum) {
		this.q_groupnum = q_groupnum;
	}
	
}
