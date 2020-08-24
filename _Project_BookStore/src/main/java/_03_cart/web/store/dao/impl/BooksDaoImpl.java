package _03_cart.web.store.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _03_cart.web.store.dao.BooksDao;
import _03_cart.web.store.model.Books;

@Repository
public class BooksDaoImpl implements BooksDao {
	@Autowired
	SessionFactory factory;

	public BooksDaoImpl() {
	}

	@Override
	public int addBooks(Books book) {
		int n = 0;
		factory.getCurrentSession().save(book);
		n++;
		return n;

	}

	@Override
	public Books getBooksById(Integer id) {
		Session session = null;
		try {
			session = factory.getCurrentSession();
		} catch (Exception e) {
			session = factory.openSession();
		}
		Books cmb = session.get(Books.class, id);
		return cmb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Books> getAllBooks() {
		String hql = "FROM Books";
		List<Books> list = new ArrayList<>();;
		Session session = null;
		try {
			session = factory.getCurrentSession();
		} catch (Exception e) {
			session = factory.openSession();
		}
		list = session.createQuery(hql).list();
		return list;
	}

}
