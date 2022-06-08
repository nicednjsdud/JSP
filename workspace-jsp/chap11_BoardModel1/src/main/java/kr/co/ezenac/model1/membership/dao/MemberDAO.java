package kr.co.ezenac.model1.membership.dao;

import java.sql.SQLException;

import kr.co.ezenac.model1.common.JDBConnection;
import kr.co.ezenac.model1.membership.dto.MemberDTO;



public class MemberDAO extends JDBConnection{
	
	public MemberDAO(String drv,String url,String id,String pw) {
		super(drv,url,id,pw);
	}
	public MemberDTO getMember(String uid,String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM MEMBER WHERE ID = ? AND PASS = ?";
		
		try {
			psmt = conn.prepareStatement(query);
			psmt.setString(1,uid);				// 쿼리문의 첫번째 파라미터 값 설정
			psmt.setString(2, upass);			// 쿼리문의 두번째 파라미터 값 설정
			rs = psmt.executeQuery();			// 쿼리문 실행
			
			if(rs.next()) {
				// 쿼리 결과로 얻은 회원정보를 dto 객체에 저장
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
}
