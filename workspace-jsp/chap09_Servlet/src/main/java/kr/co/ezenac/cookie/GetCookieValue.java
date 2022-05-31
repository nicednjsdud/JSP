package kr.co.ezenac.cookie;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.util.URLEncoder;

@WebServlet("/get2")
public class GetCookieValue extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 브라우저에게 쿠키 정보를 요청한 후 쿠키 정보를 배열로 가져옴
		Cookie[] allValues =request.getCookies();
		
		// 배열에서 저장할 떄 사용한 쿠키 이름인 cookieTest로 검색해 쿠키 값을 가져옴
		for(Cookie value :allValues) {
			if(value.getName().equals("cookieTest")) {
				out.print(
				"<h2>cookie 값 가져오기 : "+URLDecoder.decode(value.getValue(),"utf-8")+
				"<h2>"
						);
				
			}
		}
	}
}
