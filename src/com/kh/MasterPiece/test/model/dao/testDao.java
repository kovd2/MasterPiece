package com.kh.MasterPiece.test.model.dao;



import static com.kh.MasterPiece.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;


public class testDao {
	private Properties prop = new Properties();

	public testDao() {
		String fileName = testDao.class.getResource("/sql/test-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int[] Count(Connection con){
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectCount");
		
		int[] result = {0,0,0,0};
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			System.out.println(query);
			int i = 0;
			while(rset.next()){
				System.out.println(rset.getInt(1) + " : " + rset.getInt(2));
				result[i] = rset.getInt(2);
				i++;
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
			
		}
	
		
		
		return result;
		
	}
	
}
