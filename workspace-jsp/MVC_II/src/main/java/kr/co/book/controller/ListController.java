package kr.co.book.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.book.dao.BookDAO;
import kr.co.book.dto.BookDTO;
import kr.co.book.util.BookPage;



@WebServlet("/book/bookList.do")
public class ListController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BookDAO bookDAO = new BookDAO();
		
		Map<String, Object> map = new HashMap<>();
		String searchField = request.getParameter("searchField");	
		String searchWord = request.getParameter("searchWord");

		if(searchWord !=null){
			map.put("searchField",searchField);
			map.put("searchWord",searchWord);
		}
		int totalCount = bookDAO.selectCount(map);	
		
		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGE_PER_BLOCK"));
		
		int pageNum = 1;
		String pageTemp = request.getParameter("pageNum");	
		if(pageTemp !=null && !pageTemp.equals(""))
			pageNum =Integer.parseInt(pageTemp);	
		
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		
		map.put("start", start);
		map.put("end", end);
		
		List<BookDTO> bookLists = bookDAO.selectListPage(map);
		bookDAO.close(); 
	
		String pagingImag = BookPage.pagingStr(totalCount, pageSize, blockPage, pageNum,"../book/bookList.do");
		
		map.put("pagingImag", pagingImag);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
	
		request.setAttribute("bookLists", bookLists);
		request.setAttribute("map", map);
		request.getRequestDispatcher("/book/BookList.jsp").forward(request, response);
	}
}
