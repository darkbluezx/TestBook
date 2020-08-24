package _03_cart.web.store.model;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="CartMaster")
public class CartMasterBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String cartNo; //購物車序號-鍵值(20200701000001)
	private String memberId; //會員id
	private Double amount;  //購物總金額
	private Float discount; //折扣
	private Double divident; //折抵紅利金額
	private String address;  //運送地址
	private String payKind;  //付款方式 1.貨到付款 2.信用卡
	private String creditCardNo; //信用卡號碼
	private String creditCardYY; //信用卡到期年
	private String creditCardMM; //信用卡到期月
	private String creditCardCV; //信用卡號碼CV
	private String atmNo; //轉帳號碼
	private String phone; //連絡電話
	private Date invalidDate; //訂單成立日
	private String name; //送貨名稱
	private String holdername; //持卡人
	private String email; //email address
	private Integer shoppingEventId;
	@OneToMany(mappedBy="cartMasterBean")
	private Set<CartDetailBean> cart = new LinkedHashSet<>();
	
	public CartMasterBean(String cartNo, String memberId, Double amount, Float discount, Double divident,
			String address, String payKind, String creditCardNo, String creditCardYY, String creditCardMM,
			String creditCardCV, String atmNo, String phone, Date invalidDate, String name, String holdername,
			String email, Set<CartDetailBean> cart) {
		super();
		this.cartNo = cartNo;
		this.memberId = memberId;
		this.amount = amount;
		this.discount = discount;
		this.divident = divident;
		this.address = address;
		this.payKind = payKind;
		this.creditCardNo = creditCardNo;
		this.creditCardYY = creditCardYY;
		this.creditCardMM = creditCardMM;
		this.creditCardCV = creditCardCV;
		this.atmNo = atmNo;
		this.phone = phone;
		this.invalidDate = invalidDate;
		this.name = name;
		this.holdername = holdername;
		this.email = email;
		this.cart = cart;
	}

	public CartMasterBean() {
	}

	public String getCartNo() {
		return cartNo;
	}
	public void setCartNo(String cartNo) {
		this.cartNo = cartNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public Float getDiscount() {
		return discount;
	}
	public void setDiscount(Float discount) {
		this.discount = discount;
	}
	public Double getDivident() {
		return divident;
	}
	public void setDivident(Double divident) {
		this.divident = divident;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPayKind() {
		return payKind;
	}
	public void setPayKind(String payKind) {
		this.payKind = payKind;
	}
	public String getCreditCardNo() {
		return creditCardNo;
	}
	public void setCreditCardNo(String creditCardNo) {
		this.creditCardNo = creditCardNo;
	}
	public String getAtmNo() {
		return atmNo;
	}
	public void setAtmNo(String atmNo) {
		this.atmNo = atmNo;
	}
	public Set<CartDetailBean> getCart() {
		return cart;
	}
	public void setCart(Set<CartDetailBean> cart) {
		this.cart = cart;
	}

	public Date getInvalidDate() {
		return invalidDate;
	}

	public void setInvalidDate(Date invalidDate) {
		this.invalidDate = invalidDate;
	}

	public String getCreditCardYY() {
		return creditCardYY;
	}

	public void setCreditCardYY(String creditCardYY) {
		this.creditCardYY = creditCardYY;
	}

	public String getCreditCardMM() {
		return creditCardMM;
	}

	public void setCreditCardMM(String creditCardMM) {
		this.creditCardMM = creditCardMM;
	}

	public String getCreditCardCV() {
		return creditCardCV;
	}

	public void setCreditCardCV(String creditCardCV) {
		this.creditCardCV = creditCardCV;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHoldername() {
		return holdername;
	}

	public void setHoldername(String holdername) {
		this.holdername = holdername;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getShoppingEventId() {
		return shoppingEventId;
	}

	public void setShoppingEventId(Integer shoppingEventId) {
		this.shoppingEventId = shoppingEventId;
	}
	
	

}
