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
			pagingStr +=" &nbsp;";
		}
		
		
		return pagingStr;
	}
}
