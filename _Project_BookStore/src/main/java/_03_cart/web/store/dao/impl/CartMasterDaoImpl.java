package _03_cart.web.store.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _03_cart.web.store.dao.CartMasterDao;
import _03_cart.web.store.model.CartMasterBean;

@Repository
public class CartMasterDaoImpl implements CartMasterDao {
	@Autowired
	SessionFactory factory;

	@Override
	public void addCart(CartMasterBean cardMasterBean) {
		Session session = factory.getCurrentSession();
		session.save(cardMasterBean);
	}

	@SuppressWarnings("unused")
	@Override
	public void updateCart(CartMasterBean cardMasterBean) {
		String hql = "UPDATE CartMasterBean as c SET c.amount = :amount ," +
	                                            "c.discount = :discount ," +
	                                            "c.divident = :divident, " +
	                                            "c.address = :address ," +
	                                            "c.payKind = :payKind ," +
	                                            "c.creditCardNo = :creditCardNo ," +
	                                            "c.atmNo = :atmNo ," +
	                                            "c.creditCardMM = :creditCardMM ," +
	                                            "c.creditCardYY = :creditCardYY ," +
	                                            "c.creditCardCV = :creditCardCV, " +
	                                            "c.name = :name ," +
	                                            "c.holdername = :holdername ," +
	                                            "c.phone = :phone ," +
	                                            "c.email = :email ," +
	                                            "c.memberId = :memberId ," +
	                                            "c.invalidDate = :invalidDate, " +
	                                            "c.shoppingEventId = :shoppingEventId " +
	                                            "WHERE cartNo = :cartNo";
		Session session = factory.getCurrentSession();
		int n = session.createQuery(hql).setParameter("amount", cardMasterBean.getAmount())
				                        .setParameter("discount", cardMasterBean.getDiscount())
				                        .setParameter("divident", cardMasterBean.getDivident())
				                        .setParameter("address", cardMasterBean.getAddress())
				                        .setParameter("payKind", cardMasterBean.getPayKind())
				                        .setParameter("creditCardNo", cardMasterBean.getCreditCardNo())
				                        .setParameter("creditCardMM", cardMasterBean.getCreditCardMM())
				                        .setParameter("creditCardYY", cardMasterBean.getCreditCardYY())
				                        .setParameter("creditCardCV", cardMasterBean.getCreditCardCV())
				                        .setParameter("phone", cardMasterBean.getPhone())
				                        .setParameter("name", cardMasterBean.getName())
				                        .setParameter("holdername", cardMasterBean.getHoldername())
				                        .setParameter("email", cardMasterBean.getEmail())
				                        .setParameter("atmNo", cardMasterBean.getAtmNo())
				                        .setParameter("cartNo", cardMasterBean.getCartNo())
				                        .setParameter("memberId", cardMasterBean.getMemberId())
				                        .setParameter("invalidDate", cardMasterBean.getInvalidDate())
				                        .setParameter("shoppingEventId", cardMasterBean.getShoppingEventId())
				                        .executeUpdate();

	}

	@Override
	public CartMasterBean getCartById(String id) { //利用CartNo抓取資料
		Session session = factory.getCurrentSession();
		CartMasterBean cmb = session.get(CartMasterBean.class, id);
		return cmb;
	}

	@Override
	public void deleteCart(String id) {
		// TODO Auto-generated method stub

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CartMasterBean> getCartByMemberId(String id) {
		String hql = "FROM CartMasterBean cmb WHERE cmb.memberId = :memberId and cmb.invalidDate is null";
		Session session = factory.getCurrentSession();
		List<CartMasterBean> list = new ArrayList<>();
		list = session.createQuery(hql).setParameter("memberId", id).getResultList();
		return list;
	}

}
