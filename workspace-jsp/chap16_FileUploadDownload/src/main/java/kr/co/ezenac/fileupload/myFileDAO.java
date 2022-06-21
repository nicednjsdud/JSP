package kr.co.ezenac.fileupload;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.ezenac.common.JDBConnection;

public class myFileDAO extends JDBConnection {
	
	// 새로운 게시물을 입력
	public int insertFile(myFileDTO dto) {
		int applyResult = 0;
		
		String query = "INSERT INTO EZEN.MYFILE (IDX, NAME, TITLE, CATE, OFILE, SFILE) VALUES (seq_board_num.nextval, ?, ?, ?, ?, ?)";
				
		
		try {
			psmt=conn.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			applyResult = psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert 중 예외 발생");
			e.printStackTrace();
		}
		
		return applyResult;
	}
	
	// 파일 목록 반환
	public List<myFileDTO> myFileList(){
		List<myFileDTO> fileList = new ArrayList<>();
		
		String query = "SELECT * FROM MYFILE ORDER BY IDX DESC";
		
		try {
			psmt = conn.prepareStatement(query);		// 쿼리준비
			rs=psmt.executeQuery();						// 쿼리실행
			
			while(rs.next()) {							// 목록안의 파일 수만큼 반복
				myFileDTO dto = new myFileDTO();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setPostdate(rs.getString(7));
				fileList.add(dto);
			}
		}catch(SQLException e) {
			System.out.println("select시 예외 발생");
			e.printStackTrace();
		}
		
		return fileList;
	}
}
