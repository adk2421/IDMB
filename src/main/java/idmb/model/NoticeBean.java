package idmb.model;

import java.sql.Timestamp;

public class NoticeBean {

	private int n_num;				// 공지 번호
	private String n_title;			// 공지 제목
	private String n_contents;		// 공지 내용
	private Timestamp n_date;			// 공지 날짜
	private int n_hit;				// 조회수
	
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_contents() {
		return n_contents;
	}
	public void setN_contents(String n_contents) {
		this.n_contents = n_contents;
	}
	public Timestamp getN_date() {
		return n_date;
	}
	public void setN_date(Timestamp n_date) {
		this.n_date = n_date;
	}
	public int getN_hit() {
		return n_hit;
	}
	public void setN_hit(int n_hit) {
		this.n_hit = n_hit;
	}
}
