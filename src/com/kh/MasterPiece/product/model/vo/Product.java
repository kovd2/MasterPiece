package com.kh.MasterPiece.product.model.vo;

import java.util.Date;

public class Product {
	private String prd_code;
	private String manufacturer;
	private int price;
	private int total_price;
	private int prd_amount;
	private String prd_name;
	private String prd_info;
	private Date release_date;
	private String category;
	private int sell_count;
	private int stock;
	private int prd_dno;
	private int prd_code_name;
	private String att_code;
	private String att_name;
	private int fileId;
	private int boardId;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private int fileLevel;
	private int downloadCount;
	private String status;
	private String code;
	
	public Product(){}

	public Product(String prd_code, String manufacturer, int price, int total_price, int prd_amount, String prd_name,
			String prd_info, Date release_date, String category, int sell_count, int stock, int prd_dno,
			int prd_code_name, String att_code, String att_name, int fileId, int boardId, String originName,
			String changeName, String filePath, Date uploadDate, int fileLevel, int downloadCount, String status,
			String code) {
		super();
		this.prd_code = prd_code;
		this.manufacturer = manufacturer;
		this.price = price;
		this.total_price = total_price;
		this.prd_amount = prd_amount;
		this.prd_name = prd_name;
		this.prd_info = prd_info;
		this.release_date = release_date;
		this.category = category;
		this.sell_count = sell_count;
		this.stock = stock;
		this.prd_dno = prd_dno;
		this.prd_code_name = prd_code_name;
		this.att_code = att_code;
		this.att_name = att_name;
		this.fileId = fileId;
		this.boardId = boardId;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.downloadCount = downloadCount;
		this.status = status;
		this.code = code;
	}

	public String getPrd_code() {
		return prd_code;
	}

	public void setPrd_code(String prd_code) {
		this.prd_code = prd_code;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getPrd_amount() {
		return prd_amount;
	}

	public void setPrd_amount(int prd_amount) {
		this.prd_amount = prd_amount;
	}

	public String getPrd_name() {
		return prd_name;
	}

	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}

	public String getPrd_info() {
		return prd_info;
	}

	public void setPrd_info(String prd_info) {
		this.prd_info = prd_info;
	}

	public Date getRelease_date() {
		return release_date;
	}

	public void setRelease_date(Date release_date) {
		this.release_date = release_date;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getSell_count() {
		return sell_count;
	}

	public void setSell_count(int sell_count) {
		this.sell_count = sell_count;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getPrd_dno() {
		return prd_dno;
	}

	public void setPrd_dno(int prd_dno) {
		this.prd_dno = prd_dno;
	}

	public int getPrd_code_name() {
		return prd_code_name;
	}

	public void setPrd_code_name(int prd_code_name) {
		this.prd_code_name = prd_code_name;
	}

	public String getAtt_code() {
		return att_code;
	}

	public void setAtt_code(String att_code) {
		this.att_code = att_code;
	}

	public String getAtt_name() {
		return att_name;
	}

	public void setAtt_name(String att_name) {
		this.att_name = att_name;
	}

	public int getFileId() {
		return fileId;
	}

	public void setFileId(int fileId) {
		this.fileId = fileId;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getDownloadCount() {
		return downloadCount;
	}

	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "Product [prd_code=" + prd_code + ", manufacturer=" + manufacturer + ", price=" + price
				+ ", total_price=" + total_price + ", prd_amount=" + prd_amount + ", prd_name=" + prd_name
				+ ", prd_info=" + prd_info + ", release_date=" + release_date + ", category=" + category
				+ ", sell_count=" + sell_count + ", stock=" + stock + ", prd_dno=" + prd_dno + ", prd_code_name="
				+ prd_code_name + ", att_code=" + att_code + ", att_name=" + att_name + ", fileId=" + fileId
				+ ", boardId=" + boardId + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel + ", downloadCount="
				+ downloadCount + ", status=" + status + ", code=" + code + "]";
	}

	
	
	
}
