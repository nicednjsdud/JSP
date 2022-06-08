package kr.co.ezenac.model1.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

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
	public JDBConnection(ServletContext application) {
		// JDBC 드라이버 로드
		String driver = application.getInitParameter("OracleDriver");
		try {
			Class.forName(driver);

			// DB연결
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePw");
			conn = DriverManager.getConnection(url,id,pwd);
			System.out.println("db 연결 성공! - 매개변수 application");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
