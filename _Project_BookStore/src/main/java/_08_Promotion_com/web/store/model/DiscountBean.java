package _08_Promotion_com.web.store.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

import _09_Book.model.CompanyBean;

@Entity(name="DiscountBean")
@Table(name="Discount")
public class DiscountBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private Integer		DiscountEventId;
	private String 		DiscountEventName;
	private String		DiscountContent;
	private Integer		ThresholdQuantity;
	private Double		Discount;
	
	private Blob		DiscountImg;  //折扣_圖
	private String		filename2;
	
	private Timestamp	DiscountFromDate;
	private Timestamp	DiscountFinishDate;
	@Transient
	private Integer  	companyId;
	
	private String		discountArray;
	
	
	@XmlTransient
	@Transient
	private MultipartFile  discountImage;
	
	public MultipartFile getDiscountImage() {
		return discountImage;
	}

	public void setDiscountImage(MultipartFile discountImage) {
		this.discountImage = discountImage;
	}
	
	
	
	//一個出版社折扣活動，對應一個出版社
		@OneToOne(cascade=CascadeType.ALL)
		@JoinColumn(name="FK_CompanyBean_Id")
		private CompanyBean companyBean;
		
	public DiscountBean(Integer DiscountEventId,String DiscountEventName,
			String DiscountContent,Integer ThresholdQuantity,Double Discount,
			Timestamp DiscountFromDate,Timestamp DiscountFinishDate,Blob DiscountImg,
			CompanyBean companyBean) {
				this.DiscountEventId=DiscountEventId;
				this.DiscountEventName=DiscountEventName;
				this.DiscountContent=DiscountContent;
				this.ThresholdQuantity=ThresholdQuantity;
				this.Discount=Discount;
				this.DiscountFromDate=DiscountFromDate;
				this.DiscountFinishDate=DiscountFinishDate;
				this.companyBean=companyBean;
				this.DiscountImg=DiscountImg;
				
	}
	
	public DiscountBean() {
		
	}
	
	public Integer getDiscountEventId() {
		return DiscountEventId;
	}

	public void setDiscountEventId(Integer discountEventId) {
		DiscountEventId = discountEventId;
	}

	public String getDiscountEventName() {
		return DiscountEventName;
	}

	public void setDiscountEventName(String discountEventName) {
		DiscountEventName = discountEventName;
	}

	public String getDiscountContent() {
		return DiscountContent;
	}

	public void setDiscountContent(String discountContent) {
		DiscountContent = discountContent;
	}

	public Integer getThresholdQuantity() {
		return ThresholdQuantity;
	}

	public void setThresholdQuantity(Integer thresholdQuantity) {
		ThresholdQuantity = thresholdQuantity;
	}

	public Double getDiscount() {
		return Discount;
	}

	public void setDiscount(Double discount) {
		Discount = discount;
	}

	public CompanyBean getCompanyBean() {
		return companyBean;
	}

	public void setCompanyBean(CompanyBean companyBean) {
		this.companyBean = companyBean;
	}

	public Integer getCompanyId() {
		return companyBean != null ? companyBean.getId() : companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public Timestamp getDiscountFromDate() {
		return DiscountFromDate;
	}

	public void setDiscountFromDate(Timestamp discountFromDatee) {
		DiscountFromDate = discountFromDatee;
	}

	public Timestamp getDiscountFinishDate() {
		return DiscountFinishDate;
	}

	public void setDiscountFinishDate(Timestamp discountFinishDate) {
		DiscountFinishDate = discountFinishDate;
	}


	public String getDiscountArray() {
		return discountArray;
	}

	public void setDiscountArray(String discountArray) {
		this.discountArray = discountArray;
	}

	public Blob getDiscountImg() {
		return DiscountImg;
	}

	public void setDiscountImg(Blob discountImg) {
		DiscountImg = discountImg;
	}

	public String getFilename2() {
		return filename2;
	}

	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}

	

	
	
	
	
	
	

}
