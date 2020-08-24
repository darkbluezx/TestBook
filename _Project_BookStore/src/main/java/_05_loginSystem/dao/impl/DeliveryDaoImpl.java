package _05_loginSystem.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _05_loginSystem.dao.DeliveryDao;
import _05_loginSystem.model.Delivery;
import _05_loginSystem.model.DeliveryHistory;
import _05_loginSystem.model.Members;
@Repository
public class DeliveryDaoImpl implements DeliveryDao{
	@Autowired
	SessionFactory factory;

	@Override
	public int saveDelivery(Delivery d) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(d);
		n++;
		return n;
	}

	@Override
	public int saveDeliveryHistory(DeliveryHistory dH) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(dH);
		n++;
		return n;
	}

	@Override
	public Delivery findByPrimaryId(Integer id) {
		Delivery d = null;
		Session session = factory.getCurrentSession();
		String hql  = "FROM Delivery d WHERE d.id = :id";
		try {
			d = (Delivery)session.createQuery(hql)
									.setParameter("id", id)
									.getSingleResult();
		} catch(NoResultException e) {
			;  // 表示查無紀錄
		}
		
		return d;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Delivery> findAllDelivery() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Delivery";
		List<Delivery> list = session.createQuery(hql).getResultList();
		return list;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Delivery> getMembersDelivery(Members m) {
	
		List<Delivery> list = null;
	    Session session = factory.getCurrentSession();
	    String hql = "FROM Delivery d WHERE d.members = :m";
	        list = session.createQuery(hql)
	        			  .setParameter("m", m)
	        			  .getResultList();
	        return list;
		
		}
//
//	@Override
//	public void updateDelivery(Delivery d) {
//		String hql2 = "UPDATE Delivery d WHERE d.id = :id";
//		Session session = factory.getCurrentSession();
//		session.createQuery(hql2).setParameter("id", d.getId())
//								 .executeUpdate();
//	}
	
	@Override
	public void updateDelivery(Delivery d) {
		Session session = factory.getCurrentSession();
		session.update(d);	
	}
	
	@Override
	public void deleteDelivery1(Integer id) {
		String hql = "DELETE Delivery Where id = :id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("id", id).executeUpdate();
	}
	
	@Override
	public void deleteDelivery(Delivery d) {
		Session session = factory.getCurrentSession();

		session.delete(d);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, Delivery> getDelivery() {
		String hql = "FROM Delivery";
		Map<Integer, Delivery> map = new HashMap<>();
		Session session = factory.getCurrentSession();
		List<Delivery> list = session.createQuery(hql).getResultList();
		for (Delivery delivery : list) {
			map.put(delivery.getId(), delivery);
		}
		return map;
	}
	

}
