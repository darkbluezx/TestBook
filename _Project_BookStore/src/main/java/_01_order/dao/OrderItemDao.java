package _01_order.dao;

import java.util.List;

import _01_order.model.OrderItemBean;

public interface OrderItemDao {
	
	//不完全，請勿使用
//	double calculateSingleItemAmount(OrderItemBean oib, BookBean bkb);
	
	List<OrderItemBean> getOrdersDetail(String orderNo);
	
//	OrderBean getOrdersList(String orderNo);
	
	
}
