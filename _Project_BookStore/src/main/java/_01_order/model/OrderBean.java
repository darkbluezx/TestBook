package _01_order.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//此類別存放各筆訂單
@Entity
@Table(name = "ordermain")
public class OrderBean {
	@Id
	@Column(name = "orderNo")
	String orderNo;
	
	@Column(name = "memberNo")
	String memberNo;
	
	@Column(name = "recipient") 
	String recipient;					//收件人
	
	@Column(name = "email")
	String email;
	
	@Column(name = "phoneNumber")
	String phoneNumber;
	
	@Column(name = "paymentMethod")
	String paymentMethod; 		//01 for 信用卡, 02 for 轉帳, 03 for 貨到付款
	
	@Column(name = "paymentStatus")
	String paymentStatus; 			// 01 for 已付款, 02 for 未付款
	
	@Column(name = "orderTotal")
	Double orderTotal;
	
	@Column(name = "orderTime")
	Date orderTime;
	
	@Column(name = "shippingNo")
	String shippingNo;
	
	@Column(name = "orderCancel")
	Integer orderCancel; 				// 1 for 存活, 2 for 已取消
	
//	@OneToOne
	@Column(name = "ShoppingEventId")
	Integer ShoppingEventId_from_ShoppingDiscountBean;
	
//	@OneToOne
	@Column(name = "DiscountEventId")
	Integer DiscountEventId_from_DiscountBean;
	
//	@OneToOne
	@Column(name = "FreeBieEventId")
	Integer FreeBieEventId_from_FreeBiesBean;
	
	@OneToMany(mappedBy = "orderBean", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	Set<OrderItemBean> oiDetail = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "orderBean", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	Set<ShippingDataBean> sdDetail = new LinkedHashSet<>();

	public OrderBean() {
	}

	public OrderBean(String orderNo, String memberNo, String recipient, String email, String phoneNumber,
			String paymentMethod, String paymentStatus, Double orderTotal, Date orderTime, String shippingNo,
			Integer orderCancel, Integer shoppingEventId_from_ShoppingDiscountBean,
			Integer discountEventId_from_DiscountBean, Integer freeBieEventId_from_FreeBiesBean,
			Set<OrderItemBean> oiDetail, Set<ShippingDataBean> sdDetail) {
		super();
		this.orderNo = orderNo;
		this.memberNo = memberNo;
		this.recipient = recipient;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.paymentMethod = paymentMethod;
		this.paymentStatus = paymentStatus;
		this.orderTotal = orderTotal;
		this.orderTime = orderTime;
		this.shippingNo = shippingNo;
		this.orderCancel = orderCancel;
		ShoppingEventId_from_ShoppingDiscountBean = shoppingEventId_from_ShoppingDiscountBean;
		DiscountEventId_from_DiscountBean = discountEventId_from_DiscountBean;
		FreeBieEventId_from_FreeBiesBean = freeBieEventId_from_FreeBiesBean;
		this.oiDetail = oiDetail;
		this.sdDetail = sdDetail;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public Double getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(Double orderTotal) {
		this.orderTotal = orderTotal;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public String getShippingNo() {
		return shippingNo;
	}

	public void setShippingNo(String shippingNo) {
		this.shippingNo = shippingNo;
	}

	public Integer getOrderCancel() {
		return orderCancel;
	}

	public void setOrderCancel(Integer orderCancel) {
		this.orderCancel = orderCancel;
	}

	public Integer getShoppingEventId_from_ShoppingDiscountBean() {
		return ShoppingEventId_from_ShoppingDiscountBean;
	}

	public void setShoppingEventId_from_ShoppingDiscountBean(Integer shoppingEventId_from_ShoppingDiscountBean) {
		ShoppingEventId_from_ShoppingDiscountBean = shoppingEventId_from_ShoppingDiscountBean;
	}

	public Integer getDiscountEventId_from_DiscountBean() {
		return DiscountEventId_from_DiscountBean;
	}

	public void setDiscountEventId_from_DiscountBean(Integer discountEventId_from_DiscountBean) {
		DiscountEventId_from_DiscountBean = discountEventId_from_DiscountBean;
	}

	public Integer getFreeBieEventId_from_FreeBiesBean() {
		return FreeBieEventId_from_FreeBiesBean;
	}

	public void setFreeBieEventId_from_FreeBiesBean(Integer freeBieEventId_from_FreeBiesBean) {
		FreeBieEventId_from_FreeBiesBean = freeBieEventId_from_FreeBiesBean;
	}

	public Set<OrderItemBean> getOiDetail() {
		return oiDetail;
	}

	public void setOiDetail(Set<OrderItemBean> oiDetail) {
		this.oiDetail = oiDetail;
	}

	public Set<ShippingDataBean> getSdDetail() {
		return sdDetail;
	}

	public void setSdDetail(Set<ShippingDataBean> sdDetail) {
		this.sdDetail = sdDetail;
	}
}
