package com.kh.MasterPiece.admin.model.vo;

public class Promotion {
	private String Promotion_No;
	private String Promotion_Title;
	private String Promotion_DATE;
	private String Promotion_URL;
	
	public Promotion(){}

	public Promotion(String promotion_No, String promotion_Title, String promotion_DATE, String promotion_URL) {
		super();
		Promotion_No = promotion_No;
		Promotion_Title = promotion_Title;
		Promotion_DATE = promotion_DATE;
		Promotion_URL = promotion_URL;
	}

	public String getPromotion_No() {
		return Promotion_No;
	}

	public void setPromotion_No(String promotion_No) {
		Promotion_No = promotion_No;
	}

	public String getPromotion_Title() {
		return Promotion_Title;
	}

	public void setPromotion_Title(String promotion_Title) {
		Promotion_Title = promotion_Title;
	}

	public String getPromotion_DATE() {
		return Promotion_DATE;
	}

	public void setPromotion_DATE(String promotion_DATE) {
		Promotion_DATE = promotion_DATE;
	}

	public String getPromotion_URL() {
		return Promotion_URL;
	}

	public void setPromotion_URL(String promotion_URL) {
		Promotion_URL = promotion_URL;
	}

	@Override
	public String toString() {
		return "Promotion [Promotion_No=" + Promotion_No + ", Promotion_Title=" + Promotion_Title + ", Promotion_DATE="
				+ Promotion_DATE + ", Promotion_URL=" + Promotion_URL + "]";
	}
	
	
}
