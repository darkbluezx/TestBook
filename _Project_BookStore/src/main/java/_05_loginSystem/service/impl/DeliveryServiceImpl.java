package _05_loginSystem.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _05_loginSystem.dao.DeliveryDao;
import _05_loginSystem.model.Delivery;
import _05_loginSystem.model.DeliveryHistory;
import _05_loginSystem.model.Members;
import _05_loginSystem.service.DeliveryService;

@Service
public class DeliveryServiceImpl implements DeliveryService{

	@Autowired
	DeliveryDao dao;
	
	@Transactional
	@Override
	public int saveDelivery(Delivery d) {
		
		return dao.saveDelivery(d);
	}

	@Transactional
	@Override
	public int saveDeliveryHistory(DeliveryHistory dH) {
		
		return dao.saveDeliveryHistory(dH);
	}
	
	@Transactional
	@Override
	public Delivery findByPrimaryId(Integer id) {
		return dao.findByPrimaryId(id);
	}

	@Transactional
	@Override
	public List<Delivery> findAllDelivery() {
		return dao.findAllDelivery();
	}
	@Transactional
	@Override
	public List<Delivery> getMembersDelivery(Members m) {
		List<Delivery> list = null;

		list = dao.getMembersDelivery(m);

		return list;
		}
	@Transactional
	@Override
	public void updateDelivery(Delivery d) {
			dao.updateDelivery(d);
	}
	@Transactional
	@Override
	public Map<Integer, Delivery> getDelivery() {
		return dao.getDelivery();
	}

	@Transactional
	@Override
	public void deleteDelivery(Delivery d) {
		dao.deleteDelivery(d);
}
	@Transactional
	@Override
	public void deleteDelivery1(Integer id) {
		dao.deleteDelivery1(id);
	}
}
