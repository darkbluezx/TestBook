package _01_order.dao;

import _01_order.model.ShippingDataBean;

public interface ShippingDataDao {
	
	//儲存訂單資料的運送資料至資料庫
	void insertShippingData(ShippingDataBean sd);
	
	//更改運送資料(當運送狀態為null時)
	void modifyShippingData(ShippingDataBean sd);
	
	// 取得單一帳戶交易訂單紀錄最新的運送資料
	ShippingDataBean getShippingData(String orderNo);

	//更新一筆最新的訂單中的運送狀態
	void updateShippingStatus(String orderNo, String shippingStatus, Integer orderNo_sort);
}
