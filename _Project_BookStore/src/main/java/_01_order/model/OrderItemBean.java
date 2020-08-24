package _01_order.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import _01_order.model.compositeKey.OrderItemPK_2;

//此類別裝各訂單的每筆詳細資料
@Entity
@Table(name = "orderitem")
@IdClass(OrderItemPK_2.class)
public class OrderItemBean {
	@Id
	@Column(name = "orderItemId")
	Integer orderItemId;
	
	@Id
	@ManyToOne
	@JoinColumn(name = "orderNo")  // orderNo_orderItem
	OrderBean orderBean;
	
	@Column(name = "productNo")  // productNo連結bookbean.bookId
	Integer productNo;
	
	@Column(name = "productName")
	String productName;
	
	@Column(name = "productPriceAtTheTime")
	Double productPriceAtTheTime;
	
	@Column(name = "productQuantity")
	Integer productQuantity;


	public OrderItemBean() {
	}
	
	public OrderItemBean(Integer orderItemId, OrderBean orderBean, Integer productNo, String productName,
			Double productPriceAtTheTime, Integer productQuantity) {
		super();
		this.orderItemId = orderItemId;
		this.orderBean = orderBean;
		this.productNo = productNo;
		this.productName = productName;
		this.productPriceAtTheTime = productPriceAtTheTime;
		this.productQuantity = productQuantity;
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

	public Integer getProductNo() {
		return productNo;
	}

	public void setProductNo(Integer productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Double getProductPriceAtTheTime() {
		return productPriceAtTheTime;
	}

	public void setProductPriceAtTheTime(Double productPriceAtTheTime) {
		this.productPriceAtTheTime = productPriceAtTheTime;
	}

	public Integer getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(Integer productQuantity) {
		this.productQuantity = productQuantity;
	}

}
