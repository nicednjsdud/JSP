package kr.co.ezenac.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajaxLab")
public class AjaxLab extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String param = request.getParameter("param");	// ajax로 전송된 매개변수 가져옴
		System.out.println("From Client : "+param);
		
		PrintWriter out = response.getWriter();
		out.print("안녕하세요. 서버가 보낸 메세지입니다.");	// 브라우저(클라이언트)에 응답 메세지 보냄
	}
}
