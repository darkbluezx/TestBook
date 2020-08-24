package _01_order.model.compositeKey;

import java.io.Serializable;
import java.util.Date;

public class ShippingDataPK implements Serializable {
	private static final long serialVersionUID = 11223344L;

	// 兩者皆為主鍵屬性
	private String orderNo;
	private Date changeTime;

	public ShippingDataPK() {
	}

	public ShippingDataPK(String orderNo, Date changeTime) {
		super();
		this.orderNo = orderNo;
		this.changeTime = changeTime;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

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
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;

		ShippingDataPK other = (ShippingDataPK) obj;
		if (changeTime == null) {
			if (other.changeTime != null)
				return false;
		} else if (!changeTime.equals(other.changeTime))
			return false;
		if (orderNo == null) {
			if (other.orderNo != null)
				return false;
		} else if (!orderNo.equals(other.orderNo))
			return false;
		return true;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((changeTime == null) ? 0 : changeTime.hashCode());
		result = prime * result + ((orderNo == null) ? 0 : orderNo.hashCode());
		return result;
	}

}
