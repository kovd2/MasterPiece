package com.kh.MasterPiece.product.model.service;

import static com.kh.MasterPiece.common.JDBCTemplate.close;
import static com.kh.MasterPiece.common.JDBCTemplate.getConnection;


import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.product.model.dao.ProductDao;
import com.kh.MasterPiece.product.model.vo.Product;

public class ProductService {

	/*public ArrayList<Product> selectListAll() {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectListAll(con);
		
		return list;
	}*/

	public HashMap<String, Object> imgList() {
		Connection con = getConnection();
		
		HashMap<String, Object> imgList = new ProductDao().imgList(con);
		
		close(con);
		
		return imgList;
	}

	public HashMap<String, Object> prdDetail(String code) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = null;
		
		hmap = new ProductDao().imgList(con, code);
		
		close(con);
		
		return hmap;
	}

	public ArrayList<Product> cpuList(int currentPage, int limit1) {
		Connection con = getConnection();
		
		ArrayList<Product> cpuList = new ProductDao().cpuList(con, currentPage, limit1);
		
		close(con);
		
		return cpuList;
	}
	
	public ArrayList<Product> mainBoardList(int currentPage1, int limit1) {
		Connection con = getConnection();
		
		ArrayList<Product> mainBoardList = new ProductDao().mainBoardList(con, currentPage1, limit1);
		
		close(con);
		
		return mainBoardList;
	}
	public ArrayList<Product> memoryList(int currentPage2, int limit2) {
		Connection con = getConnection();
		
		ArrayList<Product> memoryList = new ProductDao().memoryList(con, currentPage2, limit2);
		
		close(con);
		
		return memoryList;
	}
	
	public ArrayList<Product> graphicList(int currentPage3, int limit3) {
		Connection con = getConnection();
		
		ArrayList<Product> graphicList = new ProductDao().graphicList(con, currentPage3, limit3);
		
		close(con);
		
		return graphicList;
	}
	
	public ArrayList<Product> hddList(int currentPage4, int limit4) {
		Connection con = getConnection();
		
		ArrayList<Product> hddList = new ProductDao().hddList(con, currentPage4, limit4);
		
		close(con);
		
		return hddList;
	}
	
	public ArrayList<Product> oddList(int currentPage5, int limit5) {
		Connection con = getConnection();
		
		ArrayList<Product> oddList = new ProductDao().oddList(con, currentPage5, limit5);
		
		close(con);
		
		return oddList;
	}
	
	public ArrayList<Product> powerList(int currentPage6, int limit6) {
		Connection con = getConnection();
		
		ArrayList<Product> powerList = new ProductDao().powerList(con, currentPage6, limit6);
		
		close(con);
		
		return powerList;
	}
	
	public ArrayList<Product> coolList(int currentPage7, int limit7) {
		Connection con = getConnection();
		
		ArrayList<Product> coolList = new ProductDao().coolList(con, currentPage7, limit7);
		
		close(con);
		
		return coolList;
	}
	
	public ArrayList<Product> caseList(int currentPage8, int limit8) {
		Connection con = getConnection();
		
		ArrayList<Product> caseList = new ProductDao().caseList(con, currentPage8, limit8);
		
		close(con);
		
		return caseList;
	}
	
	
	
	
	//------------------------------------페이징----------------------------------------------------

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new ProductDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public int getListCount1() {
		Connection con = getConnection();
		
		int listCount1 = new ProductDao().getListCount1(con);
		
		close(con);
		
		return listCount1;
	}

	public int getListCount2() {
		Connection con = getConnection();
		
		int listCount2 = new ProductDao().getlistCount2(con);
		
		close(con);
		
		return listCount2;
	}

	public int getListCount3() {
		Connection con = getConnection();
		
		int listCount3 = new ProductDao().getlistCount3(con);
		
		close(con);
		
		return listCount3;
	}
	
	public int getListCount4() {
		Connection con = getConnection();
		
		int listCount4 = new ProductDao().getlistCount4(con);
		
		close(con);
		
		return listCount4;
	}
	
	public int getListCount5() {
		Connection con = getConnection();
		
		int listCount5 = new ProductDao().getlistCount5(con);
		
		close(con);
		
		return listCount5;
	}
	
	public int getListCount6() {
		Connection con = getConnection();
		
		int listCount6 = new ProductDao().getlistCount6(con);
		
		close(con);
		
		return listCount6;
	}
	
	public int getListCount7() {
		Connection con = getConnection();
		
		int listCount7 = new ProductDao().getlistCount7(con);
		
		close(con);
		
		return listCount7;
	}
	
	public int getListCount8() {
		Connection con = getConnection();
		
		int listCount8 = new ProductDao().getlistCount8(con);
		
		close(con);
		
		return listCount8;
	}
	

	
}
