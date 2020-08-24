package shopping.store.model;

import java.io.Serializable;

public class EnterCHBeanC implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String MerchantTradeDate; //廠商交易時間
//	private String LogisticsSubType; //物流子類型
	private String GoodsAmount; //商品金額
	private String GoodsName; //商品名稱
//	private String SenderName; //寄件人姓名
//	private String SenderCellPhone; //寄件人手機
//	private String SenderZipCode; //寄件人郵遞區號
//	private String SenderAddress; //寄件人地址
	private String ReceiverName; //收件人姓名
	private String ReceiverPhone; //收件人電話
	private String ReceiverCellPhone; //收件人手機
	private String ReceiverZipCode; //收件人郵遞區號
	private String ReceiverAddress; //收件人地址
	private String ReceiverEmail; //收件人 email 
//	private String Temperature; //溫層
//	private String Distance; //距離
//	private String Specification; //規格
//	private String ServerReplyURL; //Server端回覆網址
//	private String ScheduledPickupTime; //預定取件時段
	
	public EnterCHBeanC() {
		super();
	}

	
	public EnterCHBeanC(String merchantTradeDate, String goodsAmount, String goodsName, String receiverName,
		String receiverPhone, String receiverCellPhone, String receiverZipCode, String receiverAddress,
		String receiverEmail) {
	super();
	MerchantTradeDate = merchantTradeDate;
	GoodsAmount = goodsAmount;
	GoodsName = goodsName;
	ReceiverName = receiverName;
	ReceiverPhone = receiverPhone;
	ReceiverCellPhone = receiverCellPhone;
	ReceiverZipCode = receiverZipCode;
	ReceiverAddress = receiverAddress;
	ReceiverEmail = receiverEmail;
}


	public String getMerchantTradeDate() {
		return MerchantTradeDate;
	}

	public void setMerchantTradeDate(String merchantTradeDate) {
		MerchantTradeDate = merchantTradeDate;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	
	
}
