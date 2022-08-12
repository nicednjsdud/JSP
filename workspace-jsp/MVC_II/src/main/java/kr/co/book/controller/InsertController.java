package kr.co.book.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.book.dao.BookDAO;
import kr.co.book.dto.BookDTO;
import kr.co.book.util.JsFunction;

@WebServlet("/book/insert.do")
public class InsertController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookDTO dto = new BookDTO();
		dto.setBookID(Integer.parseInt(request.getParameter("bookID")));
		dto.setBookName(request.getParameter("bookName"));
		dto.setAuthor(request.getParameter("author"));
		dto.setPublisher(request.getParameter("publisher"));
		dto.setPrice(request.getParameter("price"));
		dto.setPublicationDate(request.getParameter("publicationDate"));

		BookDAO dao = new BookDAO();
		int result = dao.insertWrite(dto);

		dao.close();

		if (result == 1) {
			JsFunction.alertLocation(response,"도서 입력을 성공하였습니다.","../book/bookList.do");
			
		}
		else {
			JsFunction.alertBack(response, "도서 입력을 실패하였습니다.");
			response.sendRedirect("../book/BookInsert.jsp");
	
		}
	}
}
