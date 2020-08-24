package _02_statistics.model;

import java.time.LocalDate;

//僅供顯示查詢結果之"格式"，不具輸入資料庫功能
public class StatisticFormatBean {
	
	Integer itemId;		//標的品項編號
	
	String itemName;	//標的品項名字,例如：型別、單一商品名
	
	Integer	itemPrice;	//標的品項價格，不是商品填NULL
	
	Integer itemSum;	//上面標的之數量總和
	
	LocalDate absoluteDate;  //查詢之時間為準
	
	Integer intervalYear;		//間隔年
	
	Integer intervalMonth;	//間隔月
	
	Integer intervalDay;		//間隔日
	
	public StatisticFormatBean() {}

	//顯示間隔日之查詢結果
	public StatisticFormatBean(Integer itemId, String itemName, Integer itemPrice, Integer itemSum,
			LocalDate absoluteDate, Integer intervalYear, Integer intervalMonth, Integer intervalDay) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemSum = itemSum;
		this.absoluteDate = absoluteDate;
		this.intervalYear = intervalYear;
		this.intervalMonth = intervalMonth;
		this.intervalDay = intervalDay;
	}

	//顯示間隔月之查詢結果
	public StatisticFormatBean(Integer itemId, String itemName, Integer itemPrice, Integer itemSum,
			LocalDate absoluteDate, Integer intervalYear, Integer intervalMonth) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemSum = itemSum;
		this.absoluteDate = absoluteDate;
		this.intervalYear = intervalYear;
		this.intervalMonth = intervalMonth;
	}

	//顯示間隔年之查詢結果
	public StatisticFormatBean(Integer itemId, String itemName, Integer itemPrice, Integer itemSum,
			LocalDate absoluteDate, Integer intervalYear) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemSum = itemSum;
		this.absoluteDate = absoluteDate;
		this.intervalYear = intervalYear;
	}

	//顯示單一時間之查詢結果
	public StatisticFormatBean(Integer itemId, String itemName, Integer itemPrice, Integer itemSum,
			LocalDate absoluteDate) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemSum = itemSum;
		this.absoluteDate = absoluteDate;
	}

	public StatisticFormatBean(Integer itemId, String itemName, Integer itemPrice, Integer itemSum) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemSum = itemSum;
	}

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Integer getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(Integer itemPrice) {
		this.itemPrice = itemPrice;
	}

	public Integer getItemSum() {
		return itemSum;
	}

	public void setItemSum(Integer itemSum) {
		this.itemSum = itemSum;
	}

	public LocalDate getAbsoluteDate() {
		return absoluteDate;
	}

	public void setAbsoluteDate(LocalDate absoluteDate) {
		this.absoluteDate = absoluteDate;
	}

	public Integer getIntervalYear() {
		return intervalYear;
	}

	public void setIntervalYear(Integer intervalYear) {
		this.intervalYear = intervalYear;
	}

	public Integer getIntervalMonth() {
		return intervalMonth;
	}

	public void setIntervalMonth(Integer intervalMonth) {
		this.intervalMonth = intervalMonth;
	}

	public Integer getIntervalDay() {
		return intervalDay;
	}

	public void setIntervalDay(Integer intervalDay) {
		this.intervalDay = intervalDay;
	}
	
	
	
}
