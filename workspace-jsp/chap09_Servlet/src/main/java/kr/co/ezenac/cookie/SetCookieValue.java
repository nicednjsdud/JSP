package kr.co.ezenac.cookie;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.zip.DataFormatException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/set2")
public class SetCookieValue extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date date = new Date();
		String dateStr = dateFormat.format(date);
		
		// Cookie 객체를 생성한 후 cookieTest 이름으로 한글정보를 인코딩해서 쿠키에 저장함
		Cookie c =  new Cookie("cookieTest2", 
				URLEncoder.encode(dateStr,"utf-8"));
		c.setMaxAge(24*60*60);		// 유효기간 설정(하루)
		response.addCookie(c);		// 생성된 쿠키를 브라우저로 전송함
		
		out.print("현재 시간 : "+dateStr);
		out.print("현재 시간을 Cookie로 저장합니다.");
		
		
	}
}
