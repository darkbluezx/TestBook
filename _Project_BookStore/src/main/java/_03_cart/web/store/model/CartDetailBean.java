package _03_cart.web.store.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="CartDetail")
public class CartDetailBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer detailKey; //購物車明細鍵值
	private String cartNo; //購物車序號-鍵值(20200701000001)
	private Integer productId; //產品id，連結產品資料用
	private Integer qty; //數量
	private Double discount; //單一產品折扣
	private Double price; //單價
	private String productName; //產品名稱
	private Integer discountEventId; //折扣id
	private Integer freeBieEventId;
	private String freeBies;
	private String companyName;
		
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="FK_Detail_key") 	
    private CartMasterBean cartMasterBean;

	public CartDetailBean() {
	}

	public CartDetailBean(Integer detailKey, String cartNo, Integer productId, Integer qty, Double discount,
			Double price, String productName, Integer discountEventId, Integer freeBieEventId, String freeBies,
			String companyName, CartMasterBean cartMasterBean) {
		super();
		this.detailKey = detailKey;
		this.cartNo = cartNo;
		this.productId = productId;
		this.qty = qty;
		this.discount = discount;
		this.price = price;
		this.productName = productName;
		this.discountEventId = discountEventId;
		this.freeBieEventId = freeBieEventId;
		this.freeBies = freeBies;
		this.companyName = companyName;
		this.cartMasterBean = cartMasterBean;
	}

	public Integer getDetailKey() {
		return detailKey;
	}


	public void setDetailKey(Integer detailKey) {
		this.detailKey = detailKey;
	}


	public String getCartNo() {
		return cartNo;
	}

	public void setCartNo(String cartNo) {
		this.cartNo = cartNo;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public CartMasterBean getCartMasterBean() {
		return cartMasterBean;
	}

	public void setCartMasterBean(CartMasterBean cartMasterBean) {
		this.cartMasterBean = cartMasterBean;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}


	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}


	public Integer getDiscountEventId() {
		return discountEventId;
	}


	public void setDiscountEventId(Integer discountEventId) {
		this.discountEventId = discountEventId;
	}


	public Integer getFreeBieEventId() {
		return freeBieEventId;
	}


	public void setFreeBieEventId(Integer freeBieEventId) {
		this.freeBieEventId = freeBieEventId;
	}


	public String getFreeBies() {
		return freeBies;
	}


	public void setFreeBies(String freeBies) {
		this.freeBies = freeBies;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

}
