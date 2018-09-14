

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

public class testService {
	public int[] Count(){
		Connection con = getConnection();
		
		int list[] = new testDao().Count(con);
		
		close(con);
		
		return list;
	}
}
