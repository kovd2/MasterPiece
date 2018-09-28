package com.kh.MasterPiece.prdOrder.model.vo;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.HashMap;

import com.kh.MasterPiece.board.model.vo.Attachment;

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
	private int price;
	
	public PrdOrder(){}

	public PrdOrder(String userId, Date orderDate, String prdCode, String orderCheck, int orderCount, int price) {
		super();
		this.userId = userId;
		this.orderDate = orderDate;
		this.prdCode = prdCode;
		this.orderCheck = orderCheck;
		this.orderCount = orderCount;
		this.price = price;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}