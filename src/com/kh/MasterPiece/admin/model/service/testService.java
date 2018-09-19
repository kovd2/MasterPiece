package com.kh.MasterPiece.admin.model.service;


import static com.kh.MasterPiece.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.admin.model.dao.testDao;
import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.product.model.vo.Product; 

public class testService {
	public int[] Count(){
		Connection con = getConnection();
		
		int list[] = new testDao().Count(con);
		
		close(con);
		
		return list;
	}

	public HashMap<String, String[]> selectList() {
		Connection con = getConnection();
		
		HashMap<String, String[]> hmap = new testDao().selectList(con);
		
		close(con);
		
		return hmap;
	}

	public ArrayList<Product> productList() {
		Connection con = getConnection();
		
		ArrayList<Product> list = new testDao().productList(con);
		
		close(con);
		return list;
	}

	public int insertProduct(Product p, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new testDao().insertProduct(con, p);
		
		if(result1 > 0){
			String code = p.getPrd_code();
			
			for(int i = 0; i < fileList.size(); i++){
				fileList.get(i).setCode(code);
			}
		}
		
		int result2 = new testDao().insertAttachment(con, fileList);
		
		if(result1 > 0 && result2 > 0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public HashMap<String, Attachment> imgList() {
		Connection con = getConnection();
		
		HashMap<String, Attachment> imgList = new testDao().imgList(con);
		
		close(con);
		return imgList;
	}
}
