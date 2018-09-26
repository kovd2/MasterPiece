package com.kh.MasterPiece.mypage.cartList.vo;

public class CartList {

	private String prdCode;
	private String prdName;
	private int price;
	private int count;
	
	public CartList(){}
	
	public CartList(String prdCode, String prdName, int price, int count) {
		super();
		this.prdCode = prdCode;
		this.prdName = prdName;
		this.price = price;
		this.count = count;
	}
	public String getPrdCode() {
		return prdCode;
	}
	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}
	public String getPrdName() {
		return prdName;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "CartList [prdCode=" + prdCode + ", prdName=" + prdName + ", price=" + price + ", count=" + count + "]";
	}
	
	
}
