package kr.co.ezenac.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/json3")
public class JsonServlet2 extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		JSONObject totalObject = new JSONObject();	// 배열 저장할 JSONObject 선언
		JSONArray  membersArray = new JSONArray();	// JSON객체 저장
		
		JSONObject memberInfo = new JSONObject();	// 회원 한명정보가 들어가는 JSON객체 선언
		memberInfo.put("name", "정원영");
		memberInfo.put("age", "26");
		memberInfo.put("gender", "남");
		memberInfo.put("nickname", "개발자");			// 회원정보를 name/value쌍으로 저장함
		membersArray.add(memberInfo);				// 회원정보를 다시 membersArray 배열에 저장
		
		memberInfo = new JSONObject();
		memberInfo.put("name", "BOB");
		memberInfo.put("age", "26");
		memberInfo.put("gender", "남");
		memberInfo.put("nickname", "BOBdev");
		membersArray.add(memberInfo);
		
		totalObject.put("members",membersArray);	 // 배열 담기
		String jsonInfo = totalObject.toJSONString();// 문자열 변환
		System.out.println(jsonInfo); 				 // 콘솔에 찍어보기
		
		out.print(jsonInfo);						 // JSON 데이터를 브라우저로 전송
	}
}
