package kr.co.ezenac.model2.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ezenac.model2.util.BoardPage;

@Controller("/board/list.do")
public class ListController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// DAO 생성
		BoardDAO dao = new BoardDAO();
		
		// 모델로 전달할 검색 매개변수 및 뷰로 전달할 페이징 관련 값을 저장하기 위해 Map 컬렉션 생성
		Map<String, Object> map = new HashMap<>();
		String searchField = request.getParameter("searchField");	// 검색어 폼값 받기
		String searchWord = request.getParameter("searchWord");

		if(searchWord !=null){		// 검색어가 있을때 Map에 저장
			map.put("searchField",searchField);
			map.put("searchWord",searchWord);
		}

		int totalCount = dao.selectCount(map);	//게시물 수 확인
		
		// 페이지 설정값 상수를 가져와서 페이지당 게시물수(pageSize)와 블록당 페이지수(blockPage)를 구함 
		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGE_PER_BLOCK"));
		
		// 현재 페이지 확인
		int pageNum = 1;			// default 값
		// 리턴타입이 문자열이므로 pageTemp에 임시저장
		String pageTemp = request.getParameter("pageNum");	
		if(pageTemp !=null && pageTemp.equals(""))
			pageNum =Integer.parseInt(pageTemp);	// 요청받은 페이지(정수)로 수정
		
		// 목록에 출력할 게시물 범위 계산
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		
		map.put("start", start);
		map.put("end", end);
		
		// 게시물 목록 받기
		List<BoardDTO> boardLists = dao.selectListPage(map);
		dao.close(); //DC 연결 닫기
		
		// 뷰에 전달할 매개변수 추가
		
		String paingImag = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum,"../board/list.do");
		
		map.put("paingImag", paingImag);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		// 전달할 데이터를 request 영역에 저장한 후 list.jsp로 포워드
		request.setAttribute("boardLists", boardLists);
		request.setAttribute("map", map);
		request.getRequestDispatcher("/board/list.jsp").forward(request, response);
	}
}













