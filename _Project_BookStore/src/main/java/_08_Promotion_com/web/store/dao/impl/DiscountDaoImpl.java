package _08_Promotion_com.web.store.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import _08_Promotion_com.web.store.dao.DiscountDao;
import _08_Promotion_com.web.store.model.DiscountBean;
import _08_Promotion_com.web.store.model.FreeBiesBean;
import _09_Book.model.BookBean;
import _09_Book.model.CompanyBean;


@Repository
public class DiscountDaoImpl implements DiscountDao{
	
	SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<DiscountBean> getAllDiscounts() {
		String hql = "FROM DiscountBean";
		Session session = factory.getCurrentSession();
		List<DiscountBean>beans=session.createQuery(hql)
				.getResultList();
		return beans;
	}
	
	//=============
		@Override
		public DiscountBean getDiscountById(int discountId) {
			Session session = factory.getCurrentSession();
			DiscountBean db=session.get(DiscountBean.class, discountId);
			return db;
		}	
		//======

		@Override
		public void addDiscount(DiscountBean discount){
			 Session session = factory.getCurrentSession();
			 CompanyBean cb = getCompanyById(discount.getCompanyId());
			 discount.setCompanyBean(cb);
			 session.save(discount);
		}
		
		//=====update===
		@Override
		public void updateDiscount(DiscountBean bean,int companyId) {
			CompanyBean cb = getCompanyById(companyId);
			bean.setCompanyBean(cb);
			
			if (bean != null && bean.getDiscountEventId() != null) {
			Session session = factory.getCurrentSession();
			session.update(bean);
			}
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
		
		
	
}