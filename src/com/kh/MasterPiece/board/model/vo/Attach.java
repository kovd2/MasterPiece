package com.kh.MasterPiece.board.model.vo;

import java.util.Date;

public class Attach
{
	private int fildCode;
	private String originName;
	private String changeName;
	private Date uploadDate;
	private String saveRoute;
	private int boardId;
	
	public Attach(){}
	
	public Attach(int fildCode, String originName, String changeName, Date uploadDate, String saveRoute, int boardId) {
		super();
		this.fildCode = fildCode;
		this.originName = originName;
		this.changeName = changeName;
		this.uploadDate = uploadDate;
		this.saveRoute = saveRoute;
		this.boardId = boardId;
	}

	public int getFildCode() {
		return fildCode;
	}

	public void setFildCode(int fildCode) {
		this.fildCode = fildCode;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getSaveRoute() {
		return saveRoute;
	}

	public void setSaveRoute(String saveRoute) {
		this.saveRoute = saveRoute;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	@Override
	public String toString() {
		return "Attach [fildCode=" + fildCode + ", originName=" + originName + ", changeName=" + changeName
				+ ", uploadDate=" + uploadDate + ", saveRoute=" + saveRoute + ", boardId=" + boardId + "]";
	}
}