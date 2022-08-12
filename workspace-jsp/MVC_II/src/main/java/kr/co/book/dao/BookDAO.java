package kr.co.book.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.co.book.common.JDBConnection;
import kr.co.book.dto.BookDTO;

public class BookDAO extends JDBConnection{
	
	public BookDAO() {
		
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;	
		
		String query = "SELECT count(*) FROM book2 ";
		if(map.get("searchWord") !=null) {
			query += "WHERE "+map.get("searchField")+" "+" LIKE '%"
											+map.get("searchWord")+"%'";
		}
		
		 try {
			stmt = conn.createStatement();		
			rs = stmt.executeQuery(query);		
			rs.next();							
			totalCount = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return totalCount;
	}
	
	public List<BookDTO> selectListPage(Map<String, Object> map){
		List<BookDTO> bookList = new ArrayList<>();
		
		String query = "SELECT * FROM ( "+
					   "SELECT tb.*, ROWNUM rnum FROM ( "+
					   "SELECT * FROM book2";
		if(map.get("searchWord") !=null) {
			query += "WHERE "+map.get("searchField")+" "+" LIKE '%"
											+map.get("searchWord")+"%'";
		}
		query += " ORDER BY bookID DESC"
				+ ") tb"
				+ ")"
				+ "where rnum BETWEEN ? AND ?";
		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2,map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BookDTO dto = new BookDTO();
				
				dto.setBookID(rs.getLong(1));
				dto.setBookName(rs.getString(2));
				dto.setAuthor(rs.getString(3));
				dto.setPublisher(rs.getString(4));
				dto.setPrice(rs.getString(5));
				dto.setPublicationDate(rs.getString(6));				
				bookList.add(dto);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();		
		}	
		return bookList;
	}
	public int insertWrite(BookDTO dto) {
		int result = 0;
		
		String query = "INSERT INTO book2 "+
						" (BOOKID, BOOKNAME, AUTHOR, PUBLISHER, PRICE, PUBLICATIONDATE) "+
						" VALUES (?, ?, ?, ?, ?, ?)";
		
		try {
			psmt = conn.prepareStatement(query);
			psmt.setLong(1, dto.getBookID());
			psmt.setString(2, dto.getBookName());
			psmt.setString(3, dto.getAuthor());
			psmt.setString(4, dto.getPublisher());
			psmt.setString(5, dto.getPrice());
			psmt.setString(6, dto.getPublicationDate());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}	
		return result;
	}
}
