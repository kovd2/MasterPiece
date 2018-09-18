package com.kh.MasterPiece.cart.model.service;

import static com.kh.MasterPiece.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.MasterPiece.cart.model.dao.CartDao;
import com.kh.MasterPiece.cart.model.vo.Cart;
import com.kh.MasterPiece.member.model.vo.Member;
import com.kh.MasterPiece.product.model.vo.Product;

public class CartService {
	Member m = new Member();
	Cart c = new Cart();
	Product p = new Product();
	public int insertCart() {
		Connection con = getConnection();
		
		int result = new CartDao().insertCart(con, m, c, p);
		
		return 0;
	}
	
}
