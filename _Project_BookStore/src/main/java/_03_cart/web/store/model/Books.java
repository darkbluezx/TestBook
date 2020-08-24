package _03_cart.web.store.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="Books")
public class Books implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer bookId;
	private String bookName;
	private Double price;
	private String author;
	private String publisher;
	@JsonIgnore
	private Blob image;
	private String imageName;
	private String item;
	private String miniItem;
	private Double stock;
	private Double point;
	private Integer companyId;
	@JsonIgnore
	@Transient
	private MultipartFile productImage;
	public Integer getBookId() {
		return bookId;
	}
	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getMiniItem() {
		return miniItem;
	}
	public void setMiniItem(String miniItem) {
		this.miniItem = miniItem;
	}
	public Double getStock() {
		return stock;
	}
	public void setStock(Double stock) {
		this.stock = stock;
	}
	public Double getPoint() {
		return point;
	}
	public void setPoint(Double point) {
		this.point = point;
	}
	
	public MultipartFile getProductImage() {
		return productImage;
	}
	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}
	
	public Books(Integer bookId, String bookName, Double price, String author, String publisher, Blob image,
			String imageName, String item, String miniItem, Double stock, Double point, Integer companyId,
			MultipartFile productImage) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.price = price;
		this.author = author;
		this.publisher = publisher;
		this.image = image;
		this.imageName = imageName;
		this.item = item;
		this.miniItem = miniItem;
		this.stock = stock;
		this.point = point;
		this.companyId = companyId;
		this.productImage = productImage;
	}
	public Books() {
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	
}
