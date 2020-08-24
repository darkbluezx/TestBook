package _01_order.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_order.dao.ShippingDataDao;
import _01_order.model.ShippingDataBean;
@Repository
public class ShippingDataDaoImpl implements ShippingDataDao{

	@Autowired
	SessionFactory factory;
	
	public ShippingDataDaoImpl() {
	}

	@Override
	public void insertShippingData(ShippingDataBean sd) {
		Session session = factory.getCurrentSession();
		session.save(sd);
	}

	@Override
	public void modifyShippingData(ShippingDataBean sd) {
		Session session = factory.getCurrentSession();
		session.save(sd);
	}
	
	@Override
	public void updateShippingStatus(String orderNo, String shippingStatus, Integer orderNo_sort) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE ShippingDataBean sd SET sd.shippingStatus = :sps "
				+ "WHERE  sd.orderBean.orderNo = :ono AND sd.orderNo_sort = :ons";
		session.createQuery(hql).setParameter("sps", shippingStatus)
											   .setParameter("ono", orderNo)
											   .setParameter("ons", orderNo_sort)
											   .executeUpdate();
//		String mysql_sql = "UPDATE ShippingDataBean SET shippingStatus = :sps"
//				+ "ROW_NUMBER() OVER (PARTITION BY orderNo  ORDER BY changeTime DESC) AS orderNo_Sort "
//				+ "WHERE orderNo_Sort = 1 AND orderNo = :odn";
//		session.createNativeQuery(mysql_sql).setParameter("sps", shippingStatus)
//																   .setParameter("odn", orderNo)
//																   .executeUpdate();
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public ShippingDataBean getShippingData(String orderNo) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ShippingDataBean sd WHERE sd.orderBean.orderNo = :ono ORDER BY sd.changeTime DESC";
		List<ShippingDataBean> listOrigin = session.createQuery(hql).setParameter("ono", orderNo).getResultList();
//		listOrigin =  session.createQuery(hql).setParameter("ono", orderNo).getSingleResult();
		ShippingDataBean list = new ShippingDataBean(
				listOrigin.get(0).getOrderBean(), 
				listOrigin.get(0).getChangeTime(), 
				listOrigin.get(0).getAddress(), 
				listOrigin.get(0).getShippingMethod(),
				listOrigin.get(0).getShippingStatus(),
				listOrigin.get(0).getOrderNo_sort());
		return list;
	}

}
