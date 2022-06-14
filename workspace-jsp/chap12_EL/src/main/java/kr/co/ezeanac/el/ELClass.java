package kr.co.ezeanac.el;

public class ELClass {

	//주민번호를 입력받아 성별을 반환함
	public String getGender(String jumin) {
		String returnStr = "";
		
		int beginIdx = jumin.indexOf("-") + 1;
		String genderStr = jumin.substring(beginIdx, beginIdx+1);
		
		int genderInt = Integer.parseInt(genderStr);
		if (genderInt == 1 | genderInt == 3)
			returnStr = "남자";
		else if (genderInt == 2 | genderInt == 4)
			returnStr = "여자";
		else
			returnStr = "입력오류 입니다.";
			
		return returnStr;
	}
	
	//입력받은 정수까지의 구구단을 HTML 테이블로 출력
	public static String showGugudan(int dan) {
		StringBuffer sb = new StringBuffer();
		
		sb.append("<table border='1'>");
		
		for(int i=2; i<=dan; i++) {
			sb.append("<tr>");
			for(int j=1; j<=9; j++) {
				sb.append("<td>" +i +"*"+ j +"="+ (i*j)  + "</td>");
			}
			sb.append("</tr>");
		}
		
		sb.append("</table>");
		
		return sb.toString();
	}
}










