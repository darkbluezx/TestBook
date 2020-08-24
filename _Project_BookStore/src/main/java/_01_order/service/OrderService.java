package _01_order.service;

import java.util.List;

import _01_order.model.OrderBean;
import _01_order.model.OrderItemBean;
import _01_order.model.ShippingDataBean;

public interface OrderService {

	// 儲存訂單資料(不含運送資料且物流編號為null)至資料庫
	void insertOrder(OrderBean ob);
	
	//更新訂單資料的物流編號
	void updateOrderShippingNo(String orderNo, String shippingNo);
	
	// 儲存訂單資料的運送資料至資料庫
	void insertShippingData(ShippingDataBean sd);

	// 取得單一帳戶所有未結且未取消之交易訂單紀錄(不含運送資料)
	List<OrderBean> getMemberNoPayOrders(String memberNo);

	//棄用，註解
	// 取得單一帳戶所有已結且未取消之交易訂單紀錄(不含運送資料)
//	List<OrderBean> getMemberCompletedOrders(String memberNo);

	// 取得單一帳戶所有已取消交易訂單紀錄(不含運送資料)
	List<OrderBean> getMemberCancelledOrders(String memberNo);

	// 取得單一帳戶所有交易訂單紀錄(不含運送資料)
	List<OrderBean> getMemberAllOrders(String memberNo);
	
	// 取得單一帳戶單一交易訂單紀錄(不含運送資料)
	OrderBean getOrdersList(String orderNo);
	
	// 取得單一帳戶單一交易訂單所有品項明細
	List<OrderItemBean> getOrdersDetail(String orderNo);

	// 會員更改運送資料(當運送狀態為null時)
	void modifyShippingData(ShippingDataBean sd);
	
	//更新一筆最新的訂單中的運送狀態
	void updateShippingStatus(String orderNo, String shippingStatus, Integer orderNo_sort);

	// 取得單一帳戶交易訂單紀錄最新的運送資料
	ShippingDataBean getShippingData(String orderNo);

//	void getShippingData();
}
