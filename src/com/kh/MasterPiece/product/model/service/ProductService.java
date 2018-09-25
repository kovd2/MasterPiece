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
	
}
