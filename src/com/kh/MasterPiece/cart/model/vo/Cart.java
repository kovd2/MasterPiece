package com.kh.MasterPiece.cart.model.vo;

public class Cart {
	private int order_no;
	private String order_check;
	private String prd_code;
	private String prd_name;
	private int price;
	private int order_count;
	
	public Cart(){}

	public Cart(int order_no, String order_check, String prd_code, String prd_name, int price, int order_count) {
		super();
		this.order_no = order_no;
		this.order_check = order_check;
		this.prd_code = prd_code;
		this.prd_name = prd_name;
		this.price = price;
		this.order_count = order_count;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public String getOrder_check() {
		return order_check;
	}

	public void setOrder_check(String order_check) {
		this.order_check = order_check;
	}

	public String getPrd_code() {
		return prd_code;
	}

	public void setPrd_code(String prd_code) {
		this.prd_code = prd_code;
	}

	public String getPrd_name() {
		return prd_name;
	}

	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getOrder_count() {
		return order_count;
	}

	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}

	@Override
	public String toString() {
		return "Cart [order_no=" + order_no + ", order_check=" + order_check + ", prd_code=" + prd_code + ", prd_name="
				+ prd_name + ", price=" + price + ", order_count=" + order_count + "]";
	}

	
}
