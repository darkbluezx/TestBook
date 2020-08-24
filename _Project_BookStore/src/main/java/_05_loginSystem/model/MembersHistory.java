package _05_loginSystem.model;

import java.sql.Blob;
import java.sql.Timestamp;
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
@Table(name="MembersHistory")
public class MembersHistory {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
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
	@org.hibernate.annotations.UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	Date updateDate;

	@ManyToOne
	@JoinColumn(name="FK_Members")
	Members members;
	
	public MembersHistory() {
		super();
	}
	
	public MembersHistory(Integer id, String name, String birthday, String gender, Blob photo,
			String level, String password, String phone, String mail, Timestamp registerDate,
			Date updateDate, Members members) {
		super();
		this.id = id;
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
		this.updateDate = updateDate;
		this.members = members;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Members getMembers() {
		return members;
	}

	public void setMembers(Members members) {
		this.members = members;
	}
	
}
