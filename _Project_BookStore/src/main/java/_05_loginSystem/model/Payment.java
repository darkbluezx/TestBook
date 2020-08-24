package _05_loginSystem.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Payment")
public class Payment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String creditName;
	String creditNumber;
	String creditPincode;
	String expireMonth;
	String expireYear;
	String cvv;
	String creditStreet;
	
	@ManyToOne
	@JoinColumn(name="FK_Members_1")
	Members members;
	
	@OneToMany(mappedBy = "payment", cascade = CascadeType.ALL)
	Set<PaymentHistory> paymentHistories = new HashSet<>();
	
	public Payment() {
		super();
	}

	public Payment(Integer id, String creditName, String creditNumber, String creditPincode, String expireMonth,
			String expireYear, String cvv, String creditStreet, Members members, Set<PaymentHistory> paymentHistories) {
		super();
		this.id = id;
		this.creditName = creditName;
		this.creditNumber = creditNumber;
		this.creditPincode = creditPincode;
		this.expireMonth = expireMonth;
		this.expireYear = expireYear;
		this.cvv = cvv;
		this.creditStreet = creditStreet;
		this.members = members;
		this.paymentHistories = paymentHistories;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCreditName() {
		return creditName;
	}

	public void setCreditName(String creditName) {
		this.creditName = creditName;
	}

	public String getCreditNumber() {
		return creditNumber;
	}

	public void setCreditNumber(String creditNumber) {
		this.creditNumber = creditNumber;
	}

	public String getCreditPincode() {
		return creditPincode;
	}

	public void setCreditPincode(String creditPincode) {
		this.creditPincode = creditPincode;
	}

	public String getExpireMonth() {
		return expireMonth;
	}

	public void setExpireMonth(String expireMonth) {
		this.expireMonth = expireMonth;
	}

	public String getExpireYear() {
		return expireYear;
	}

	public void setExpireYear(String expireYear) {
		this.expireYear = expireYear;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public String getCreditStreet() {
		return creditStreet;
	}

	public void setCreditStreet(String creditStreet) {
		this.creditStreet = creditStreet;
	}

	public Members getMembers() {
		return members;
	}

	public void setMembers(Members members) {
		this.members = members;
	}

	public Set<PaymentHistory> getPaymentHistories() {
		return paymentHistories;
	}

	public void setPaymentHistories(Set<PaymentHistory> paymentHistories) {
		this.paymentHistories = paymentHistories;
	}

	

}
