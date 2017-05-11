package pds.model.jdbc;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

	private static Connection conn;
	
	private ConnectionProvider() throws Exception
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:scott", "scott", "tiger");
	}
	
	public static Connection getConnection() throws Exception {
		if( conn == null){
			new ConnectionProvider();
		}
		return conn;
	}
}
