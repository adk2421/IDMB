package idmb.model;

import java.sql.Timestamp;
import java.util.Date;

public class OrderBean {

	private int o_num;				// 주문 번호
	private String o_id;			// 주문자
	private int o_code;				// 주문 상품 코드
	private Timestamp o_date;			// 주문 날짜
	private String o_name;			// 주문 상품 이름
	private int o_count;			// 주문 상품 수량
	private int o_price;			// 주문 상품 가격
	private int o_total;			// 주문 상품 총 금액
	private String o_postcode;		// 배송지 우편번호
	private String o_address1;		// 배송지 주소
	private String o_address2;		// 배송지 상세주소
	private String o_status;		// 배송 상태
	private String o_delflag;		// 주문 삭제 여부
	private String o_reciever;		// 수취인
	private int o_phone;			// 수취인 번호

	public int getO_num() {
		return o_num;
	}

	public void setO_num(int o_num) {
		this.o_num = o_num;
	}

	public String getO_id() {
		return o_id;
	}

	public void setO_id(String o_id) {
		this.o_id = o_id;
	}

	public int getO_code() {
		return o_code;
	}

	public void setO_code(int o_code) {
		this.o_code = o_code;
	}

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Timestamp o_date) {
		this.o_date = o_date;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public int getO_count() {
		return o_count;
	}

	public void setO_count(int o_count) {
		this.o_count = o_count;
	}

	public int getO_price() {
		return o_price;
	}

	public void setO_price(int o_price) {
		this.o_price = o_price;
	}

	public int getO_total() {
		return o_total;
	}

	public void setO_total(int o_total) {
		this.o_total = o_total;
	}

	public String getO_postcode() {
		return o_postcode;
	}

	public void setO_postcode(String o_postcode) {
		this.o_postcode = o_postcode;
	}

	public String getO_address1() {
		return o_address1;
	}

	public void setO_address1(String o_address1) {
		this.o_address1 = o_address1;
	}

	public String getO_address2() {
		return o_address2;
	}

	public void setO_address2(String o_address2) {
		this.o_address2 = o_address2;
	}

	public String getO_status() {
		return o_status;
	}

	public void setO_status(String o_status) {
		this.o_status = o_status;
	}

	public String getO_delflag() {
		return o_delflag;
	}

	public void setO_delflag(String o_delflag) {
		this.o_delflag = o_delflag;
	}

	public String getO_reciever() {
		return o_reciever;
	}

	public void setO_reciever(String o_reciever) {
		this.o_reciever = o_reciever;
	}
	
	public int getO_phone() {
		return o_phone;
	}

	public void setO_rphone(int o_phone) {
		this.o_phone = o_phone;
	}

}
