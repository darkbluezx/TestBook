package _05_loginSystem.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _05_loginSystem.dao.PaymentDao;
import _05_loginSystem.model.Payment;
import _05_loginSystem.model.PaymentHistory;
import _05_loginSystem.model.Members;
@Repository
public class PaymentDaoImpl implements PaymentDao{
	@Autowired
	SessionFactory factory;
	String selected = "";

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getName() {
		String hql = "SELECT DISTINCT name FROM Month";
        Session session = factory.getCurrentSession();
        List<String> list = null;
        list = session.createQuery(hql).list();
        return list;
    }
	
	@Override
	public String getNameTag() {
		String ans = "";
		List<String> list = getName();
		ans += "<SELECT name='name'>";
		for (String cate : list) {
			if (cate.equals(selected)) {
				ans += "<option value='" + cate + "' selected>" + cate + "</option>";
			} else {
				ans += "<option value='" + cate + "'>" + cate + "</option>";
			}
		}
		ans += "</SELECT>";
		return ans;
	}
	
	@Override
	public void setSelected(String selected) {
		this.selected = selected;
	}
	
	@Override
	public int savePayment(Payment p) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(p);
		n++;
		return n;
	}

	@Override
	public int savePaymentHistory(PaymentHistory pH) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(pH);
		n++;
		return n;
	}

	@Override
	public Payment findByPrimaryId(Integer id) {
		Payment p = null;
		Session session = factory.getCurrentSession();
		String hql  = "FROM Payment p WHERE p.id = :id";
		try {
			p = (Payment)session.createQuery(hql)
									.setParameter("id", id)
									.getSingleResult();
		} catch(NoResultException e) {
			;  // 表示查無紀錄
		}
		
		return p;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Payment> findAllPayment() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Payment";
		List<Payment> list = session.createQuery(hql).getResultList();
		return list;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Payment> getMembersPayment(Members m) {
	
		List<Payment> list = null;
	    Session session = factory.getCurrentSession();
	    String hql = "FROM Payment p WHERE p.members = :m";
	        list = session.createQuery(hql)
	        			  .setParameter("m", m)
	        			  .getResultList();
	        return list;
		
		}
	
	@Override
	public void updatePayment(Payment p) {
		Session session = factory.getCurrentSession();
		session.update(p);	
	}
	
	@Override
	public void deletePayment1(Integer id) {
		String hql = "DELETE Payment Where id = :id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("id", id).executeUpdate();
	}
	
	@Override
	public void deletePayment(Payment p) {
		Session session = factory.getCurrentSession();

		session.delete(p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, Payment> getPayment() {
		String hql = "FROM Payment";
		Map<Integer, Payment> map = new HashMap<>();
		Session session = factory.getCurrentSession();
		List<Payment> list = session.createQuery(hql).getResultList();
		for (Payment payment : list) {
			map.put(payment.getId(), payment);
		}
		return map;
	}

}
