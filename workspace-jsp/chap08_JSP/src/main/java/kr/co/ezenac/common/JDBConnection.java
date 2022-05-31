package kr.co.ezenac.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBConnection {
	public Connection conn;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	// 기본 생성자
	public JDBConnection() {
		try {
			// JDBC 드라이버 로드
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// DB 연결
			String url="jdbc:oracle:thin:@localhost:1521:XE";
			String id = "ezen";
			String pwd = "0824";
			
			conn = DriverManager.getConnection(url,id,pwd);
			System.out.println("db 연결 성공");
			
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public JDBConnection(String driver, String url,String id, String pwd) {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,id,pwd);
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
	}
	public void close() {
		try {
		if(rs !=null) rs.close();
		if(psmt !=null) rs.close();
		if(conn !=null) rs.close();
		
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}











