package _05_loginSystem.service.impl;

import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _05_loginSystem.dao.PaymentDao;
import _05_loginSystem.model.Members;
import _05_loginSystem.model.Payment;
import _05_loginSystem.model.PaymentHistory;
import _05_loginSystem.service.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService{
	@Autowired
	PaymentDao dao;
	SessionFactory factory;
	
	@Transactional
	@Override
	public List<String> getName() {
		List<String> list = null;

            list = dao.getName();

        return list;
	}
	@Transactional
	@Override
	public String getNameTag() {
		String tag = "";

            tag = dao.getNameTag();

        return tag;

	}
	@Transactional
	@Override
	public void setSelected(String name) {
		dao.setSelected(name);
	}
	
	@Transactional
	@Override
	public int savePayment(Payment p) {
		
		return dao.savePayment(p);
	}

	@Transactional
	@Override
	public int savePaymentHistory(PaymentHistory pH) {
		
		return dao.savePaymentHistory(pH);
	}
	
	@Transactional
	@Override
	public Payment findByPrimaryId(Integer id) {
		return dao.findByPrimaryId(id);
	}

	@Transactional
	@Override
	public List<Payment> findAllPayment() {
		return dao.findAllPayment();
	}
	@Transactional
	@Override
	public List<Payment> getMembersPayment(Members m) {
		List<Payment> list = null;

		list = dao.getMembersPayment(m);

		return list;
		}
	@Transactional
	@Override
	public void updatePayment(Payment p) {
			dao.updatePayment(p);
	}
	@Transactional
	@Override
	public Map<Integer, Payment> getPayment() {
		return dao.getPayment();
	}

	@Transactional
	@Override
	public void deletePayment(Payment p) {
		dao.deletePayment(p);
}
	@Transactional
	@Override
	public void deletePayment1(Integer id) {
		dao.deletePayment1(id);
	}
}
