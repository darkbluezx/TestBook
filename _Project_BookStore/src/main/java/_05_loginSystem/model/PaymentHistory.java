package _05_loginSystem.model;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="PaymentHistory")
public class PaymentHistory {
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
	@org.hibernate.annotations.UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	Date updateDate;
	
	@ManyToOne
	@JoinColumn(name="FK_Payment")
	Payment payment;
	
	public PaymentHistory() {
		super();
	}

	public PaymentHistory(Integer id, String creditName, String creditNumber, String creditPincode, String expireMonth,
			String expireYear, String cvv, String creditStreet, Date updateDate, Payment payment) {
		super();
		this.id = id;
		this.creditName = creditName;
		this.creditNumber = creditNumber;
		this.creditPincode = creditPincode;
		this.expireMonth = expireMonth;
		this.expireYear = expireYear;
		this.cvv = cvv;
		this.creditStreet = creditStreet;
		this.updateDate = updateDate;
		this.payment = payment;
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

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

}
