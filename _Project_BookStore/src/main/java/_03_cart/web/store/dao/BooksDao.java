package _03_cart.web.store.dao;

import java.util.List;

import _03_cart.web.store.model.Books;

public interface BooksDao {
	int addBooks(Books book);
	Books getBooksById(Integer id);
	List<Books> getAllBooks();

}
