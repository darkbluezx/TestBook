package _01_order.model.compositeKey;

import java.io.Serializable;
import java.util.Date;

import _01_order.model.OrderBean;

public class ShippingDataPK_2 implements Serializable {
	private static final long serialVersionUID = 11223344L;

	// 兩者皆為主鍵屬性
	private OrderBean orderBean;
	private Date changeTime;

	public ShippingDataPK_2() {
	}

	public ShippingDataPK_2(OrderBean orderBean, Date changeTime) {
		super();
		this.orderBean = orderBean;
		this.changeTime = changeTime;
	}

//	public String getOrderNo() {
//		return orderNo;
//	}
//
//	public void setOrderNo(String orderNo) {
//		this.orderNo = orderNo;
//	}

	public Date getChangeTime() {
		return changeTime;
	}

	public void setChangeTime(Date changeTime) {
		this.changeTime = changeTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((changeTime == null) ? 0 : changeTime.hashCode());
		result = prime * result + ((orderBean == null) ? 0 : orderBean.hashCode());
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
		ShippingDataPK_2 other = (ShippingDataPK_2) obj;
		if (changeTime == null) {
			if (other.changeTime != null)
				return false;
		} else if (!changeTime.equals(other.changeTime))
			return false;
		if (orderBean == null) {
			if (other.orderBean != null)
				return false;
		} else if (!orderBean.equals(other.orderBean))
			return false;
		return true;
	}
	
	

}
