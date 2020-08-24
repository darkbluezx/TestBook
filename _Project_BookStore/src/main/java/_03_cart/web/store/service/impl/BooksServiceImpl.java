package _03_cart.web.store.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _03_cart.web.store.dao.BooksDao;
import _03_cart.web.store.model.Books;
import _03_cart.web.store.service.BooksService;

@Service
public class BooksServiceImpl implements BooksService {
	@Autowired
	BooksDao dao;

	@Transactional
	@Override
	public int addBooks(Books book) {
        dao.addBooks(book);
        return 0;
	}

	@Transactional
	@Override
	public Books getBooksById(Integer id) {
		return dao.getBooksById(id);
	}

	@Transactional
	@Override
	public List<Books> getAllBooks() {
        return dao.getAllBooks();
	}

}
