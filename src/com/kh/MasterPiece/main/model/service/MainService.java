package com.kh.MasterPiece.main.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.main.model.dao.MainDao;
import com.kh.MasterPiece.main.model.vo.MainTest;
import com.kh.MasterPiece.product.model.dao.ProductDao;
import com.kh.MasterPiece.product.model.vo.Product;

import static com.kh.MasterPiece.common.JDBCTemplate.*;


public class MainService {
	
	//그래픽 페이징 처리 메소드
	public int getlistCount1() {
		Connection con = getConnection();
		
		int listCount = new MainDao().getListCount1(con);
		
		close(con);
		
		return listCount;
	}
	//CPU 페이징 처리 메소드
	public int getlistCount2() {
		Connection con = getConnection();
		
		int listCount = new MainDao().getListCount2(con);
		
		close(con);
		
		return listCount;
	}
	
	//그래픽 리스트 불러오는 메소드
	public ArrayList<Product> graphicList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new MainDao().graphicList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	//CPU 리스트 불러오는 메소드
	public ArrayList<Product> cpuList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new MainDao().cpuList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	//모든 상품 불러오는 메소드
	public ArrayList<Product> allList() {
		Connection con = getConnection();
		
		ArrayList<Product> list = new MainDao().allList(con);
		
		close(con);
		
		return list;
	}
	
	//이미지 불러오는 메소드
	public HashMap<String, Attachment> selectImageList() {
		Connection con = getConnection();
		
		HashMap<String, Attachment> list = new MainDao().selectImageList(con);
		
		close(con);
		
		return list;
	}
	
	//메인 배너
	public ArrayList<Board> mainBanner() {
		Connection con = getConnection();
		
		ArrayList<Board> banner = new MainDao().mainBanner(con);
		
		close(con);
		
		return banner;
	}
	
	//검색한 상품 리스트
	public ArrayList<Product> searchList(String search, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new MainDao().searchList(con, search, currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	//검색 페이징
	public int searchCount(String search) {
		Connection con = getConnection();
		
		int listCount = new MainDao().searchCount(con, search);
		
		close(con);
		
		return listCount;
	}
}














