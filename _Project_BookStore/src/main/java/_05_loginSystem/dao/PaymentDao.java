package _05_loginSystem.dao;

import java.util.List;
import java.util.Map;

import _05_loginSystem.model.Members;
import _05_loginSystem.model.Payment;
import _05_loginSystem.model.PaymentHistory;

public interface PaymentDao {
	public List<String> getName();
	public String getNameTag();
	void setSelected(String selected);
	int savePayment(Payment p);
	int savePaymentHistory(PaymentHistory pH);
	Payment findByPrimaryId(Integer id);
	List<Payment> findAllPayment();
	List<Payment> getMembersPayment(Members m);
	void updatePayment(Payment p); 
	void deletePayment(Payment p); 
	void deletePayment1(Integer id); 
	Map<Integer, Payment> getPayment();
}
