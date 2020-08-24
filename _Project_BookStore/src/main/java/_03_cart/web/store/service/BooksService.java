package _03_cart.web.store.service;

import java.util.List;

import _03_cart.web.store.model.Books;

public interface BooksService {
	int addBooks(Books book);
	Books getBooksById(Integer id);
	List<Books> getAllBooks();

}
