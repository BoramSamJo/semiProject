package common;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplete {
   public static Connection getConnection() {
	   Connection conn = null;
	   Properties prop = new Properties();
	   
	   String fileName = JDBCTemplete.class.getResource("/sql/driver.properties").getPath();
	   
	   System.out.println("Service단에서 connection 객체 만들기 : " + fileName);
	   
	   try {
		  
		prop.load(new FileReader(fileName));
		
		String driver = prop.getProperty("driver");
		String url = prop.getProperty("url");
		String user = prop.getProperty("user");
		String pwd = prop.getProperty("pwd");
		
		//1. Driver 등록
		Class.forName(driver);
		
		//2. DBMS와 연결
		conn = DriverManager.getConnection(url,user,pwd);
		
		conn.setAutoCommit(false);
		
	} catch (FileNotFoundException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return conn;
	   
   }
   
   public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed())
				stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed())
				rset.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
				conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
				conn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}