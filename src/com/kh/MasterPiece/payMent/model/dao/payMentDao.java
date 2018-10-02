package com.kh.MasterPiece.payMent.model.dao;

import static com.kh.MasterPiece.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

import com.kh.MasterPiece.admin.model.dao.testDao;
import com.kh.MasterPiece.cart.model.vo.Cart;
import com.kh.MasterPiece.member.model.vo.Member;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class payMentDao {
	private Properties prop = new Properties();

	public payMentDao() {
		String fileName = testDao.class.getResource("/sql/delivery/delivery-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Cart> selectPayMentList(Connection con, int currentPage, int limit, Member m, String prdCode) {
		PreparedStatement pstmt = null;

		ResultSet rset = null;
		ArrayList<Cart> list = null;


		String query = prop.getProperty("selectPayMentList");

		try {

			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getOrderCheck());
			pstmt.setString(3, prdCode);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Cart>();

			while(rset.next()){
				
				Cart c = new Cart();
				c.setPrd_code(rset.getString("PRD_CODE"));
				c.setPrd_name(rset.getString("PRD_NAME"));
				c.setPrice(rset.getInt("PRICE"));
				c.setOrder_count(rset.getInt("ORDER_COUNT"));
				c.setHap(rset.getInt("HAP"));
				
				list.add(c);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}



		return list;
	}

	public int payMentBank(Connection con, String id, int price, String select, String name, String recipient, String address, String tel, String etc) {
		PreparedStatement pstmt = null;
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("insertPayment");

		try {

			pstmt = con.prepareStatement(query);

			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setInt(3, price);
			pstmt.setString(4, "결제");
			pstmt.setString(5, select);
			pstmt.setString(6, address);
			pstmt.setString(7, tel);
			pstmt.setString(8, etc);
			pstmt.setString(9, recipient);
			
			result = pstmt.executeUpdate();
			stmt = con.createStatement();
			rset = stmt.executeQuery("SELECT SEQ_PAY_NO.CURRVAL FROM DUAL");
			if(rset.next()){
				result = rset.getInt(1);
				System.out.println(result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(stmt);
			close(rset);
		}

		return result;
	}

	public int testUp(Connection con, String orderCheck, int result2) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateTest");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, result2);
			pstmt.setString(2, orderCheck);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int payMentCard(Connection con, String id, int price, String select, String applyno, String recipient, String address, String tel, String etc) {
		PreparedStatement pstmt = null;
		int result2 = 0;
		
		String query = prop.getProperty("cardPayment");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.setString(2, applyno);
			pstmt.setInt(3, price);
			pstmt.setString(4, "결제");
			pstmt.setString(5, select);
			pstmt.setString(6, address);
			pstmt.setString(7, tel);
			pstmt.setString(8, etc);
			pstmt.setString(9, recipient);
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result2;
	}

	public int testUp2(Connection con, String orderCheck, int result3) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateTest2");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, result3);
			pstmt.setString(2, orderCheck);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int afterPayment(Connection con, String id, String orderCheck) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("afterPayment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, orderCheck);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int buyHistory(Connection con, String orderCheck) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("buyHistory");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, orderCheck);
			pstmt.setString(2, "입금 확인 중");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int buyHistory2(Connection con, String orderCheck) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("buyHistory2");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, orderCheck);
			pstmt.setString(2, "배송 준비 중");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public HashMap<String, Integer> count(Connection con, String orderCheck) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("updateCount");
		
		HashMap<String, Integer> list = new HashMap<String, Integer>();
		try {
			pstmt = con.prepareStatement(query);
			
			
			pstmt.setString(1, orderCheck);
			
			rset = pstmt.executeQuery();
			while(rset.next()){
				list.put(rset.getString("prd_code"), rset.getInt("order_count"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return list;
		
	}

	public int update(Connection con, HashMap<String, Integer> map) {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("update");
//		update product set sell_count = sell_count + ? where prd_code = ?
		ArrayList<String> key = new ArrayList<String>();
		Set<String> set = map.keySet();
		Iterator<String> iter = set.iterator();
		int j = 0;
		while(iter.hasNext()){
			key.add(iter.next());
			System.out.println(key.get(j++));
		}
		int count = 0;
		try {
			System.out.println(map.size());
			/*for(int i = 0; i < map.size(); i++){
			stmt = con.createStatement();
			rset = stmt.executeQuery("select sell_count from product where prd_code ="+key.get(i));
			if(rset.next()){
				count = rset.getInt(1);
			}
			pstmt = con.prepareStatement(query);
			System.out.println(query);
			pstmt.setInt(1, count + map.get(key.get(i)));
			pstmt.setString(2, key.get(i));
			System.out.println("asdf");
			result += pstmt.executeUpdate();
			System.out.println("end1");
			}
			System.out.println("end2");*/
			
			pstmt = con.prepareStatement(query);
			result += pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(stmt);
			close(rset);
		}
		
		return result;
	}

}
