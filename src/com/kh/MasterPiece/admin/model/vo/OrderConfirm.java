package com.kh.MasterPiece.admin.model.vo;

import java.sql.Date;

public class OrderConfirm {

	private Date pay_date; 
	private String order_check; 
	private String prd_name; 
	private String user_id; 
	private int pay_price; 
	private String pay_way;
	private String pay_status;
	private String prd_code;
	private int count;
	
	
	
	public OrderConfirm() {
		super();
	}
	public OrderConfirm(Date pay_date, String order_check, String prd_name, String user_id, int pay_price,
			String pay_way, String pay_status, String prd_code) {
		super();
		this.pay_date = pay_date;
		this.order_check = order_check;
		this.prd_name = prd_name;
		this.user_id = user_id;
		this.pay_price = pay_price;
		this.pay_way = pay_way;
		this.pay_status = pay_status;
		this.prd_code = prd_code;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public String getOrder_check() {
		return order_check;
	}
	public void setOrder_check(String order_check) {
		this.order_check = order_check;
	}
	public String getPrd_name() {
		return prd_name;
	}
	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getPay_way() {
		return pay_way;
	}
	public void setPay_way(String pay_way) {
		this.pay_way = pay_way;
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}
	public String getPrd_code() {
		return prd_code;
	}
	public void setPrd_code(String prd_code) {
		this.prd_code = prd_code;
	}
	@Override
	public String toString() {
		return "OrderConfirm [pay_date=" + pay_date + ", order_check=" + order_check + ", prd_name=" + prd_name
				+ ", user_id=" + user_id + ", pay_price=" + pay_price + ", pay_way=" + pay_way + ", pay_status="
				+ pay_status + ", prd_code=" + prd_code + "]";
	}
	
	
}
