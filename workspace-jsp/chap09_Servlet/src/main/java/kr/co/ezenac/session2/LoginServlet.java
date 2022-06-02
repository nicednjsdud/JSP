package kr.co.ezenac.session2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 로그인차에서 전송ID와 비밀번호를 가져옴
		String userId= request.getParameter("user_id");
		String userPw= request.getParameter("user_pw");
		
		MemberVO memberVO= new MemberVO();
		memberVO.setId(userId);
		memberVO.setPwd(userPw);
		
		MemberDAO dao = new MemberDAO();
		boolean result = dao.isExisted(memberVO);
		
		if(result) {
			HttpSession session = request.getSession();
			// 조회한 결과가 true이면 isLogon속성을 true로 세션에 저장
			session.setAttribute("isLogon", true);
			// 조회한 결과가 true이면 ID와 비밀번호를 세션에 저장
			session.setAttribute("login.id", userId);
			session.setAttribute("login.pwd", userPw);
			
			out.print("<html><body>");
			out.print("안녕하세요 "+userId+"님!<br/>");
			out.print("<a href='show'>회원정보 보기</a>");
			out.print("</html></body>");
			
		}else {
			out.print("<html><body>");
			out.print("회원 아이디가 틀립니다.<br/>");
			out.print("<a href='login.html'>다시 로그인하기</a>");
			out.print("</html></body>");
		}
	}
}
