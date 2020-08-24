package _01_order.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_order.dao.OrderItemDao;
import _01_order.model.OrderItemBean;


@Repository
public class OrderItemDaoImpl implements OrderItemDao{
	@Autowired
	SessionFactory factory;

	public OrderItemDaoImpl() {
	}

	//不完全，請勿使用
//	@Override
//	public double calculateSingleItemAmount(OrderItemBean oib, BookBean bkb) {
//		double singletotal = oib.getProductQuantity() * bkb.getPrice() ;
//		return singletotal;
//	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderItemBean> getOrdersDetail(String orderNo) {
		List<OrderItemBean> list = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderItemBean oib WHERE oib.orderBean.orderNo = :oibono";
		list = session.createQuery(hql).setParameter("oibono", orderNo).getResultList();
		return list;
	}
	
//	@Override
//	public OrderBean getOrdersList(String orderNo) {
//		Session session = factory.getCurrentSession();
//		OrderBean ob = session.get(OrderBean.class, orderNo);
//		return ob;
//	}
	
	
	
}
