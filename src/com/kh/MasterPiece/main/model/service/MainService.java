package com.kh.MasterPiece.main.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.main.model.dao.MainDao;
import com.kh.MasterPiece.main.model.vo.MainTest;
import com.kh.MasterPiece.product.model.vo.Product;

import static com.kh.MasterPiece.common.JDBCTemplate.*;


public class MainService {
	
	//메인 상품 DB 조회 메소드
	public ArrayList<MainTest> selectProduct() {
		Connection con = getConnection();
		
		ArrayList<MainTest> list = new MainDao().selectProduct(con);
		
				
		close(con);
		
		return list;
	}
	
	//GRAPHIC
	public int getlistCount1() {
		Connection con = getConnection();
		
		int listCount = new MainDao().getListCount1(con);
		
		close(con);
		
		return listCount;
	}
	//CPU
	public int getlistCount2() {
		Connection con = getConnection();
		
		int listCount = new MainDao().getListCount2(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Product> graphicList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new MainDao().graphicList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public ArrayList<Product> cpuList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new MainDao().cpuList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	public ArrayList<Product> allList() {
		Connection con = getConnection();
		
		ArrayList<Product> list = new MainDao().allList(con);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Attachment> selectImageList() {
		Connection con = getConnection();
		
		HashMap<String, Attachment> list = new MainDao().selectImageList(con);
		
		close(con);
		
		return list;
	}


	public ArrayList<HashMap<String, Object>> selectImgList() {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new MainDao().selectImgList(con);
		
		close(con);
		
		return list;
	}


	
}














