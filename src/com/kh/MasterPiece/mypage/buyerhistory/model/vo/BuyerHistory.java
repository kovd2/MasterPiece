package com.kh.MasterPiece.mypage.buyerhistory.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BuyerHistory implements Serializable{
	private Date payDate;	//주문일자
	private String prdName;	//상품정보
	private int buyNo;		//주문번호
	private String prdCode;	//상품코드
	private String buyStatus;//결제상태
	private String deliveryOption;//배송옵션
	private String orderCheck;	//주문확인번호
	private int payPrice;		//주문금액
	private int orderCount;		//결제수량
	private String payType;		//결제방법
	
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

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	@Override
	public String toString() {
		return "BuyerHistory [payDate=" + payDate + ", prdName=" + prdName + ", buyNo=" + buyNo + ", prdCode=" + prdCode
				+ ", buyStatus=" + buyStatus + ", deliveryOption=" + deliveryOption + "]";
	}
	
	
}
