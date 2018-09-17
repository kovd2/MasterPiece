package com.kh.MasterPiece.product.model.service;

import static com.kh.MasterPiece.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.MasterPiece.product.model.dao.ProductDao;
import com.kh.MasterPiece.product.model.vo.Product;

public class ProductService {
	//장바구니 추가
	public ArrayList<Product> selectAllCart() {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectAllCart(con);
		
		close(con);
		
		
		return list;
	}

	public ArrayList<Product> showCart() {
		Connection con = getConnection();
		ArrayList<Product> list = new ProductDao().showCart(con);
		
		close(con);
		
		return list;
	}

}
