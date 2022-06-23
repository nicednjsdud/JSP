package kr.co.ezenac.model2.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	
	// 파일 업로드(multipart/form-data 요청) 처리
	public static MultipartRequest uploadFile(HttpServletRequest request,
						String saveDirectory,int maxPostSize) {
		
		try {
			return new MultipartRequest(request, saveDirectory, maxPostSize,"UTF-8" );
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	// 파일을 다운로드 
	public static void download(HttpServletRequest request,HttpServletResponse response,
				String directory, String sfileName, String ofileName) {
		
		try {
		// 업로드 폴더의 물리적 경로 얻어오기
		String sDirectory = request.getServletContext().getRealPath(directory);
		
		//파일을 찾아 입력스트림 생성
		File file = new File(sDirectory, sfileName);
		InputStream inStream = new FileInputStream(file);
		
		// 한글파일명 깨짐 방지
		String client =  request.getHeader("User-Agent");
		
		// 인터넷 익스플로러가 아닌 경우
		if(client.indexOf("WOW64") == -1){
			
			// 원본 파일명을 getBytes("utf-8")로 바이트 배열로 변환후, iso-8859-1 캐릭터 셋 문자열로 재생성함
			ofileName = new String(ofileName.getBytes("utf-8"),"iso-8859-1");
		}
		else{
			ofileName = new String(ofileName.getBytes("KSC5601"),"iso-8859-1");
		}
		
		// 파일을 다운로드하기 위한 응답 헤더 설정
		response.reset();		// 응답 헤더 초기화
		
		// 파일 다운로드 창을 띄우기 위한 컨텐츠 타입 지정 (oct-stream : 8 비트 단위의 바이너리 데이터를 의미함)
		response.setContentType("application/octet-stream");
		
		// 웹 브라우저에서 파일 다운로드 창이 뜰때 원본 파일명이 기본으로 입력되어 있도록 설정
		response.setHeader("Content-Disposition", "attachment; filename= \""+ofileName+"\"");
		response.setHeader("Content-Length", ""+file.length());
		
		// 출력스트림 초기화
//		out.clear();
//		out = pageContext.pushBody();	
		// response로부터 새로운 출력 스트림 생성
		OutputStream outputStream = response.getOutputStream();
		
		// 출력 스트림에 파일 크기 배열 이용해서 파일 내용 출력
		byte[] b = new byte[(int)file.length()];
		int readBuffer = 0;
		
		while((readBuffer = inStream.read(b))>0){
			outputStream.write(b,0,readBuffer);
		}
		
		inStream.close();
		outputStream.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 지정한 위치의 파일 삭제
	public static void deleteFile(HttpServletRequest request,String directory, String fileName) {
		// 파일이 저장된 디렉토리의 물리적 경로 얻어오기 
		String sDirectory = request.getServletContext().getRealPath(directory);
		// 경로와 파일명 결합하여 파일 객체 생성
		File file = new File(sDirectory+File.separator+fileName);
		
		// 경로의 파일이 존재하면 삭제
		if(file.exists()) {
			file.delete();
		}
	}
}
























