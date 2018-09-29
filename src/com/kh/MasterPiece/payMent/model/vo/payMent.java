package com.kh.MasterPiece.payMent.model.vo;

public class payMent {
	
	private int pay_no;
	private String user_id;
	private String proof_no;
	private int price;
	private String pay_type;
	private String pay_way;
	private String pay_history;
	private String pay_status;
	
	public payMent(){}

	public payMent(int pay_no, String user_id, String proof_no, int price, String pay_type, String pay_way,
			String pay_history, String pay_status) {
		super();
		this.pay_no = pay_no;
		this.user_id = user_id;
		this.proof_no = proof_no;
		this.price = price;
		this.pay_type = pay_type;
		this.pay_way = pay_way;
		this.pay_history = pay_history;
		this.pay_status = pay_status;
	}

	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getProof_no() {
		return proof_no;
	}

	public void setProof_no(String proof_no) {
		this.proof_no = proof_no;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPay_type() {
		return pay_type;
	}

	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}

	public String getPay_way() {
		return pay_way;
	}

	public void setPay_way(String pay_way) {
		this.pay_way = pay_way;
	}

	public String getPay_history() {
		return pay_history;
	}

	public void setPay_history(String pay_history) {
		this.pay_history = pay_history;
	}

	public String getPay_status() {
		return pay_status;
	}

	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}

	@Override
	public String toString() {
		return "payMent [pay_no=" + pay_no + ", user_id=" + user_id + ", proof_no=" + proof_no + ", price=" + price
				+ ", pay_type=" + pay_type + ", pay_way=" + pay_way + ", pay_history=" + pay_history + ", pay_status="
				+ pay_status + "]";
	}
	
	
	
}
