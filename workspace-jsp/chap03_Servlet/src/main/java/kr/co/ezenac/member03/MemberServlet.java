package kr.co.ezenac.member03;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/member2")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberDAO dao = new MemberDAO();			// SQL문으로 조회할 MemberDAO 객체를 생성함
		List<MemberVO> list = dao.listMembers();	// listMembers() 메서드로 회원 정보를 조회함
		
		out.print("<html>");
		out.print("<body>");
		out.print("<table border=1><tr align='center' bgcolor='lightgreen'>");
		
		out.print("<td>아이디</td>");
		out.print("<td>비밀번호</td>");
		out.print("<td>이름</td>");
		out.print("<td>이메일</td>");
		out.print("<td>가입일</td></tr>");
		
		for(int i=0;i<list.size();i++) {
			MemberVO memberVO = list.get(i);	// 조회한 회원 정보를 for문 <tr> 태그 이용해서 출력함
			String id = memberVO.getId();
			String pw = memberVO.getPwd();
			String name = memberVO.getName();
			String email = memberVO.getEmail();
			Date joindate = memberVO.getJoinDate();
			out.print("<tr><td>"+id+"</td>");
			out.print("<td>"+pw+"</td>");
			out.print("<td>"+name+"</td>");
			out.print("<td>"+email+"</td>");
			out.print("<td>"+joindate+"</td></tr>");
		}
		
		out.print("</table></html>");
		out.print("</body>");
	}

}
