package com.kh.MasterPiece.product.model.service;

import static com.kh.MasterPiece.common.JDBCTemplate.close;
import static com.kh.MasterPiece.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.board.model.dao.BoardDao;
import com.kh.MasterPiece.board.model.vo.Attach;
import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.product.model.dao.ProductDao;
import com.kh.MasterPiece.product.model.vo.Product;

public class ProductService {

	public ArrayList<Product> selectListAll(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectListAll(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Attachment> imgList() {
		Connection con = getConnection();
		
		HashMap<String, Attachment> imgList = new ProductDao().imgList(con);
		
		close(con);
		
		return imgList;
	}

	public Product prdDetail(String code) {
		Connection con = getConnection();
		
		Product p = new ProductDao().prdDetail(con, code);
		
		return p;
	}
	

	public Attachment detailImg(String code) {
		Connection conn = getConnection();
		
		Attachment a = new ProductDao().detailImg(conn, code);
		
		return a;
	}

	

}
