package shopping.store.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="QueryLogisticsTradeInfo")
public class QLTIBean implements Serializable{ //QueryLogisticsTradeInfo
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Id;
	private String AllPayLogisticsID;
	private String BookingNote;
	private String GoodsAmount;
	private String GoodsName;
	private String HandlingCharge;
	private String LogisticsStatus;
	private String LogisticsType;
	private String MerchantID;
	private String MerchantTradeNo;
	private String TradeDate;
	private String CheckMacValue;
	
	public QLTIBean() {
		super();
	}
	public QLTIBean(Integer id, String allPayLogisticsID, String bookingNote, String goodsAmount, String goodsName,
			String handlingCharge, String logisticsStatus, String logisticsType, String merchantID,
			String merchantTradeNo, String tradeDate, String checkMacValue) {
		super();
		Id = id;
		AllPayLogisticsID = allPayLogisticsID;
		BookingNote = bookingNote;
		GoodsAmount = goodsAmount;
		GoodsName = goodsName;
		HandlingCharge = handlingCharge;
		LogisticsStatus = logisticsStatus;
		LogisticsType = logisticsType;
		MerchantID = merchantID;
		MerchantTradeNo = merchantTradeNo;
		TradeDate = tradeDate;
		CheckMacValue = checkMacValue;
	}
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public String getAllPayLogisticsID() {
		return AllPayLogisticsID;
	}
	public void setAllPayLogisticsID(String allPayLogisticsID) {
		AllPayLogisticsID = allPayLogisticsID;
	}
	public String getBookingNote() {
		return BookingNote;
	}
	public void setBookingNote(String bookingNote) {
		BookingNote = bookingNote;
	}
	public String getGoodsAmount() {
		return GoodsAmount;
	}
	public void setGoodsAmount(String goodsAmount) {
		GoodsAmount = goodsAmount;
	}
	public String getGoodsName() {
		return GoodsName;
	}
	public void setGoodsName(String goodsName) {
		GoodsName = goodsName;
	}
	public String getHandlingCharge() {
		return HandlingCharge;
	}
	public void setHandlingCharge(String handlingCharge) {
		HandlingCharge = handlingCharge;
	}
	public String getLogisticsStatus() {
		return LogisticsStatus;
	}
	public void setLogisticsStatus(String logisticsStatus) {
		LogisticsStatus = logisticsStatus;
	}
	public String getLogisticsType() {
		return LogisticsType;
	}
	public void setLogisticsType(String logisticsType) {
		LogisticsType = logisticsType;
	}
	public String getMerchantID() {
		return MerchantID;
	}
	public void setMerchantID(String merchantID) {
		MerchantID = merchantID;
	}
	public String getMerchantTradeNo() {
		return MerchantTradeNo;
	}
	public void setMerchantTradeNo(String merchantTradeNo) {
		MerchantTradeNo = merchantTradeNo;
	}
	public String getTradeDate() {
		return TradeDate;
	}
	public void setTradeDate(String tradeDate) {
		TradeDate = tradeDate;
	}
	public String getCheckMacValue() {
		return CheckMacValue;
	}
	public void setCheckMacValue(String checkMacValue) {
		CheckMacValue = checkMacValue;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
