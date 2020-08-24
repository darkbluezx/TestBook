package _05_loginSystem.model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="Delivery")
public class Delivery {
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
	
	@ManyToOne
	@JoinColumn(name="FK_Members_2") 
	Members members;
	
//	@OneToMany(mappedBy = "delivery", cascade = CascadeType.ALL)
//	Set<DeliveryHistory> dHistoryHistories = new HashSet<>();
	
	public Delivery() {
		super();
	}

	public Delivery(Integer id, String deliveryName, String deliveryPhone, String pincode, String city, String region,
			String street, String store, Members members, Set<DeliveryHistory> dHistoryHistories) {
		super();
		this.id = id;
		this.deliveryName = deliveryName;
		this.deliveryPhone = deliveryPhone;
		this.pincode = pincode;
		this.city = city;
		this.region = region;
		this.street = street;
		this.store = store;
		this.members = members;
//		this.dHistoryHistories = dHistoryHistories;
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

	public Members getMembers() {
		return members;
	}

	public void setMembers(Members members) {
		this.members = members;
	}

//	public Set<DeliveryHistory> getdHistoryHistories() {
//		return dHistoryHistories;
//	}
//
//	public void setdHistoryHistories(Set<DeliveryHistory> dHistoryHistories) {
//		this.dHistoryHistories = dHistoryHistories;
//	}
	
}
