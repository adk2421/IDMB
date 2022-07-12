package idmb.model;

public class BasketBean {
	
	private int b_num;     //장바구니번호 
	private String b_id;   //장바구니 주인
	private int b_code;	   //상품코드
	private String b_name; //상품이름
	private int b_price;   //상품가격
	private int b_count;   //상품수량
	private String b_image;  //상품이미지
	private String b_kind; //상품종류
	
	
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public int getB_code() {
		return b_code;
	}
	public void setB_code(int b_code) {
		this.b_code = b_code;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public int getB_price() {
		return b_price;
	}
	public void setB_price(int b_price) {
		this.b_price = b_price;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	public String getB_img() {
		return b_image;
	}
	public void setB_img(String b_img) {
		this.b_image = b_img;
	}
	public String getB_kind() {
		return b_kind;
	}
	public void setB_kind(String b_kind) {
		this.b_kind = b_kind;
	}
	
}