 package _01_order.dao;

import java.util.List;

import _01_order.model.OrderBean;

public interface OrderDao {
	
	//儲存訂單資料(不含運送資料且物流編號為null)至資料庫
	void insertOrder(OrderBean ob);
	
	//儲存訂單資料的物流編號
	void updateOrderShippingNo(String orderNo, String shippingNo);
	
	//取得單一帳戶單一交易訂單紀錄(不含運送資料)
	OrderBean getOrder(String orderNo);
	
	//取得單一帳戶所有未結且未取消之交易訂單紀錄(不含運送資料)
	List<OrderBean> getMemberNoPayOrders(String memberNo);
	
	//棄用，註解
	//取得單一帳戶所有已結且未取消之交易訂單紀錄(不含運送資料)
//	List<OrderBean> getMemberCompletedOrders(String memberNo);

	//取得單一帳戶所有已取消交易訂單紀錄(不含運送資料)
	List<OrderBean> getMemberCancelledOrders(String memberNo);
	
	//取得單一帳戶所有交易訂單紀錄(不含運送資料、已取消訂單)
	List<OrderBean> getMemberAllOrders(String memberNo);
}
