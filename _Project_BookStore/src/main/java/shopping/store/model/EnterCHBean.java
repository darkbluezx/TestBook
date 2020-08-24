package shopping.store.model;

import java.io.Serializable;

public class EnterCHBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String MerchantTradeDate; //廠商交易時間
	private String LogisticsSubType; //物流子類型
	private String GoodsAmount; //商品金額
	private String GoodsName; //商品名稱
	private String SenderName; //寄件人姓名
	private String SenderCellPhone; //寄件人手機
	private String SenderZipCode; //寄件人郵遞區號
	private String SenderAddress; //寄件人地址
	private String ReceiverName; //收件人姓名
	private String ReceiverPhone; //收件人電話
	private String ReceiverCellPhone; //收件人手機
	private String ReceiverZipCode; //收件人郵遞區號
	private String ReceiverAddress; //收件人地址
	private String ReceiverEmail; //收件人 email 
	private String Temperature; //溫層
	private String Distance; //距離
	private String Specification; //規格
	private String ServerReplyURL; //Server端回覆網址
	private String ScheduledPickupTime; //預定取件時段
	
	public EnterCHBean() {
		super();
	}
	

	public EnterCHBean(String merchantTradeDate, String logisticsSubType, String goodsAmount, String goodsName,
			String senderName, String senderCellPhone, String senderZipCode, String senderAddress, String receiverName,
			String receiverPhone, String receiverCellPhone, String receiverZipCode, String receiverAddress,
			String receiverEmail, String temperature, String distance, String specification, String serverReplyURL,
			String scheduledPickupTime) {
		super();
		MerchantTradeDate = merchantTradeDate;
		LogisticsSubType = logisticsSubType;
		GoodsAmount = goodsAmount;
		GoodsName = goodsName;
		SenderName = senderName;
		SenderCellPhone = senderCellPhone;
		SenderZipCode = senderZipCode;
		SenderAddress = senderAddress;
		ReceiverName = receiverName;
		ReceiverPhone = receiverPhone;
		ReceiverCellPhone = receiverCellPhone;
		ReceiverZipCode = receiverZipCode;
		ReceiverAddress = receiverAddress;
		ReceiverEmail = receiverEmail;
		Temperature = temperature;
		Distance = distance;
		Specification = specification;
		ServerReplyURL = serverReplyURL;
		ScheduledPickupTime = scheduledPickupTime;
	}


	public String getMerchantTradeDate() {
		return MerchantTradeDate;
	}

	public void setMerchantTradeDate(String merchantTradeDate) {
		MerchantTradeDate = merchantTradeDate;
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

	public String getGoodsName() {
		return GoodsName;
	}

	public void setGoodsName(String goodsName) {
		GoodsName = goodsName;
	}

	public String getSenderName() {
		return SenderName;
	}

	public void setSenderName(String senderName) {
		SenderName = senderName;
	}

	public String getSenderCellPhone() {
		return SenderCellPhone;
	}

	public void setSenderCellPhone(String senderCellPhone) {
		SenderCellPhone = senderCellPhone;
	}

	public String getSenderZipCode() {
		return SenderZipCode;
	}

	public void setSenderZipCode(String senderZipCode) {
		SenderZipCode = senderZipCode;
	}

	public String getSenderAddress() {
		return SenderAddress;
	}

	public void setSenderAddress(String senderAddress) {
		SenderAddress = senderAddress;
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

	public String getReceiverZipCode() {
		return ReceiverZipCode;
	}

	public void setReceiverZipCode(String receiverZipCode) {
		ReceiverZipCode = receiverZipCode;
	}

	public String getReceiverAddress() {
		return ReceiverAddress;
	}

	public void setReceiverAddress(String receiverAddress) {
		ReceiverAddress = receiverAddress;
	}

	public String getReceiverEmail() {
		return ReceiverEmail;
	}

	public void setReceiverEmail(String receiverEmail) {
		ReceiverEmail = receiverEmail;
	}

	public String getTemperature() {
		return Temperature;
	}

	public void setTemperature(String temperature) {
		Temperature = temperature;
	}

	public String getDistance() {
		return Distance;
	}

	public void setDistance(String distance) {
		Distance = distance;
	}

	public String getSpecification() {
		return Specification;
	}

	public void setSpecification(String specification) {
		Specification = specification;
	}

	public String getServerReplyURL() {
		return ServerReplyURL;
	}

	public void setServerReplyURL(String serverReplyURL) {
		ServerReplyURL = serverReplyURL;
	}

	public String getScheduledPickupTime() {
		return ScheduledPickupTime;
	}

	public void setScheduledPickupTime(String scheduledPickupTime) {
		ScheduledPickupTime = scheduledPickupTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
}
