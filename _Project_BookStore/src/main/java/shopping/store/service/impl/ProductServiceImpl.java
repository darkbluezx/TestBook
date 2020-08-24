package shopping.store.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shopping.store.dao.ProductDao;
import shopping.store.model.CHBean;
import shopping.store.model.EnterCHBeanC;
import shopping.store.model.QLTIBean;
import shopping.store.model.StoreBean;
import shopping.store.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDao dao;

	@Transactional
	@Override
	public List<StoreBean> getAllProducts() {
		return dao.getAllProducts();
	}
	
	@Transactional
	@Override
	public List<String> getAllArea() {
		return dao.getAllArea();
	}

	@Transactional
	@Override
	public List<StoreBean> getProductsByArea(String area) {
		return dao.getProductsByArea(area);
	}

	@Transactional
	@Override
	public void addProduct(StoreBean prooduct) {
		dao.addProduct(prooduct);
	}
	
	@Transactional
	@Override
	public void deleteById(int id){
		dao.deleteById(id);
	}

	@Transactional
	@Override
	public void updateProduct(StoreBean prooduct){
		dao.updateProduct(prooduct);
	}
	
	@Transactional
	@Override
	public StoreBean getById(int storeId) {
		return dao.getById(storeId);
	}
	
	@Transactional
	@Override
	public void addQLTI(QLTIBean beans) {
		dao.addQLTI(beans);
	}
	
	@Transactional
	@Override
	public void addCH(CHBean chb) {
		dao.addCH(chb);
	}
	
	@Transactional
	@Override
	public StoreBean getStoreByName(String name) {
		return dao.getStoreByName(name);
	}
	
	@Transactional
	@Override
	public StoreBean getStoreTextOnly(String name) {
		return dao.getStoreByName(name);
	}
	
	@Transactional
	@Override
	public List<CHBean> getAllLogistics() {
		return dao.getAllLogistics();
	}
	
	@Transactional
	@Override
	public QLTIBean getQLTIById(String id) {
		return dao.getQLTIById(id);
	}
	
	@Transactional
	@Override
	public CHBean getCHById(String id) {
		return dao.getCHById(id);
	}
	
	@Transactional
	@Override
	public String getLogisticsID(EnterCHBeanC bean) {
		return dao.getLogisticsID(bean);
	}
	
	@Transactional
	@Override
	public void addQLTIData(String eqlti) {
		dao.addQLTIData(eqlti);
	}
	
	@Transactional
	@Override
	public void updateLogistics(String id, String address, String date) {
		dao.updateLogistics(id, address, date);
	}
}
