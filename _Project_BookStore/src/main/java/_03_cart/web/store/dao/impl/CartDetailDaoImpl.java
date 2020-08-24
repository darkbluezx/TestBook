package _03_cart.web.store.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _03_cart.web.store.dao.CartDetailDao;
import _03_cart.web.store.model.CartDetailBean;

@Repository
public class CartDetailDaoImpl implements CartDetailDao {
	@Autowired
	SessionFactory factory;

	@Override
	public void addCartDetail(CartDetailBean cartDetailBean) {
		Session session = factory.getCurrentSession();
		session.save(cartDetailBean);
	}

	@SuppressWarnings("unused")
	@Override
	public void updateCartDetail(String id, Integer productId, Integer qty, Double discount, Integer discountEventId,Integer freeBieEventId, String freeBies) {
		String hql = "UPDATE CartDetailBean as c SET c.qty = :qty ," 
	                  + "c.discount = :discount ," 
				      + "c.discountEventId = :discountEventId, "
				      + "c.freeBieEventId = :freeBieEventId, "
				      + "c.freeBies = :freeBies "
				      + "WHERE cartNo = :cartNo and productId = :productId";
		Session session = factory.getCurrentSession();
		int n = session.createQuery(hql).setParameter("cartNo", id)
				.setParameter("qty", qty)
				.setParameter("discount", discount)
				.setParameter("productId", productId)
				.setParameter("discountEventId", discountEventId)
				.setParameter("freeBieEventId", freeBieEventId)
				.setParameter("freeBies", freeBies)
				.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CartDetailBean> getCartDetailByMaster(String id) {
		String hql = "FROM CartDetailBean cmb WHERE cmb.cartNo = :cartNo";
		Session session = factory.getCurrentSession();
		List<CartDetailBean> list = new ArrayList<>();
		list = session.createQuery(hql).setParameter("cartNo", id).getResultList();
		return list;
	}

	@SuppressWarnings("unused")
	@Override
	public void deleteCartDetail(String id, Integer productId) {
		String hql = "DELETE CartDetailBean cmb WHERE cmb.cartNo = :cartNo AND cmb.productId = :productId";
		Session session = factory.getCurrentSession();
		int n = session.createQuery(hql).setParameter("cartNo", id)
				.setParameter("productId", productId)
				.executeUpdate();

	}

	@Override
	public CartDetailBean getCartDetailByCartNo(String cartno, Integer bookId) {
		String hql = "FROM CartDetailBean cmb WHERE cmb.cartNo = :cartNo and cmb.productId = :bookId";
		Session session = factory.getCurrentSession();
		CartDetailBean cdb = new CartDetailBean();
		try {
			cdb = (CartDetailBean)session.createQuery(hql).setParameter("cartNo", cartno).setParameter("bookId", bookId).getSingleResult();
		} catch(NoResultException e) {
			cdb = null;
		}
		return cdb;
	}

}
