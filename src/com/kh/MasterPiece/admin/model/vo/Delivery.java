package com.kh.MasterPiece.admin.model.vo;

import java.sql.Date;

public class Delivery {
	private int DELIVERY_NO; 
	private String INVOICE_NO; 
	private Date DELIVERY_DATE; 
	private String ORDER_CHECK; 
	private String SHIPPING_ADDRESS; 
	private String SHIPPING_PHONE; 
	private String ETC; 
	private String DELIVERY_OPTION;
	
	public Delivery() {
		super();
	}
	public Delivery(int dELIVERY_NO, String iNVOICE_NO, Date dELIVERY_DATE, String oRDER_CHECK, String sHIPPING_ADDRESS,
			String sHIPPING_PHONE, String eTC, String dELIVERY_OPTION) {
		super();
		DELIVERY_NO = dELIVERY_NO;
		INVOICE_NO = iNVOICE_NO;
		DELIVERY_DATE = dELIVERY_DATE;
		ORDER_CHECK = oRDER_CHECK;
		SHIPPING_ADDRESS = sHIPPING_ADDRESS;
		SHIPPING_PHONE = sHIPPING_PHONE;
		ETC = eTC;
		DELIVERY_OPTION = dELIVERY_OPTION;
	}
	public int getDELIVERY_NO() {
		return DELIVERY_NO;
	}
	public void setDELIVERY_NO(int dELIVERY_NO) {
		DELIVERY_NO = dELIVERY_NO;
	}
	public String getINVOICE_NO() {
		return INVOICE_NO;
	}
	public void setINVOICE_NO(String iNVOICE_NO) {
		INVOICE_NO = iNVOICE_NO;
	}
	public Date getDELIVERY_DATE() {
		return DELIVERY_DATE;
	}
	public void setDELIVERY_DATE(Date dELIVERY_DATE) {
		DELIVERY_DATE = dELIVERY_DATE;
	}
	public String getORDER_CHECK() {
		return ORDER_CHECK;
	}
	public void setORDER_CHECK(String oRDER_CHECK) {
		ORDER_CHECK = oRDER_CHECK;
	}
	public String getSHIPPING_ADDRESS() {
		return SHIPPING_ADDRESS;
	}
	public void setSHIPPING_ADDRESS(String sHIPPING_ADDRESS) {
		SHIPPING_ADDRESS = sHIPPING_ADDRESS;
	}
	public String getSHIPPING_PHONE() {
		return SHIPPING_PHONE;
	}
	public void setSHIPPING_PHONE(String sHIPPING_PHONE) {
		SHIPPING_PHONE = sHIPPING_PHONE;
	}
	public String getETC() {
		return ETC;
	}
	public void setETC(String eTC) {
		ETC = eTC;
	}
	public String getDELIVERY_OPTION() {
		return DELIVERY_OPTION;
	}
	public void setDELIVERY_OPTION(String dELIVERY_OPTION) {
		DELIVERY_OPTION = dELIVERY_OPTION;
	}
	@Override
	public String toString() {
		return "Delevery [DELIVERY_NO=" + DELIVERY_NO + ", INVOICE_NO=" + INVOICE_NO + ", DELIVERY_DATE="
				+ DELIVERY_DATE + ", ORDER_CHECK=" + ORDER_CHECK + ", SHIPPING_ADDRESS=" + SHIPPING_ADDRESS
				+ ", SHIPPING_PHONE=" + SHIPPING_PHONE + ", ETC=" + ETC + ", DELIVERY_OPTION=" + DELIVERY_OPTION + "]";
	}
	
	
}
