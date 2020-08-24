package _05_loginSystem.model;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="DeliveryHistory")
public class DeliveryHistory {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer  id;
	String deliveryName;
	String deliveryPhone;
	String pincode;
	String city;
	String region;
	String street;
	String store;
	@org.hibernate.annotations.UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	Date updateDate;
	
//	@ManyToOne
//	@JoinColumn(name="FK_Delivery")
//	Delivery delivery;
	
	public DeliveryHistory() {
		super();
	}

	public DeliveryHistory(Integer id, String deliveryName, String deliveryPhone, String pincode, String city,
			String region, String street, String store, Date updateDate, Delivery delivery) {
		super();
		this.id = id;
		this.deliveryName = deliveryName;
		this.deliveryPhone = deliveryPhone;
		this.pincode = pincode;
		this.city = city;
		this.region = region;
		this.street = street;
		this.store = store;
		this.updateDate = updateDate;
//		this.delivery = delivery;
	}

	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}

	
	public String getDeliveryName() {
		return deliveryName;
	}

	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}

	public String getDeliveryPhone() {
		return deliveryPhone;
	}

	public void setDeliveryPhone(String deliveryPhone) {
		this.deliveryPhone = deliveryPhone;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getStore() {
		return store;
	}
	
	public void setStore(String store) {
		this.store = store;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

//	public Delivery getDelivery() {
//		return delivery;
//	}
//
//	public void setDelivery(Delivery delivery) {
//		this.delivery = delivery;
//	}
}
