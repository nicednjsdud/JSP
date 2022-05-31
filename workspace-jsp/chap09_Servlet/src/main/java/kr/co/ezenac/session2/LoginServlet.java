package kr.co.ezenac.session2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;chatset=utf-8");
		PrintWriter out = response.getWriter();
		
		String userId= request.getParameter("user_id");
		String userPw= request.getParameter("user_pw");
		
		MemberVO memberVO= new MemberVO();
		memberVO.setId(userId);
		memberVO.setPwd(userPw);
	}
}
