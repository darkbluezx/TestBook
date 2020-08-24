package shopping.store.dao;

import java.util.List;

import shopping.store.model.CHBean;
import shopping.store.model.EnterCHBeanC;
import shopping.store.model.QLTIBean;
import shopping.store.model.StoreBean;

public interface ProductDao {
	List<StoreBean> getAllProducts();
	List<String> getAllArea();
	List<StoreBean> getProductsByArea(String area);
	void addProduct(StoreBean prooduct);
	void deleteById(int id);
	void updateProduct(StoreBean prooduct);
	public StoreBean getById(int storeId);
	void addQLTI(QLTIBean beans);
	void addCH(CHBean chb);
	public StoreBean getStoreByName(String name);
	public StoreBean getStoreTextOnly(String name);
	List<CHBean> getAllLogistics();
	QLTIBean getQLTIById(String id);
	CHBean getCHById(String id);
	String getLogisticsID(EnterCHBeanC bean);
	void addQLTIData(String eqlti);
	void updateLogistics(String id, String address, String date);
}
