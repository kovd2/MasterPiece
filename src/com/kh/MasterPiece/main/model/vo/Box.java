package com.kh.MasterPiece.main.model.vo;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.main.model.service.MainService;
import com.kh.MasterPiece.product.model.vo.Product;

public class Box {
	private MainPageInfo pi = null;
	private ArrayList<Product> list = null;
	private HashMap<String, Attachment> imgList = null;
	
	
	
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



	@Override
	public String toString() {
		return "Box [pi=" + pi + ", list=" + list + ", imgList=" + imgList + "]";
	}
	
	
	
}
