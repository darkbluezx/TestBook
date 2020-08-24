package _01_order.model.compositeKey;

import java.io.Serializable;

import _01_order.model.OrderBean;

public class OrderItemPK_2 implements Serializable {
	private static final long serialVersionUID = 9988776655L;

	// 兩者皆為主鍵屬性
	private Integer orderItemId;
	private OrderBean orderBean;

	public OrderItemPK_2() {
	}

	public OrderItemPK_2(Integer orderItemId, OrderBean orderBean) {
		super();
		this.orderItemId = orderItemId;
		this.orderBean = orderBean;
	}


	public Integer getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(Integer orderItemId) {
		this.orderItemId = orderItemId;
	}

	public OrderBean getOrderBean() {
		return orderBean;
	}

	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((orderBean == null) ? 0 : orderBean.hashCode());
		result = prime * result + ((orderItemId == null) ? 0 : orderItemId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderItemPK_2 other = (OrderItemPK_2) obj;
		if (orderBean == null) {
			if (other.orderBean != null)
				return false;
		} else if (!orderBean.equals(other.orderBean))
			return false;
		if (orderItemId == null) {
			if (other.orderItemId != null)
				return false;
		} else if (!orderItemId.equals(other.orderItemId))
			return false;
		return true;
	}

	

}
