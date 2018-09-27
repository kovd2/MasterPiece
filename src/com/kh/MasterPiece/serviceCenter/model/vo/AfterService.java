package com.kh.MasterPiece.serviceCenter.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AfterService implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6020886298782395449L;
	
	private int serviceNo;
	private String userId;
	private String prdCode;
	private String reason;
	private String boardContent;
	private String howToRegister;
	private String trackingNumber;
	private String bank;
	private String bankNum;
	private String bankUserName;
	private Date boardDate;
	private String boardStatus;
	
	public AfterService(){}

	public AfterService(int serviceNo, String userId, String prdCode, String reason, String boardContent,
			String howToRegister, String trackingNumber, String bank, String bankNum, String bankUserName,
			Date boardDate, String boardStatus) {
		super();
		this.serviceNo = serviceNo;
		this.userId = userId;
		this.prdCode = prdCode;
		this.reason = reason;
		this.boardContent = boardContent;
		this.howToRegister = howToRegister;
		this.trackingNumber = trackingNumber;
		this.bank = bank;
		this.bankNum = bankNum;
		this.bankUserName = bankUserName;
		this.boardDate = boardDate;
		this.boardStatus = boardStatus;
	}

	public int getServiceNo() {
		return serviceNo;
	}

	public void setServiceNo(int serviceNo) {
		this.serviceNo = serviceNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPrdCode() {
		return prdCode;
	}

	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getHowToRegister() {
		return howToRegister;
	}

	public void setHowToRegister(String howToRegister) {
		this.howToRegister = howToRegister;
	}

	public String getTrackingNumber() {
		return trackingNumber;
	}

	public void setTrackingNumber(String trackingNumber) {
		this.trackingNumber = trackingNumber;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getBankNum() {
		return bankNum;
	}

	public void setBankNum(String bankNum) {
		this.bankNum = bankNum;
	}

	public String getBankUserName() {
		return bankUserName;
	}

	public void setBankUserName(String bankUserName) {
		this.bankUserName = bankUserName;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "AfterService [serviceNo=" + serviceNo + ", userId=" + userId + ", prdCode=" + prdCode + ", reason="
				+ reason + ", boardContent=" + boardContent + ", howToRegister=" + howToRegister + ", trackingNumber="
				+ trackingNumber + ", bank=" + bank + ", bankNum=" + bankNum + ", bankUserName=" + bankUserName
				+ ", boardDate=" + boardDate + ", boardStatus=" + boardStatus + "]";
	}
}