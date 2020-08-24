package _08_Promotion_com.web.store.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="ShoppingDiscountBean")
@Table(name="ShoppingDiscount")
public class ShoppingDiscountBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer		ShoppingEventId ;
	private String 		ShoppingEventName;
	private String		ShoppingEventContent;  //活動內容說明
	
	private Integer		ShoppingThreshold ;  //需達到門檻(ex:單筆購物車須滿$1500)
	private Integer		ShoppingDiscount ;   //獲得的折扣金額(ex:折100元)
	
	private Timestamp	ShoppingFromDate;   //活動開始時間
	private Timestamp	ShoppingFinishDate;  //活動結束時間
	
	public ShoppingDiscountBean(Integer	ShoppingEventId,String ShoppingEventName
			,String ShoppingEventContent,Integer ShoppingThreshold,Integer ShoppingDiscount,
			Timestamp ShoppingFromDate,Timestamp ShoppingFinishDate) {
		this.ShoppingEventId=ShoppingEventId;
		this.ShoppingEventName=ShoppingEventName;
		this.ShoppingEventContent=ShoppingEventContent;
		this.ShoppingThreshold=ShoppingThreshold;
		this.ShoppingDiscount=ShoppingDiscount;
		this.ShoppingFromDate=ShoppingFromDate;
		this.ShoppingFinishDate=ShoppingFinishDate;	
	}
	
	public ShoppingDiscountBean() {
		
	}

	public Integer getShoppingEventId() {
		return ShoppingEventId;
	}

	public void setShoppingEventId(Integer shoppingEventId) {
		ShoppingEventId = shoppingEventId;
	}

	public String getShoppingEventName() {
		return ShoppingEventName;
	}

	public void setShoppingEventName(String shoppingEventName) {
		ShoppingEventName = shoppingEventName;
	}

	public String getShoppingEventContent() {
		return ShoppingEventContent;
	}

	public void setShoppingEventContent(String shoppingEventContent) {
		ShoppingEventContent = shoppingEventContent;
	}

	public Integer getShoppingThreshold() {
		return ShoppingThreshold;
	}

	public void setShoppingThreshold(Integer shoppingThreshold) {
		ShoppingThreshold = shoppingThreshold;
	}

	
	public Integer getShoppingDiscount() {
		return ShoppingDiscount;
	}

	public void setShoppingDiscount(Integer shoppingDiscount) {
		ShoppingDiscount = shoppingDiscount;
	}

	public Timestamp getShoppingFromDate() {
		return ShoppingFromDate;
	}

	public void setShoppingFromDate(Timestamp shoppingFromDate) {
		ShoppingFromDate = shoppingFromDate;
	}

	public Timestamp getShoppingFinishDate() {
		return ShoppingFinishDate;
	}

	public void setShoppingFinishDate(Timestamp shoppingFinishDate) {
		ShoppingFinishDate = shoppingFinishDate;
	}
	
	
	
}
