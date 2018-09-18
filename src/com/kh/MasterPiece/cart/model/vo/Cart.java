package com.kh.MasterPiece.cart.model.vo;

public class Cart {
	private int quty;
	private int price;
	private String image;
	
	public Cart(){}

	public Cart(int quty, int price, String image) {
		super();
		this.quty = quty;
		this.price = price;
		this.image = image;
	}

	public int getQuty() {
		return quty;
	}

	public void setQuty(int quty) {
		this.quty = quty;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Cart [quty=" + quty + ", price=" + price + ", image=" + image + "]";
	}
	
	
}
