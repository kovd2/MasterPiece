package com.kh.MasterPiece.mypage.review.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable{
	
	private int boardNo;			//글번호
	private String boardCategory;		//글 유형(게시글위치)
	private String boardTitle;		//글제목제목
	private Date boardDate;			//글 작성날짜
	private int boardId;
	
	
	
	
	public Review(){}
	
	public Review(int boardNo, int boardCategory, String boardTitle, Date boardDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardDate = boardDate;
	}
	
	

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(int boardCategory) {
//		this.boardCategory = boardCategory;
		switch(boardCategory){
		case 1:this.boardCategory="견적게시판";break;
		case 2:this.boardCategory="유저게시판";break;
		case 3: case 4: case 5: this.boardCategory="문의";break;
		case 6:this.boardCategory="공지사항";break;
		
		}
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	@Override
	public String toString() {
		return "Review [boardNo=" + boardNo + ", boardCategory=" + boardCategory + ", boardTitle=" + boardTitle
				+ ", boardDate=" + boardDate + "]";
	}
	
	
	
	

}
