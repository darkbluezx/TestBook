package _01_order.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_order.dao.OrderDao;
import _01_order.model.OrderBean;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SessionFactory factory;

	public OrderDaoImpl() {
	}

	@Override
	public void insertOrder(OrderBean ob) {
		Session session = factory.getCurrentSession();
		session.save(ob);

	}
	
	@Override
	public void updateOrderShippingNo(String orderNo, String shippingNo) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE OrderBean ob set ob.shippingNo = :spn "
				+ "SELECT shippingNo FROM OrderBean ob "
				+ "WHERE ob.orderNo = :odn"; 
		session.createQuery(hql).setParameter("odn", orderNo)
											.setParameter("spn", shippingNo)
											.executeUpdate();
	}

	@Override
	public OrderBean getOrder(String orderNo) {
		OrderBean ob = null;
		Session session = factory.getCurrentSession();
		ob = session.get(OrderBean.class, orderNo);
		return ob;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getMemberNoPayOrders(String memberNo) {
		List<OrderBean> list = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderBean ob WHERE ob.memberNo = :mid and ob.orderCancel = 1 "
				+ "and ob.paymentStatus = '02'";     // 1 for 存活, 02 for 未付款
		list = session.createQuery(hql).setParameter("mid", memberNo).getResultList();
		return list;
	}

	//棄用，註解
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<OrderBean> getMemberCompletedOrders(String memberNo) {
//		List<OrderBean> list = null;
//		Session session = factory.getCurrentSession();
//		String hql = "FROM OrderBean ob WHERE ob.memberNo = :mid and ob.orderCancel = 1 "
//				+ "and ob.paymentStatus = '01'";     // 1 for 存活, 01 for 已付款
//		list = session.createQuery(hql).setParameter("mid", memberNo).getResultList();
//		return list;
//	}


	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getMemberCancelledOrders(String memberNo) {  //取得已取消訂單
		List<OrderBean> list = null;
		Session session = factory.getCurrentSession();   // 2 for 已取消
		String hql = "FROM OrderBean ob WHERE ob.memberNo = :mid and ob.orderCancel = 2";
		list = session.createQuery(hql).setParameter("mid", memberNo).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderBean> getMemberAllOrders(String memberNo) {  //取得所有訂單(不含已取消)
		List<OrderBean> list = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderBean AS ob WHERE ob.memberNo = :mid and ob.orderCancel = 1 ";  // 1 for 存活訂單
		list = session.createQuery(hql).setParameter("mid", memberNo).getResultList();
		return list;
	}

}
