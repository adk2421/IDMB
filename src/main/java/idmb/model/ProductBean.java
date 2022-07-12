package idmb.model;

import java.util.Date;

public class ProductBean {
	private int p_code; // 상품 코드 
	private String p_name; // 상품 이름
	private String p_image; // 상품 이미지
	private int p_price; // 상품 가격
	private int p_stock; // 상품 개수
	private int p_sell; // 상품 판매량
	private String p_kind; // 상품 종류
	private Date p_date; // 상품 등록 날짜
	private String p_detail; // 상품 상세 정보
	private int p_zim; // 찜한 수
	private String p_delflag; // 상품 삭제 여부
	public int getP_code() {
		return p_code;
	}
	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_stock() {
		return p_stock;
	}
	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	public int getP_sell() {
		return p_sell;
	}
	public void setP_sell(int p_sell) {
		this.p_sell = p_sell;
	}
	public String getP_kind() {
		return p_kind;
	}
	public void setP_kind(String p_kind) {
		this.p_kind = p_kind;
	}
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	public String getP_detail() {
		return p_detail;
	}
	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}
	public int getP_zim() {
		return p_zim;
	}
	public void setP_zim(int p_zim) {
		this.p_zim = p_zim;
	}
	public String getP_delflag() {
		return p_delflag;
	}
	public void setP_delflag(String p_delflag) {
		this.p_delflag = p_delflag;
	}

}