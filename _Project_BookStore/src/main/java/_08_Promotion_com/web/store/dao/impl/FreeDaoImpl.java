package _08_Promotion_com.web.store.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _08_Promotion_com.web.store.dao.FreeDao;
import _08_Promotion_com.web.store.model.FreeBiesBean;
import _09_Book.model.CompanyBean;
@Repository
public class FreeDaoImpl implements FreeDao {
	SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<FreeBiesBean> getAllFrees() {
		String hql = "FROM FreeBiesBean";
		Session session = factory.getCurrentSession();
		List<FreeBiesBean>beans=session.createQuery(hql)
				.getResultList();
		return beans;
	}
	
	//=============
	@Override
	public FreeBiesBean getFreeById(int freeId) {
		Session session = factory.getCurrentSession();
		FreeBiesBean fbb=session.get(FreeBiesBean.class, freeId);
		return fbb;
	}	
	//======

	@Override
	public void addFree(FreeBiesBean free){
		 Session session = factory.getCurrentSession();
		 CompanyBean cb = getCompanyById(free.getCompanyId());
		 free.setCompanyBean(cb);
		 session.save(free);
	}
	
	
	@Override
	public CompanyBean getCompanyById(int companyId) {
		 CompanyBean cb = null;
		 Session session = factory.getCurrentSession();
		 cb = session.get(CompanyBean.class, companyId);
		 return cb;
	}
		
	
	@Override
	public List<CompanyBean> getCompanyList() {
		  String hql = "FROM CompanyBean";
		  Session session = factory.getCurrentSession();
		  List<CompanyBean> list = session.createQuery(hql).getResultList();
		  return list;
		}

	//=====update===
	@Override
	public void updateFreeBies(FreeBiesBean bean) {
		if (bean != null && bean.getFreeBieEventId() != null) {
		Session session = factory.getCurrentSession();
		session.update(bean);
		}
	}
		
		
	}
	

