package _01_order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _01_order.dao.OrderDao;
import _01_order.dao.OrderItemDao;
import _01_order.dao.ShippingDataDao;
import _01_order.model.OrderBean;
import _01_order.model.OrderItemBean;
import _01_order.model.ShippingDataBean;
import _01_order.service.OrderService;

@Service // ("OrderService0101")
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDao odao;
	@Autowired
	OrderItemDao oidao;
	@Autowired
	ShippingDataDao sddao;

//	private static String[] shippingMethodTrans = {"none","宅配到家","到店取貨"};
//	private static String[] shippingStatusTrans = {};

	public OrderServiceImpl() {
	}

	@Transactional
	@Override
	public void insertOrder(OrderBean ob) {

		odao.insertOrder(ob);
	}
	
	@Override
	public void updateOrderShippingNo(String orderNo, String shippingNo) {
		odao.updateOrderShippingNo(orderNo, shippingNo);
		
	}

	@Transactional
	@Override
	public void insertShippingData(ShippingDataBean sd) {
		sddao.insertShippingData(sd);
	}

	@Transactional
	@Override
	public List<OrderBean> getMemberNoPayOrders(String memberNo) {
		List<OrderBean> list = null;
		list = odao.getMemberNoPayOrders(memberNo);
		return list;
	}

	//棄用，註解
//	@Transactional
//	@Override
//	public List<OrderBean> getMemberCompletedOrders(String memberNo) {
//		List<OrderBean> list = null;
//		list = odao.getMemberCompletedOrders(memberNo);
//		return list;
//	}

	@Transactional
	@Override
	public List<OrderBean> getMemberCancelledOrders(String memberNo) {
		List<OrderBean> list = null;
		list = odao.getMemberCancelledOrders(memberNo);
		return list;
	}

	@Transactional
	@Override
	public List<OrderBean> getMemberAllOrders(String memberNo) {
		List<OrderBean> list = null;
		list = odao.getMemberAllOrders(memberNo);
		return list;
	}
	
	@Transactional
	@Override
	public List<OrderItemBean> getOrdersDetail(String orderNo) {
		List<OrderItemBean> list = null;
		list = oidao.getOrdersDetail(orderNo);
		return list;
	}
	
	@Transactional
	@Override
	public OrderBean getOrdersList(String orderNo) {
		OrderBean ob = odao.getOrder(orderNo);
		return ob;
	}

	@Transactional
	@Override
	public ShippingDataBean getShippingData(String orderNo) { // ShippingDataBean String orderNo
		ShippingDataBean sd = sddao.getShippingData(orderNo);
		return sd;
	}

	@Transactional
	@Override
	public void modifyShippingData(ShippingDataBean sd) {
			sddao.modifyShippingData(sd);
	}

	@Override
	public void updateShippingStatus(String orderNo, String shippingStatus, Integer orderNo_sort) {
		sddao.updateShippingStatus(orderNo, shippingStatus, orderNo_sort);
		
	}

	

}
