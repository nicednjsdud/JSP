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
	
	// 게시글 데이터를 받아 DB에 추가함
	public int insertWrite(BoardDTO boardDTO) {
		int result = 0;
		
		String query = "INSERT INTO board (num,title,content,id,visitcount) "
				+ "VALUES (seq_board_num.nextval, ?, ?, ?, 0)";
		
		try {
			psmt = conn.prepareStatement(query);
			
			psmt.setString(1, boardDTO.getTitle());
			psmt.setString(2,boardDTO.getContent());
			psmt.setString(3, boardDTO.getId());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 선택한 게시물 상세 내용 반환하기
	public BoardDTO selectView(String num) {		// 매개변수로 전달한 일렬번호
		BoardDTO dto = new BoardDTO();
		
		// 쿼리문 준비
		/*
		 *  member 테이블과 조인
		 *  - board 테이블에는 작성자 아이디만 저장되므로 
		 *    이름을 출력하기 위해서는 member 테이블과 조인 필요
		 */
		String query = "SELECT b.*,m.NAME "
						+"FROM MEMBER m "
						+"INNER JOIN BOARD b ON m.ID = b.ID "
						+"WHERE num = ?";
		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, num);		// 인파라미터를 일렬번호로 설정
			rs = psmt.executeQuery();
			
			// 결과 처리
			if(rs.next()) {			// ResultSet 객체로 반환된 행을 확인
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));	 	// DTO 객체에 저장함 
			}
			
		} catch (SQLException e) {
			System.out.println("게시물 상세보기 예외 발생");
			e.printStackTrace();
		}
		
		return dto;								// dto 반환 
	}
	
	// 선택된 게시물의 조회수 1 증가시킴
	public void updateVisitCount(String num) {		// 조회수 증가시킬 게시물의 일련번호를 매개변수로 받음
		
		String query="UPDATE BOARD SET VISITCOUNT = VISITCOUNT +1 WHERE num = ?";
		
		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, num);					// 인파라미터를 일련번호로 설정
			psmt.executeQuery();					// 쿼리 실행
			
		}catch(SQLException e){
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
		
	}
	
	// 지정한 게시물 수정함
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		
		//
		
		return result;
	}
}





























