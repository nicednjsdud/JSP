package kr.co.book.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

public class JsFunction {
	
	public static void alertLocation(HttpServletResponse response, String msg, String url) {
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			String script = ""
							+"<script>"
							+"alert( '"+msg+"');"
							+"location.href='"+url+"'; "
							+"</script>";
			out.print(script);
		}catch(Exception e) {
			
		}
	}
	public static void alertBack(HttpServletResponse response, String msg) {
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			String script = ""
							+"<script>"
							+"alert( '"+msg+"');"
							+"history.back(); "
							+"</script>";
			out.print(script);
		}catch(Exception e) {
			
		}
	}
}
