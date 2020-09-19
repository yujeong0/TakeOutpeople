package pknu.it;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection 
{
	public static Connection getConnection() throws SQLException, NamingException, ClassNotFoundException{
		Class.forName("oracle.jdbc.OracleDriver");// Oracle JDBC 드라이버를 로딩

		Connection conn = DriverManager.getConnection(	// oracle 서버에 접속
				"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
				"db201712000", 
				"201712000"); 

		return conn;
	}
}	
	
