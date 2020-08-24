package _08_Promotion_com.web.store.model;

public class ShoppingCartBean {
	
	private String detailNumber;   //購物車各項明細編號
	private String productNumber;	//產品編號
	private int amount;				//產品購買數量
	private int productPrice;		//產品金額
	
	
	public String getDetailNumber() {
		return detailNumber;
	}
	public void setDetailNumber(String detailNumber) {
		this.detailNumber = detailNumber;
	}
	public String getProductNumber() {
		return productNumber;
	}
	public void setProductNumber(String productNumber) {
		this.productNumber = productNumber;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	

}
