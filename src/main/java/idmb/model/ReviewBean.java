package idmb.model;

import java.sql.Date;

public class ReviewBean {
	
	private int r_num; // 리뷰 번호
	private String r_id; // 구매자 (= 리뷰 작성자)
	private int r_code; // 구매 상품 코드
	private Date r_date; // 후기 작성 날짜
	private String r_name; // 구매 상품 이름
	private String r_contents; // 리뷰 내용
	private int r_rate; // 별점
	private int r_recommend; // 추천수
	private int r_relevel; // 후기 답글 여부
	private int r_groupnum; // 후기 그룹 번호
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public int getR_code() {
		return r_code;
	}
	public void setR_code(int r_code) {
		this.r_code = r_code;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_contents() {
		return r_contents;
	}
	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}
	public int getR_rate() {
		return r_rate;
	}
	public void setR_rate(int r_rate) {
		this.r_rate = r_rate;
	}
	public int getR_recommend() {
		return r_recommend;
	}
	public void setR_recommend(int r_recommend) {
		this.r_recommend = r_recommend;
	}
	public int getR_relevel() {
		return r_relevel;
	}
	public void setR_relevel(int r_relevel) {
		this.r_relevel = r_relevel;
	}
	public int getR_groupnum() {
		return r_groupnum;
	}
	public void setR_groupnum(int r_groupnum) {
		this.r_groupnum = r_groupnum;
	}

}