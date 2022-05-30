package kr.co.ezenac.cookie;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/set")
public class SetCookieValue extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Date d = new Date();
		
		// Cookie 객체를 생성한 후 cookieTest 이름으로 한글정보를 인코딩해서 쿠키에 저장함
		Cookie c =  new Cookie("cookieTest", 
				URLEncoder.encode("Servlet 쿠키 프로그래밍입니다.","utf-8"));
		c.setMaxAge(24*60*60);		// 유효기간 설정(하루)
		response.addCookie(c);		// 생성된 쿠키를 브라우저로 전송함
		
		out.print("현재 시간 : "+d);
		out.print("현재 시간을 Cookie로 저장합니다.");
	}
}
