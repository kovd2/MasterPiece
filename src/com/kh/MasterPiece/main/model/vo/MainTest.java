package com.kh.MasterPiece.main.model.vo;

import java.sql.Date;

public class MainTest {
	private String prdCode;
	private String manufacturer;
	private int price;
	private String prdName;
	private Date releaseDate;
	private String category;
	private int sellCount;
	private int stock;

	public MainTest() {}
	
	public MainTest(String prdCode, String manufacturer, int price, String prdName, Date releaseDate, String category,
			int sellCount, int stock) {
		super();
		this.prdCode = prdCode;
		this.manufacturer = manufacturer;
		this.price = price;
		this.prdName = prdName;
		this.releaseDate = releaseDate;
		this.category = category;
		this.sellCount = sellCount;
		this.stock = stock;
	}


	public String getPrdCode() {
		return prdCode;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public int getPrice() {
		return price;
	}

	public String getPrdName() {
		return prdName;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public String getCategory() {
		return category;
	}

	public int getSellCount() {
		return sellCount;
	}

	public int getStock() {
		return stock;
	}

	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	@Override
	public String toString() {
		return "MainTest [prdCode=" + prdCode + ", manufacturer=" + manufacturer + ", price=" + price + ", prdName="
				+ prdName + ", releaseDate=" + releaseDate + ", category=" + category + ", sellCount=" + sellCount
				+ ", stock=" + stock + "]";
	}
	
	
	
}
