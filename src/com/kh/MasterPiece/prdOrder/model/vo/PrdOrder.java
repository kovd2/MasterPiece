package com.kh.MasterPiece.prdOrder.model.vo;

import java.io.Serializable;
import java.util.Date;

public class PrdOrder implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4588912122419683475L;
	
	private String userId;
	private Date orderDate;
	private String prdCode;
	private String orderCheck;
	private int orderCount;
	
	public PrdOrder(){}

	public PrdOrder(String userId, Date orderDate, String prdCode, String orderCheck, int orderCount) {
		super();
		this.userId = userId;
		this.orderDate = orderDate;
		this.prdCode = prdCode;
		this.orderCheck = orderCheck;
		this.orderCount = orderCount;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getPrdCode() {
		return prdCode;
	}

	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}

	public String getOrderCheck() {
		return orderCheck;
	}

	public void setOrderCheck(String orderCheck) {
		this.orderCheck = orderCheck;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	@Override
	public String toString() {
		return "PrdOrder [userId=" + userId + ", orderDate=" + orderDate + ", prdCode=" + prdCode + ", orderCheck="
				+ orderCheck + ", orderCount=" + orderCount + "]";
	}
}