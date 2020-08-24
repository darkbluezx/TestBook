package shopping.store.model;

import java.io.Serializable;

public class EnterQLTIBean implements Serializable{ //QueryLogisticsTradeInfo
	private static final long serialVersionUID = 1L;
	private String AllPayLogisticsID;
	
	public EnterQLTIBean() {
		super();
	}
	public EnterQLTIBean(String allPayLogisticsID) {
		super();
		AllPayLogisticsID = allPayLogisticsID;
	}
	public String getAllPayLogisticsID() {
		return AllPayLogisticsID;
	}
	public void setAllPayLogisticsID(String allPayLogisticsID) {
		AllPayLogisticsID = allPayLogisticsID;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
