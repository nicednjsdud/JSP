package kr.co.ezenac.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/json")
public class JsonServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 문자열로 전송된 JSON 데이터를 가져옴
		String jsonInfo = request.getParameter("jsonInfo");
		
		// JSON데이터를 처리하기위해 JSONParser객체 생성
		JSONParser jsonParser = new JSONParser();
		try {
			//전송된 JSON 데이터를 파싱
			JSONObject jsonObject =(JSONObject) jsonParser.parse(jsonInfo);
			
			System.out.println("회원 정보");
			// JSON 데이터의 name속성들을 get()전달해 value 출력함.
			System.out.println(jsonObject.get("name"));
			System.out.println(jsonObject.get("age"));
			System.out.println(jsonObject.get("gender"));
			System.out.println(jsonObject.get("nickname"));
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
	}
}
