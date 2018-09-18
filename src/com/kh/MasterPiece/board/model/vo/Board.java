package com.kh.MasterPiece.board.model.vo;

import java.sql.Date;

public class Board {
	private int BOARD_ID;                //게시판ID (시퀀스)
    private int BOARD_TYPE;                  //게시판 구분
     //게시판 구분//
    //1.견적 요청
    //2.유저 견적 게시판
    //3.1:1 문의 내역
    //4.자주묻는질문
    //5.교환,반품,AS
    //6.공지사항
    private String BOARD_PWD;                           //게시판 비밀번호
    private int BOARD_NO;                               //각 게시판 번호 (시퀀스)
    private int BOARD_CATEGORY;                         //카테고리 번호
    private String BOARD_TITLE;                 //게시판 글 제목
    private String BOARD_CONTENT;              //게시판 글 내용
    private String BOARD_WRITER;               //게시판 작성자(유저 ID)
    private int REF_BOARD_ID;                            //참조게시판 번호
    private int BOARD_LEVEL;      //게시판 레벨 (본 게시글[0] or 댓글[1])
    private Date BOARD_DATE;                     //게시판 작성일
    private String BOARD_STATUS;               //게시판 상태
    private String QUE_STATUS;
    
    public Board() {}
    
	public Board(int bOARD_ID, int bOARD_TYPE, String bOARD_PWD, int bOARD_NO, int bOARD_CATEGORY, String bOARD_TITLE,
			String bOARD_CONTENT, String bOARD_WRITER, int rEF_BOARD_ID, int bOARD_LEVEL, Date bOARD_DATE,
			String bOARD_STATUS, String qUE_STATUS) {
		super();
		BOARD_ID = bOARD_ID;
		BOARD_TYPE = bOARD_TYPE;
		BOARD_PWD = bOARD_PWD;
		BOARD_NO = bOARD_NO;
		BOARD_CATEGORY = bOARD_CATEGORY;
		BOARD_TITLE = bOARD_TITLE;
		BOARD_CONTENT = bOARD_CONTENT;
		BOARD_WRITER = bOARD_WRITER;
		REF_BOARD_ID = rEF_BOARD_ID;
		BOARD_LEVEL = bOARD_LEVEL;
		BOARD_DATE = bOARD_DATE;
		BOARD_STATUS = bOARD_STATUS;
		QUE_STATUS = qUE_STATUS;
	}

	public int getBOARD_ID() {
		return BOARD_ID;
	}

	public void setBOARD_ID(int bOARD_ID) {
		BOARD_ID = bOARD_ID;
	}

	public int getBOARD_TYPE() {
		return BOARD_TYPE;
	}

	public void setBOARD_TYPE(int bOARD_TYPE) {
		BOARD_TYPE = bOARD_TYPE;
	}

	public String getBOARD_PWD() {
		return BOARD_PWD;
	}

	public void setBOARD_PWD(String bOARD_PWD) {
		BOARD_PWD = bOARD_PWD;
	}

	public int getBOARD_NO() {
		return BOARD_NO;
	}

	public void setBOARD_NO(int bOARD_NO) {
		BOARD_NO = bOARD_NO;
	}

	public int getBOARD_CATEGORY() {
		return BOARD_CATEGORY;
	}

	public void setBOARD_CATEGORY(int bOARD_CATEGORY) {
		BOARD_CATEGORY = bOARD_CATEGORY;
	}

	public String getBOARD_TITLE() {
		return BOARD_TITLE;
	}

	public void setBOARD_TITLE(String bOARD_TITLE) {
		BOARD_TITLE = bOARD_TITLE;
	}

	public String getBOARD_CONTENT() {
		return BOARD_CONTENT;
	}

	public void setBOARD_CONTENT(String bOARD_CONTENT) {
		BOARD_CONTENT = bOARD_CONTENT;
	}

	public String getBOARD_WRITER() {
		return BOARD_WRITER;
	}

	public void setBOARD_WRITER(String bOARD_WRITER) {
		BOARD_WRITER = bOARD_WRITER;
	}

	public int getREF_BOARD_ID() {
		return REF_BOARD_ID;
	}

	public void setREF_BOARD_ID(int rEF_BOARD_ID) {
		REF_BOARD_ID = rEF_BOARD_ID;
	}

	public int getBOARD_LEVEL() {
		return BOARD_LEVEL;
	}

	public void setBOARD_LEVEL(int bOARD_LEVEL) {
		BOARD_LEVEL = bOARD_LEVEL;
	}

	public Date getBOARD_DATE() {
		return BOARD_DATE;
	}

	public void setBOARD_DATE(Date bOARD_DATE) {
		BOARD_DATE = bOARD_DATE;
	}

	public String getBOARD_STATUS() {
		return BOARD_STATUS;
	}

	public void setBOARD_STATUS(String bOARD_STATUS) {
		BOARD_STATUS = bOARD_STATUS;
	}

	public String getQUE_STATUS() {
		return QUE_STATUS;
	}

	public void setQUE_STATUS(String qUE_STATUS) {
		QUE_STATUS = qUE_STATUS;
	}

	@Override
	public String toString() {
		return "Board [BOARD_ID=" + BOARD_ID + ", BOARD_TYPE=" + BOARD_TYPE + ", BOARD_PWD=" + BOARD_PWD + ", BOARD_NO="
				+ BOARD_NO + ", BOARD_CATEGORY=" + BOARD_CATEGORY + ", BOARD_TITLE=" + BOARD_TITLE + ", BOARD_CONTENT="
				+ BOARD_CONTENT + ", BOARD_WRITER=" + BOARD_WRITER + ", REF_BOARD_ID=" + REF_BOARD_ID + ", BOARD_LEVEL="
				+ BOARD_LEVEL + ", BOARD_DATE=" + BOARD_DATE + ", BOARD_STATUS=" + BOARD_STATUS + ", QUE_STATUS="
				+ QUE_STATUS + "]";
	}
	
    
    
    
    
    
}
