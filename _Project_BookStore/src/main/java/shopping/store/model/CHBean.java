package shopping.store.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CreateHome")
public class CHBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Id;
	private String MerchantID;
	private String MerchantTradeNo;
	private String RtnCode;
	private String RtnMsg;
	private String AllPayLogisticsID;
	private String LogisticsType;
	private String LogisticsSubType;
	private String GoodsAmount;
	private String UpdateStatusDate;
	private String ReceiverName;
	private String ReceiverPhone;
	private String ReceiverCellPhone;
	private String ReceiverEmail;
	private String ReceiverAddress;
	private String BookingNote;
	private String CheckMacValue;
	
	
	
	public CHBean() {
		super();
	}

	public CHBean(Integer id, String merchantID, String merchantTradeNo, String rtnCode, String rtnMsg,
			String allPayLogisticsID, String logisticsType, String logisticsSubType, String goodsAmount,
			String updateStatusDate, String receiverName, String receiverPhone, String receiverCellPhone,
			String receiverEmail, String receiverAddress, String bookingNote, String checkMacValue) {
		super();
		Id = id;
		MerchantID = merchantID;
		MerchantTradeNo = merchantTradeNo;
		RtnCode = rtnCode;
		RtnMsg = rtnMsg;
		AllPayLogisticsID = allPayLogisticsID;
		LogisticsType = logisticsType;
		LogisticsSubType = logisticsSubType;
		GoodsAmount = goodsAmount;
		UpdateStatusDate = updateStatusDate;
		ReceiverName = receiverName;
		ReceiverPhone = receiverPhone;
		ReceiverCellPhone = receiverCellPhone;
		ReceiverEmail = receiverEmail;
		ReceiverAddress = receiverAddress;
		BookingNote = bookingNote;
		CheckMacValue = checkMacValue;
	}

	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
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
	public String getRtnCode() {
		return RtnCode;
	}
	public void setRtnCode(String rtnCode) {
		RtnCode = rtnCode;
	}
	public String getRtnMsg() {
		return RtnMsg;
	}
	public void setRtnMsg(String rtnMsg) {
		RtnMsg = rtnMsg;
	}
	public String getAllPayLogisticsID() {
		return AllPayLogisticsID;
	}
	public void setAllPayLogisticsID(String allPayLogisticsID) {
		AllPayLogisticsID = allPayLogisticsID;
	}
	public String getLogisticsType() {
		return LogisticsType;
	}
	public void setLogisticsType(String logisticsType) {
		LogisticsType = logisticsType;
	}
	public String getLogisticsSubType() {
		return LogisticsSubType;
	}
	public void setLogisticsSubType(String logisticsSubType) {
		LogisticsSubType = logisticsSubType;
	}
	public String getGoodsAmount() {
		return GoodsAmount;
	}
	public void setGoodsAmount(String goodsAmount) {
		GoodsAmount = goodsAmount;
	}
	public String getUpdateStatusDate() {
		return UpdateStatusDate;
	}
	public void setUpdateStatusDate(String updateStatusDate) {
		UpdateStatusDate = updateStatusDate;
	}
	public String getReceiverName() {
		return ReceiverName;
	}
	public void setReceiverName(String receiverName) {
		ReceiverName = receiverName;
	}
	public String getReceiverPhone() {
		return ReceiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		ReceiverPhone = receiverPhone;
	}
	public String getReceiverCellPhone() {
		return ReceiverCellPhone;
	}
	public void setReceiverCellPhone(String receiverCellPhone) {
		ReceiverCellPhone = receiverCellPhone;
	}
	public String getReceiverEmail() {
		return ReceiverEmail;
	}
	public void setReceiverEmail(String receiverEmail) {
		ReceiverEmail = receiverEmail;
	}
	public String getReceiverAddress() {
		return ReceiverAddress;
	}
	public void setReceiverAddress(String receiverAddress) {
		ReceiverAddress = receiverAddress;
	}
	public String getBookingNote() {
		return BookingNote;
	}
	public void setBookingNote(String bookingNote) {
		BookingNote = bookingNote;
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
