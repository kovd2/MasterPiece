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

	public ArrayList<Product> prdList(int currentPage, int limit, String category) {
		Connection con = getConnection();
		
		ArrayList<Product> prdList = new ProductDao().prdList(con, currentPage, limit, category);
		
		close(con);
		
		return prdList;
	}
	
	
	//------------------------------------페이징----------------------------------------------------

	public int getListCount(String category) {
		Connection con = getConnection();
		
		int listCount = new ProductDao().getListCount(con, category);
		
		close(con);
		
		return listCount;
	}
	//------------------------------------인기상품 정렬----------------------------------------------------
	public ArrayList<Product> popularList(int currentPage, int limit, String category) {
		Connection con = getConnection();
		
		ArrayList<Product> prdList = new ProductDao().popularList(con, currentPage, limit, category);
		
		close(con);
		
		return prdList;
	}

	public ArrayList<Product> newList(int currentPage, int limit, String category) {
		Connection con = getConnection();
		
		ArrayList<Product> prdList = new ProductDao().newList(con, currentPage, limit, category);
		
		close(con);
		
		return prdList;
	}

	public ArrayList<Product> lowList(int currentPage, int limit, String category) {
		Connection con = getConnection();
		
		ArrayList<Product> prdList = new ProductDao().lowList(con, currentPage, limit, category);
		
		close(con);
		
		return prdList;
	}

	public ArrayList<Product> highList(int currentPage, int limit, String category) {
		Connection con = getConnection();
		
		ArrayList<Product> prdList = new ProductDao().highList(con, currentPage, limit, category);
		
		close(con);
		
		return prdList;
	}

	public ArrayList<Product> recommendList(int currentPage, int limit, String category) {
		Connection con = getConnection();
		
		ArrayList<Product> prdList = new ProductDao().recommendList(con, currentPage, limit, category);
		
		close(con);
		
		return prdList;
	}
	public ArrayList<Product> bestPrd(String category) {
		Connection con = getConnection();
		
		ArrayList<Product> bestPrd = new ProductDao().bestPrd(con, category);
		
		close(con);
		
		return bestPrd;
	}
}
