package kr.co.ezenac.model2common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;









public class JDBConnection {
	public Connection conn;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	
		public JDBConnection(String driver, String url,String id, String pwd) {
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url,id,pwd);
			} catch (ClassNotFoundException | SQLException e) {
				
				e.printStackTrace();
			}
		}
	public JDBConnection() {
		
		Context initCtx;
		try {
			// 커넥션 풀 얻기
			initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource source = (DataSource) ctx.lookup("jdbc/oracle");
		
				
			conn =source.getConnection();
				
		
			System.out.println("db커넥션 풀 연결 성공");
			
		
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			System.out.println("db커넥션 풀 연결 실패");
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt !=null)
				stmt.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
