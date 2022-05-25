package kr.co.ezenac.member03;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	
	private Connection conn;			
	private Statement stmt;				
	private PreparedStatement pstmt;	
	private ResultSet rs;	
	private DataSource dataFactory;
	
	// 연결 해제(자원 반납)
	public void close() {
		try {
			if(rs != null)rs.close();
			if(stmt !=null)stmt.close();
			if(pstmt !=null)pstmt.close();
			if(conn!=null)conn.close();		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberDAO() {
		try {
			// 커넥션 풀(DataSource) 얻기
			/* 자바의 네이밍 서비스(JNDI)에서 이름과 실제 객체를 연결해주는 개념이 Context임
			   InitialContext는 네이밍 서비스를 이용하기위한 시작점임. */
			Context ctx= new InitialContext();		// InitialContext 객체 생성
			
			// java:comp/env  <- 현재 웹 어플리케이션의 루트 디렉토리
			// 현재 웹 어플리케이션이 사용할 수 있는 모든 자원은 java:comp/env 아래에 위치함.
			Context envContext = (Context) ctx.lookup("java:comp/env");
			// java:comp/env 아래에 위치한 jdbc/oracle 자원을 얻어옴
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public List<MemberVO> listMembers(){
		List<MemberVO> list = new ArrayList<>();
		
		String query = "SELECT * FROM T_MEMBER";
		System.out.println(query);
		
		try {
			// 커넥션 풀을 통해 연결 얻기
			// 데이터소스를 통해 풀에 생성되어 있는 연결 객체를 얻어옴
			conn = dataFactory.getConnection();
			
			pstmt = conn.prepareStatement(query);	//prepareStatement()메서드에 SQL문을 전달해 객체생성
			
			// select 쿼리문을 실행할 떄 사용함.
			// 조회한 레코드들의 집한인 Resultset 객체를 반환함
			rs = pstmt.executeQuery();		// 미리 설정한 SQL문 실행
			while(rs.next()) {
				String id = rs.getString("ID");
				String pw = rs.getString("PWD");
				String name = rs.getString("NAME");
				String email = rs.getString("EMAIL");
				Date joinDate = rs.getDate("JOINDATE");		// 조회한 레코드의 각 컬럼 값을 받아 옴.	
				MemberVO vo = new MemberVO();
				vo.setId(id);
				vo.setPwd(pw);
				vo.setName(name);
				vo.setEmail(email);
				vo.setJoinDate(joinDate);	// 각 컬럼 값을 다시 MemberVO 객체의 속성에 설정함. 
				list.add(vo);				// 설정된 MemberVO 객체를 다시 ArrayList에 저장함.
			}
		close();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;			// 조회한 레코드의 개수만큼 MemberVO 객체를 저장한 ArrayList를 반환함.
	}
}
