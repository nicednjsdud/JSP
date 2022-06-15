package kr.co.ezenac.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajaxLab02")
public class AjaxLab02 extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String result = "";
		PrintWriter out = response.getWriter();
		
		// 도서정보를 xml로 작성한 후 클라이언트로 전송
		result = "<main><book>" +
				"<title><![CDATA[Spring Securit 3/e]]></title>" +
				"<writer><![CDATA[믹 넛슨]]></writer>" +
				"<image><![CDATA[http://localhost:8080/chap14_Ajax/image/image2.jpg]]></image>" +
				"</book>"+
				"<book>"+
				"<title><![CDATA[함수형 코틀린]]></title>" +
				"<writer><![CDATA[마리오 아리아스]]></writer>" +
				"<image><![CDATA[http://localhost:8080/chap14_Ajax/image/image.jpg]]></image>" +
				"</book>"+
				 "</main>";
		System.out.println(result);
		out.print(result);
	}
}
