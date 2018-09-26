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
}
