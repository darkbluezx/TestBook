package _05_loginSystem.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;



@Entity
@Table(name="Members")
public class Members implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String googleId;
	String name;
//	String nickname;
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	String birthday;
	String gender;
	Blob photo;
	String level;
	String password;
	String phone;
	String mail;
	Timestamp registerDate;
	@Transient
	MultipartFile productImage;
	String fileName;
	
	@OneToMany(mappedBy = "members", cascade = CascadeType.ALL)
	Set<Payment> payments = new HashSet<>();
	
	@OneToMany(mappedBy = "members", cascade = CascadeType.ALL)
	Set<Delivery> deliverys = new HashSet<>();
	
	@OneToMany(mappedBy = "members", cascade = CascadeType.ALL)
	Set<MembersHistory> membersHistories = new HashSet<>();
	
	public Members() {
		super();
	}

	public Members(Integer id, String googleId, String name, String birthday, String gender, Blob photo, String level,
			String password, String phone, String mail, Timestamp registerDate) {
		super();
		this.id = id;
		this.googleId = googleId;
		this.name = name;
//		this.nickname = nickname;
		this.birthday = birthday;
		this.gender = gender;
		this.photo = photo;
		this.level = level;
		this.password = password;
		this.phone = phone;
		this.mail = mail;
		this.registerDate = registerDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	
	public String getGoogleId() {
		return googleId;
	}

	public void setGoogleId(String googleId) {
		this.googleId = googleId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

//	public String getNickname() {
//		return nickname;
//	}
//
//	public void setNickname(String nickname) {
//		this.nickname = nickname;
//	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public Timestamp getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Timestamp registerDate) {
		this.registerDate = registerDate;
	}

	public Set<Payment> getPayments() {
		return payments;
	}

	public void setPayments(Set<Payment> payments) {
		this.payments = payments;
	}

	public Set<Delivery> getDeliverys() {
		return deliverys;
	}

	public void setDeliverys(Set<Delivery> deliverys) {
		this.deliverys = deliverys;
	}

	public Set<MembersHistory> getMembersHistories() {
		return membersHistories;
	}

	public void setMembersHistories(Set<MembersHistory> membersHistories) {
		this.membersHistories = membersHistories;
	}
	
	public String toString() {
		return "phone=" + phone + "   password=" + password + "   photo=" + photo;
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
