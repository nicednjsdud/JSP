package kr.co.ezenac.model2.util;

/*
 *  총 게시물 개수, 한페이지에 출력할 게시물 수(10), 한블록에 출력할 페이지 번호의 개수(5),
 *  현재 페이지 번호, /board/List.do 
 */
public class BoardPage {
	
	public static String pagingStr(int totalCount,int pageSize, int blockPage,
												int pageNum,String reqUrl) {
		String pagingStr = "";
		
		// 전체 페이지 수 계산
		int totalPages = (int)(Math.ceil(((double)totalCount/pageSize)));
		
		// 이전 페이지 블록 바로가기
		int pageTemp = (((pageNum-1)/blockPage) * blockPage) + 1;
		
		// 이전 페이지 블록 바로가기 출력
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
				pagingStr +="&nbsp;<a href=' "+reqUrl+"+?pageNum='>" +pageTemp+ "</a>&nbsp;";	
					
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
