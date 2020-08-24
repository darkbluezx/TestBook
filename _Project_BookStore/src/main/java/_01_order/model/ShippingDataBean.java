package _01_order.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import _01_order.model.compositeKey.ShippingDataPK_2;

@Entity
@Table(name = "shippingdata")
@IdClass(ShippingDataPK_2.class)
public class ShippingDataBean {
	@Id
	@ManyToOne
	@JoinColumn(name = "orderNo") // orderNo_shippingdata
	OrderBean orderBean;

	@Id
	@Column(name = "changeTime")
	Date changeTime; // 同訂單, 第一次與訂購時間一樣, 第二次則以當時修改時間為主

	@Column(name = "address")
	String address;

	@Column(name = "shippingMethod")
	String shippingMethod; // 01 for 宅配到家, 02 for 到店取貨

	@Column(name = "shippingStatus")
	String shippingStatus; // null for 尚未發貨, 01 for 節點1, 02 for 節點2, 03 for 已送達地點, 目前設定如左
	
	@Column(name = "orderNo_sort")  //紀錄修改次數用，購物車結帳時填null
	Integer orderNo_sort;

	public ShippingDataBean() {
	}

	public ShippingDataBean(OrderBean orderBean, Date changeTime, String address, String shippingMethod,
			String shippingStatus, Integer orderNo_sort) {
		super();
		this.orderBean = orderBean;
		this.changeTime = changeTime;
		this.address = address;
		this.shippingMethod = shippingMethod;
		this.shippingStatus = shippingStatus;
		this.orderNo_sort = orderNo_sort;
	}

	public Date getChangeTime() {
		return changeTime;
	}

	public void setChangeTime(Date changeTime) {
		this.changeTime = changeTime;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getShippingMethod() {
		return shippingMethod;
	}

	public void setShippingMethod(String shippingMethod) {
		this.shippingMethod = shippingMethod;
	}

	public String getShippingStatus() {
		return shippingStatus;
	}

	public void setShippingStatus(String shippingStatus) {
		this.shippingStatus = shippingStatus;
	}

	public OrderBean getOrderBean() {
		return orderBean;
	}

	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}

	public Integer getOrderNo_sort() {
		return orderNo_sort;
	}

	public void setOrderNo_sort(Integer orderNo_sort) {
		this.orderNo_sort = orderNo_sort;
	}

	
}
