package _08_Promotion_com.web.store.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _08_Promotion_com.web.store.dao.ShoppingDiscountDao;
import _08_Promotion_com.web.store.model.DiscountBean;
import _08_Promotion_com.web.store.model.ShoppingDiscountBean;
import _09_Book.model.CompanyBean;

@Repository
public class ShoppingDiscountDaoImpl implements ShoppingDiscountDao{
	SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<ShoppingDiscountBean> getAllShoppingDiscounts() {
		String hql = "FROM ShoppingDiscountBean";
		Session session = factory.getCurrentSession();
		List<ShoppingDiscountBean>beans=session.createQuery(hql)
				.getResultList();
		return beans;
	}
	
	
   //============
	@Override
	public ShoppingDiscountBean getShoppingDiscountById(int shoppingDiscountId) {
		Session session = factory.getCurrentSession();
		ShoppingDiscountBean sdb=session.get(ShoppingDiscountBean.class, shoppingDiscountId);
		return sdb;
	}	
	
  //==========
	@Override
	public void addShoppingDiscount(ShoppingDiscountBean shoppingDiscount){
		 Session session = factory.getCurrentSession();
		 session.save(shoppingDiscount);
	}
	
	//=====update===
	@Override
	public void updateShoppingDiscount(ShoppingDiscountBean bean) {
		if (bean != null && bean.getShoppingEventId() != null) {
		Session session = factory.getCurrentSession();
		session.update(bean);
		}
	}
	
	
	
	
}
