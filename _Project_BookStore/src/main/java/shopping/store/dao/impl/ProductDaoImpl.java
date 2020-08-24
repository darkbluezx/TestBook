package shopping.store.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ecpay.logistics.integration.AllInOne;
import ecpay.logistics.integration.domain.CreateHomeObj;
import ecpay.logistics.integration.domain.QueryLogisticsTradeInfoObj;
import shopping.store.dao.ProductDao;
import shopping.store.model.CHBean;
import shopping.store.model.EnterCHBeanC;
import shopping.store.model.QLTIBean;
import shopping.store.model.StoreBean;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	SessionFactory factory;
		
	@SuppressWarnings("unchecked")
	@Override
	public List<StoreBean> getAllProducts() {
		String hql = "FROM StoreBean ORDER BY storeId";
		Session session = null;
		List<StoreBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllArea() {
		String hql = "SELECT DISTINCT b.area FROM StoreBean b ";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<StoreBean> getProductsByArea(String area) {
	    String hql = "FROM StoreBean sb WHERE sb.area = :area";
	    Session session = factory.getCurrentSession();
	    return session.createQuery(hql).setParameter("area", area).getResultList();
	}

	@Override
	public void addProduct(StoreBean prooduct) {
		Session session = factory.getCurrentSession();
		session.save(prooduct);
	}
	
	@Override
	public void deleteById(int id) {
		String hql = "DELETE StoreBean sb WHERE sb.storeId = :id ";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("id", id).executeUpdate();
	}

	@Override
	public void updateProduct(StoreBean prooduct) {
		Session session = factory.getCurrentSession();
		session.update(prooduct);
	}

	@Override
	public StoreBean getById(int storeId) {
		Session session = factory.getCurrentSession();
		StoreBean sb = session.get(StoreBean.class, storeId);
		return sb;		
	}
	
	@Override
	public void addQLTI(QLTIBean beans) {
		Session session = factory.getCurrentSession();
		session.save(beans);
	}
	
	@Override
	public void addCH(CHBean chb) {
		Session session = factory.getCurrentSession();
		session.save(chb);
	}

	@Override
	public StoreBean getStoreByName(String name) {
		StoreBean sb = null;
		String hql = "FROM StoreBean sb WHERE sb.name = :name ";
		Session session = factory.getCurrentSession();
		try {
			sb = (StoreBean)session.createQuery(hql).setParameter("name", name).getSingleResult();
		} catch(NoResultException e) {
			;
		} catch(Exception e) {
			;
		}
	    return sb;
	}
	
	@Override
	public StoreBean getStoreTextOnly(String name)  {
		return getStoreByName(name);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CHBean> getAllLogistics() {
		String hql = "FROM CHBean ORDER BY AllPayLogisticsID";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}
	
	@Override
	public QLTIBean getQLTIById(String id) {
	    String hql = "FROM QLTIBean WHERE AllPayLogisticsID = :id";
	    Session session = factory.getCurrentSession();
		return (QLTIBean) session.createQuery(hql).setParameter("id", id).getSingleResult();
	}
	
	@Override
	public CHBean getCHById(String id) {
	    String hql = "FROM CHBean WHERE AllPayLogisticsID = :id";
	    Session session = factory.getCurrentSession();
		return (CHBean) session.createQuery(hql).setParameter("id", id).getSingleResult();
	}
	
	@Override
	public String getLogisticsID(EnterCHBeanC bean) {
		AllInOne all = new AllInOne();
		CreateHomeObj obj = new CreateHomeObj();
		CHBean chb = new CHBean();
		obj.setMerchantTradeDate(bean.getMerchantTradeDate()); // 時間戳記，Y
		obj.setLogisticsSubType("TCAT"); // 物流類型:黑貓，N
		obj.setGoodsName(bean.getGoodsName()); //商品名稱
		obj.setGoodsAmount(bean.getGoodsAmount()); // 商品金額，Y
		obj.setSenderName("博克思"); // 寄件人姓名:Books，N
		obj.setSenderCellPhone("0911429215"); // 寄件人手機
		obj.setSenderZipCode("106"); // 寄件人郵遞區號:預設，N
		obj.setSenderAddress("台北市信義路3段153號10樓"); // 寄件人地址，N
		obj.setReceiverName(bean.getReceiverName()); // 收件人姓名，Y
		obj.setReceiverPhone(bean.getReceiverPhone()); // 收件人電話，Y
		obj.setReceiverCellPhone(bean.getReceiverCellPhone()); // 收件人手機，Y
		obj.setReceiverZipCode(bean.getReceiverZipCode()); // 收件人郵遞區號，Y
		obj.setReceiverAddress(bean.getReceiverAddress()); // 收件人地址，Y
		obj.setReceiverEmail(bean.getReceiverEmail()); //收件人email
		obj.setTemperature("0001"); // 溫層:預設0001(常溫)，N
		obj.setDistance("00"); // 距離:預設00(同縣市)，不符系統會自動更改，N
		obj.setSpecification("0001"); // 規格:0001(60cm)預設，N
		obj.setServerReplyURL("http://localhost:8080/SAL/"); // Sever端回覆網址，物流狀態都會透過此 URL通知
		obj.setScheduledPickupTime("4"); // 預定取件時段；4(不限時)預設，N
		System.out.println(all.create(obj));
		List<String> list = new ArrayList<>();
		List<String> list2 = new ArrayList<>();
		StringTokenizer st = new StringTokenizer(all.create(obj), "|=&");
		while (st.hasMoreElements()) {
			list.add(st.nextToken());
		}
		for (int i = 2; i < list.size(); i++) {
			if ((i == 8) ) {
				i+=2;
			}
			list2.add(list.get(i));
			i++;
		}
		chb.setAllPayLogisticsID(list2.get(0));
		chb.setBookingNote(list2.get(1));
		chb.setCheckMacValue(list2.get(2));
		chb.setGoodsAmount(list2.get(3));
		chb.setLogisticsSubType(list2.get(4));
		chb.setLogisticsType(list2.get(5));
		chb.setMerchantID(list2.get(6));
		chb.setMerchantTradeNo(list2.get(7));
		chb.setReceiverAddress(list2.get(8));
		chb.setReceiverCellPhone(list2.get(9));
		chb.setReceiverEmail(list2.get(10));
		chb.setReceiverName(list2.get(11));
		chb.setReceiverPhone(list2.get(12));
		chb.setRtnCode(list2.get(13));
		chb.setRtnMsg(list2.get(14));
		chb.setUpdateStatusDate(list2.get(15));
		Session session = factory.getCurrentSession();
		session.save(chb);
		return list2.get(0);
	}
	
	@Override
	public void addQLTIData(String eqlti) {
		AllInOne all = new AllInOne();
		QueryLogisticsTradeInfoObj obj = new QueryLogisticsTradeInfoObj();
		QLTIBean qltib = new QLTIBean();
		obj.setAllPayLogisticsID(eqlti);
		System.out.println(all.queryLogisticsTradeInfo(obj));
		List<String> list = new ArrayList<>();
		List<String> list2 = new ArrayList<>();
		StringTokenizer st = new StringTokenizer(all.queryLogisticsTradeInfo(obj), "|=&");
		while (st.hasMoreElements()) {
			list.add(st.nextToken());
		}
		for (int i = 1; i < list.size(); i++) {
			if (i == 19) {
				i++;
			}
			list2.add(list.get(i));
			i++;
		}
		qltib.setAllPayLogisticsID(list2.get(0));
		qltib.setBookingNote(list2.get(1));
		qltib.setGoodsAmount(list2.get(2));
		qltib.setGoodsName(list2.get(3));
		qltib.setHandlingCharge(list2.get(4));
		qltib.setLogisticsStatus(list2.get(5));
		qltib.setLogisticsType(list2.get(6));
		qltib.setMerchantID(list2.get(7));
		qltib.setMerchantTradeNo(list2.get(8));
		qltib.setTradeDate(list2.get(9));
		qltib.setCheckMacValue(list2.get(10));
		Session session = factory.getCurrentSession();
		session.save(qltib);
	}
	
	@Override
	public void updateLogistics(String id,String address,String date) {
		String hql = "UPDATE CHBean set ReceiverAddress = :address ,UpdateStatusDate = :date where AllPayLogisticsID = :id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("address", address)
								.setParameter("date", date)
								.setParameter("id", id)
								.executeUpdate();
	}
	
}
