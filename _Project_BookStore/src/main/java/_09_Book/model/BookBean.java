package _09_Book.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="Book")
public class BookBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer bookId;
	private String bookName; //書名
	private Double price; //價格
	private String author; //作者
//	private String publisher; //出版社
	@JsonIgnore
	private Blob image; //圖片
	private String imageName; //圖片名稱
	private String item; //類別
	private String miniItem; //細項
	private Integer stock; //庫存
	private Double point; 
	@Transient
	@JsonIgnore	
	private Integer companyId;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="companyId") 	
    private CompanyBean companyBean;
	
	@Transient //因hibernate認不得，所以要加@Transient
	private MultipartFile productImage;

	public BookBean(Integer bookId, String bookName, Double price, String author, Blob image,
			String imageName, String item, String miniItem,Integer stock, Integer companyId,
			CompanyBean companyBean) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.price = price;
		this.author = author;
//		this.publisher = publisher;
		this.image = image;
		this.imageName = imageName;
		this.item = item;
		this.miniItem = miniItem;
		this.companyId = companyId;
		this.companyBean = companyBean;
//		this.point = point;
	}
	public BookBean() {
		
		
	}
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
//	public String getPublisher() {
//		return publisher;
//	}
//	public void setPublisher(String publisher) {
//		this.publisher = publisher;
//	}
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

	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public Double getPoint() {
		return point;
	}
	public void setPoint(Double point) {
		this.point = point;
	}	
	
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public CompanyBean getCompanyBean() {
		return companyBean;
	}
	public void setCompanyBean(CompanyBean companyBean) {
		this.companyBean = companyBean;
	}
	public MultipartFile getProductImage() {
		return productImage;
	}
	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	
	

	
	
}
