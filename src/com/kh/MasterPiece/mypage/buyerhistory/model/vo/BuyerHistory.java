package com.kh.MasterPiece.mypage.buyerhistory.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BuyerHistory implements Serializable{
	private Date payDate;
	private String prdName;
	private int buyNo;
	private String prdCode;
	private String buyStatus;
	private String deliveryOption;
	private String orderCheck;
	private int payPrice;
	private int orderCount;
	
	public BuyerHistory(){}







	public BuyerHistory(Date payDate, String prdName, int buyNo, String prdCode, String buyStatus,
			String deliveryOption, String orderCheck, int payPrice, int orderCount) {
		super();
		this.payDate = payDate;
		this.prdName = prdName;
		this.buyNo = buyNo;
		this.prdCode = prdCode;
		this.buyStatus = buyStatus;
		this.deliveryOption = deliveryOption;
		this.orderCheck = orderCheck;
		this.payPrice = payPrice;
		this.orderCount = orderCount;
	}







	public int getPayPrice() {
		return payPrice;
	}







	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}







	public int getOrderCount() {
		return orderCount;
	}







	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}







	public String getOrderCheck() {
		return orderCheck;
	}



	public void setOrderCheck(String orderCheck) {
		this.orderCheck = orderCheck;
	}



	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getPrdName() {
		return prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	public int getBuyNo() {
		return buyNo;
	}

	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}

	public String getPrdCode() {
		return prdCode;
	}

	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}

	public String getBuyStatus() {
		return buyStatus;
	}

	public void setBuyStatus(String buyStatus) {
		this.buyStatus = buyStatus;
	}

	public String getDeliveryOption() {
		return deliveryOption;
	}

	public void setDeliveryOption(String deliveryOption) {
		this.deliveryOption = deliveryOption;
	}

	@Override
	public String toString() {
		return "BuyerHistory [payDate=" + payDate + ", prdName=" + prdName + ", buyNo=" + buyNo + ", prdCode=" + prdCode
				+ ", buyStatus=" + buyStatus + ", deliveryOption=" + deliveryOption + "]";
	}
	
	
}
