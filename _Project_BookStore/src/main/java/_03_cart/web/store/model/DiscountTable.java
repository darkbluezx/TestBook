package _03_cart.web.store.model;

import java.io.Serializable;

public class DiscountTable implements Serializable {
	private static final long serialVersionUID = 1L;
	private String companyName;
	private Integer companyId;
	private Integer qty;
	private Integer totalamt;
	private Double discount;
	private Integer discountEventId;
	private Integer freeBieEventId;
	private String freeBies;
	
	public DiscountTable() {
		
	}
	
	public DiscountTable(String companyName, Integer companyId, Integer qty, Integer totalamt, Double discount,
			Integer discountEventId, Integer freeBieEventId, String freeBies) {
		super();
		this.companyName = companyName;
		this.companyId = companyId;
		this.qty = qty;
		this.totalamt = totalamt;
		this.discount = discount;
		this.discountEventId = discountEventId;
		this.freeBieEventId = freeBieEventId;
		this.freeBies = freeBies;
	}

	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public Integer getQty() {
		return qty;
	}
	public void setQty(Integer qty) {
		this.qty = qty;
	}
	public Integer getTotalamt() {
		return totalamt;
	}
	public void setTotalamt(Integer totalamt) {
		this.totalamt = totalamt;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
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

}
