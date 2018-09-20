package com.kh.MasterPiece.product.model.service;

import static com.kh.MasterPiece.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.product.model.dao.ProductDao;
import com.kh.MasterPiece.product.model.vo.Product;

public class ProductService {

	public ArrayList<Product> selectListAll() {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectListAll(con);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Attachment> imgList() {
Connection con = getConnection();
		
		HashMap<String, Attachment> imgList = new ProductDao().imgList(con);
		
		close(con);
		
		return imgList;
	}
	

}
