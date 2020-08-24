package _09_Book.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
// 本類別封裝單筆出版社資料
@Entity
@Table(name="BookOrder")
public class BookOrderBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id ;
	private String  name;
	
	public BookOrderBean(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public BookOrderBean() {
		
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
	
	
	
}