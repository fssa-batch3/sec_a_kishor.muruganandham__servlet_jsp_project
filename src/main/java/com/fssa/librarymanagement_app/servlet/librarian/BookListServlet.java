package com.fssa.librarymanagement_app.servlet.librarian;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.librarymanagement.exceptions.ServiceException;
import com.fssa.librarymanagement.model.Book;
import com.fssa.librarymanagement.service.BookService;

@WebServlet("/librarian/book-list")
public class BookListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookService bookService = new BookService();
		List<Book> bookList;
		List<String> genreList;
		try {
			bookList = bookService.listAllBooks();
			genreList = bookService.listAllGenres();

			request.setAttribute("bookList", bookList);
			request.setAttribute("genreList", genreList);
			request.getRequestDispatcher("/pages/librarian/list-book.jsp").forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}
}
