package _05_loginSystem.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _05_loginSystem.dao.MonthDao;
import _05_loginSystem.model.Month;


@Repository
public class MonthDaoImpl implements MonthDao{
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Month> getAllMonth() {
		String hql = "FROM Month";
		Session session = getSession();
		return session.createQuery(hql).getResultList();
	}

	public Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public Month getMonth(Integer id) {
		Session session = getSession();
		return session.get(Month.class, id);
	}
}
