package kr.co.ezenac.model1.board.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import kr.co.ezenac.model1.board.dto.BoardDTO;
import kr.co.ezenac.model1.common.JDBConnection;

public class BoardDAO extends JDBConnection {		// DB 연결을 위한 클래스 상속
	
	public BoardDAO(ServletContext application) {	// application 내장객체를 매개변수로 사용
		super(application);							// 부모클래스의 생성자 application 내장객체를 전달
	}
	
	// (검색 조건에 맞게) 보드 테이블에 저장된 게시물의 개수 반환
	// 목록에서 번호를 출력
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;	// 결과(게시물 수)를 담는 변수
		
		// 게시물 수를 얻어오는 쿼리문
		// Map 컬렉션에 저장된 값(검색어)이 있는 경우 Map 컬렉션에 키로 저장된 값이 있을때만 where절을 추가
		String query = "SELECT count(*) FROM board ";
		if(map.get("searchWord") !=null) {
			query += "WHERE "+map.get("searchField")+" "+" LIKE '%"
											+map.get("searchWord")+"%'";
		}
		
		 try {
			stmt = conn.createStatement();		// 쿼리문 생성
			rs = stmt.executeQuery(query);		// 쿼리문 실행
			rs.next();							// 커서를 첫번째 행으로 이동
			totalCount = rs.getInt(1);			// 첫번째 컬럼값을 가져옴
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return totalCount;
	}
	
	// board 테이블의 레코드를 가죠와서 반환함.
	// 이 메서드가 반환한 resultSet 객체로부터 게시물 목록을 반복하여 출력
	public List<BoardDTO> selectList(Map<String, Object> map){
		List<BoardDTO> bbs = new ArrayList<>(); // 게시물 목록(결과)을 담을 변수
		
		String query = "SELECT * FROM BOARD ";
		if(map.get("searchWord") !=null) {	// Map컬렉션에 값이 있을때만 검색을 위한 where절 추가
			query += "WHERE "+map.get("searchField")+" "+" LIKE '%"
											+map.get("searchWord")+"%'";
		}
		query += " ORDER BY num DESC";		// 항상 최근게시물이 상단에 출력 (num 내림차순)
		try {
			stmt =conn.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				// 쿼리실행 결과인 게시물 내용을 dto 에 저장을 함.
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));	// 일렬 번호
				dto.setTitle(rs.getString("title"));	// 제목
				dto.setContent(rs.getString("content"));// 내용
				dto.setPostdate(rs.getDate("postdate"));// 작성일
				dto.setId(rs.getString("id"));			// 작성자의 아이디
				dto.setVisitcount(rs.getString("visitcount")); //조회수
				
				bbs.add(dto);					// 결과목록에 저장
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return bbs;
	}
	
}
