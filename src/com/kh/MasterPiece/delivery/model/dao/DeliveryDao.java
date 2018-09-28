package com.kh.MasterPiece.delivery.model.dao;

import static com.kh.MasterPiece.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;

import java.util.Properties;

import com.kh.MasterPiece.product.model.dao.ProductDao;

public class DeliveryDao {
	private Properties prop = new Properties();
	public DeliveryDao()
	{
		String fileName = ProductDao.class.getResource("/sql/delivery/delivery-query.properties").getPath();
		
		try
		{
			prop.load(new FileReader(fileName));
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
