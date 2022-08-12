package kr.co.book.util;


public class BookPage {
	
	public static String pagingStr(int totalCount,int pageSize, int blockPage,
												int pageNum,String reqUrl) {
		String pagingStr = "";
		
		int totalPages = (int)(Math.ceil(((double)totalCount/pageSize)));
		int pageTemp = (((pageNum-1)/blockPage) * blockPage) + 1;
		
		// 이전 페이지 블록 바로가기
		if(pageTemp != 1) {
			pagingStr += "<a href='"+reqUrl+"?pageNum=1'>[첫 페이지]  </a>";
			pagingStr +="&nbsp;";
			pagingStr += "<a href='\"+reqUrl+\"?pageNum=" +(pageTemp-1) + " '>[이전 블록]</a>";
		}
		
		// 각 페이지 번호 출력
		int blockCount = 1;
		
		// 5개가 출력 - 예를 들어 pageTemp가 1일때 "1 2 3 4 5" 출력 
		//					  pageTemp가 6일때 "6 7 8 9 10" 출력
		while(blockCount <= blockPage && pageTemp <= totalPages ) {
			if(pageTemp == pageNum) {
				// 현재 페이지는 링크 걸지 않음
				pagingStr += "&nbsp;" +pageTemp+ "&nbsp;";
			}
			else {
				// 페이지 바로가기 출력
				pagingStr +="&nbsp;<a href=' "+reqUrl+"?pageNum="+pageTemp+"'>" +pageTemp+ "</a>&nbsp;";	
					
			}
			pageTemp++;	// 1씩 증가시킴
			blockCount++;
		}
		// '다음 페이지 블록 바로가기'
		if(pageTemp <= totalPages) {	// pageTemp가 전체 페이지수 이하일 떄
			pagingStr += "<a href=' "+reqUrl+"?pageNum="+pageTemp+" '>[다음 블록]</a>";
			pagingStr +="&nbsp;";
			pagingStr += "<a href=' "+reqUrl+"?pageNum="+totalPages+" '>[마지막 페이지]</a>";
		}
		
		return pagingStr;
	}
}
