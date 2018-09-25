package com.kh.MasterPiece.main.model.vo;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.board.model.vo.PageInfo;
import com.kh.MasterPiece.product.model.vo.Product;

public class Box {
	private MainPageInfo pi = null;
	private ArrayList<Product> list = null;
	private HashMap<String, Attachment> imgList = null;
	private ArrayList<Board> boardList = null;
	private PageInfo bpi = null;
	
	public Box() {
		super();
	}



	public Box(MainPageInfo pi, ArrayList<Product> list, HashMap<String, Attachment> imgList) {
		super();
		this.pi = pi;
		this.list = list;
		this.imgList = imgList;
	}



	public MainPageInfo getPi() {
		return pi;
	}



	public void setPi(MainPageInfo pi) {
		this.pi = pi;
	}



	public ArrayList<Product> getList() {
		return list;
	}



	public void setList(ArrayList<Product> list) {
		this.list = list;
	}



	public HashMap<String, Attachment> getImgList() {
		return imgList;
	}



	public void setImgList(HashMap<String, Attachment> imgList) {
		this.imgList = imgList;
	}



	public ArrayList<Board> getBoardList() {
		return boardList;
	}



	public void setBoardList(ArrayList<Board> boardList) {
		this.boardList = boardList;
	}



	public PageInfo getBpi() {
		return bpi;
	}



	public void setBpi(PageInfo bpi) {
		this.bpi = bpi;
	}



	@Override
	public String toString() {
		return "Box [pi=" + pi + ", list=" + list + ", imgList=" + imgList + "]";
	}
	
	
	
}
