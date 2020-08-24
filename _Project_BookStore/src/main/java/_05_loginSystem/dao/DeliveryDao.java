package _05_loginSystem.dao;


import java.util.List;
import java.util.Map;

import _05_loginSystem.model.Delivery;
import _05_loginSystem.model.DeliveryHistory;
import _05_loginSystem.model.Members;

public interface DeliveryDao {
	int saveDelivery(Delivery d);
	int saveDeliveryHistory(DeliveryHistory dH);
	Delivery findByPrimaryId(Integer id);
	List<Delivery> findAllDelivery();
	List<Delivery> getMembersDelivery(Members m);
	void updateDelivery(Delivery d); 
	void deleteDelivery(Delivery d); 
	void deleteDelivery1(Integer id); 
	Map<Integer, Delivery> getDelivery();
}
