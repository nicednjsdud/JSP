package kr.co.ezenac02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet02
 */
@WebServlet("/login2")
public class LoginServlet02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 메서드 호출");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		System.out.println("destroy 메서드 호출");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 웹 브라우저에서 전송된 데이터의 인토딩 설정
		request.setCharacterEncoding("utf-8");
		
		// 응답할 데이터 종류가 html임 설정
		response.setContentType("text/html;charset=utf-8");
		
		String userId = request.getParameter("user_id");
		String userPw = request.getParameter("user_pw");
		// 출력 스트림 PrintWriter 객체
		PrintWriter out = response.getWriter();
		
		// 브라우저로 출력할 데이터를 문자열로 연결해서 html태그로 만듦
		String data = "<html>";
		data += "<body>";
		data += "아이디 : "+ userId;
		data += "<br>";
		data += "패스워드 : "+userPw;
		data += "</body>";
		data += "</html>";
		
		// html 태그 문자열을 웹브라우저로 출력함
		out.print(data);
	}

}





















