package com.kh.MasterPiece.admin.model.vo;

public class Promotion_ATT {
	private String file_code;
	private String change_name;
	private String file_name;
	private String upload_date;
	private String save_route;
	private String promotion_no;
	
	public Promotion_ATT(){}

	public Promotion_ATT(String file_code, String change_name, String file_name, String upload_date, String save_route,
			String promotion_no) {
		super();
		this.file_code = file_code;
		this.change_name = change_name;
		this.file_name = file_name;
		this.upload_date = upload_date;
		this.save_route = save_route;
		this.promotion_no = promotion_no;
	}

	public String getFile_code() {
		return file_code;
	}

	public void setFile_code(String file_code) {
		this.file_code = file_code;
	}

	public String getChange_name() {
		return change_name;
	}

	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}

	public String getSave_route() {
		return save_route;
	}

	public void setSave_route(String save_route) {
		this.save_route = save_route;
	}

	public String getPromotion_no() {
		return promotion_no;
	}

	public void setPromotion_no(String promotion_no) {
		this.promotion_no = promotion_no;
	}

	@Override
	public String toString() {
		return "Promotion_ATT [file_code=" + file_code + ", change_name=" + change_name + ", file_name=" + file_name
				+ ", upload_date=" + upload_date + ", save_route=" + save_route + ", promotion_no=" + promotion_no
				+ "]";
	}
	
	
}
