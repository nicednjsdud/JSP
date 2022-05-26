package kr.co.ezenac.member04;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member3")
public class MemberServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		MemberDAO dao = new MemberDAO();
		
		String command = request.getParameter("command");		// command 값 받아옴
		if(command !=null && command.equals("addMember")) {		// 회원 가입창에서 전송된 command가 addMember라면
			String _id = request.getParameter("id");			// 전송된 값들을 받아옴
			String _pwd = request.getParameter("pwd");
			String _name = request.getParameter("name");
			String _email = request.getParameter("email");		// 회원가입창에서 전송된 값들을 얻어옴
			
			MemberVO vo = new MemberVO();
			vo.setId(_id);
			vo.setPwd(_pwd);
			vo.setName(_name);
			vo.setEmail(_email);
			
			dao.addMember(vo);
		}
		else if(command !=null && command.equals("delMember")) {
			String id = request.getParameter("id");
			dao.delMember(id);
		}
		
		List<MemberVO> list = dao.listMembers();
		
		out.print("<html>");
		out.print("<body>");
		out.print("<table border=1><tr align='center' bgcolor='lightgreen'>");
		
		
		out.print("<td>아이디</td>");
		out.print("<td>비밀번호</td>");
		out.print("<td>이름</td>");
		out.print("<td>이메일</td>");
		out.print("<td>가입일</td><td>삭제</td></tr>");
		
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
			out.print("<td>"+joindate+"</td><td>"+"<a href='/chap03_Servlet/member3?command=delMember&id="+id+" '>삭제</a></td>");
			out.print("</tr>");
		}
		
		out.print("</table></html>");
		out.print("</body>");
		
	}
}
