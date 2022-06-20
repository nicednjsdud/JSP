package kr.co.ezenac.model2.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import kr.co.ezenac.model2common.JDBConnection;



public class BoardDAO extends JDBConnection {		// DB 연결을 위한 클래스 상속
	
	
	public BoardDAO() {	
								
	}
	
	// (검색 조건에 맞게) 보드 테이블에 저장된 게시물의 개수 반환
	// 목록에서 번호를 출력
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;	// 결과(게시물 수)를 담는 변수
		
		// 게시물 수를 얻어오는 쿼리문
		// Map 컬렉션에 저장된 값(검색어)이 있는 경우 Map 컬렉션에 키로 저장된 값이 있을때만 where절을 추가
		String query = "SELECT count(*) FROM mvcboard ";
		if(map.get("searchWord") !=null) {
			query += "WHERE "+map.get("searchField")+" "+" LIKE '%"
											+map.get("searchWord")+"%'";
		}
		
		 try {
			stmt = conn.createStatement();		// 쿼리문 실행하기 위해 Statement 객체 생성
			rs = stmt.executeQuery(query);		// SELECT 쿼리문 실행. 실행 결과는 Result객체에 담음
			rs.next();							// 커서를 첫번째 행으로 이동
			totalCount = rs.getInt(1);			// ResultSet객체의 1번(첫번째) 인덱스의 결과를 정수로 가져옴
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return totalCount;
	}
	
	// board 테이블의 레코드를 가죠와서 반환함.
	// 이 메서드가 반환한 resultSet 객체로부터 게시물 목록을 반복하여 출력 (paging 기능)
	public List<BoardDTO> selectListPage(Map<String, Object> map){
		List<BoardDTO> board = new ArrayList<>(); // 게시물 목록(결과)을 담을 변수
		
		String query = "SELECT * FROM ( "+
					   "SELECT tb.*, ROWNUM rnum FROM ( "+
					   "SELECT * FROM MVCBOARD";
		if(map.get("searchWord") !=null) {	// Map컬렉션에 값이 있을때만 검색을 위한 where절 추가
			query += "WHERE "+map.get("searchField")+" "+" LIKE '%"
											+map.get("searchWord")+"%'";
		}
		query += " ORDER BY ROWNUM DESC"
				+ ") tb"
				+ ")"
				+ "where ROWNUM BETWEEN ? AND ?";
		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2,map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDownload(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				
				board.add(dto);
				
			}
			
		} catch (SQLException e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
			
		}
		
		return board;
	}
	
	
}





























