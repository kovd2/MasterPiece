package com.kh.MasterPiece.admin.model.vo;


public class Cnt {
	private int cnt;
	private String d;
	
	
	public Cnt() {
		super();
	}
	public Cnt(int cnt, String d) {
		super();
		this.cnt = cnt;
		this.d = d;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getD() {
		return d;
	}
	public void setD(String d) {
		this.d = d;
	}
	@Override
	public String toString() {
		return "Cnt [cnt=" + cnt + ", d=" + d + "]";
	}
	
	


}
