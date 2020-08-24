package _08_Promotion_com.web.store.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;
//import java.util.LinkedHashSet;
//import java.util.Set;

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


@Entity(name="FreeBiesBean")
@Table(name="FreeBies")
public class FreeBiesBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private Integer		FreeBieEventId;
	private String 		FreeBieEventName;
	private Integer		FreeBieThreshold;

	private String 		FreeBies;
	private Blob		FreeBiesImg;  //贈_圖
	private String		filename;

	private Integer		FreeBieQuota;
	private String		FreeBieContent;
	
	private Timestamp	FreeBieFromDate;
	private Timestamp	FreeBieFinishDate;
	@Transient
	private Integer  	companyId;
	
	private String FreeBieDateStr;
	
	@XmlTransient
	@Transient
	private MultipartFile  freeImage;

	public MultipartFile getFreeImage() {
		return freeImage;
	}

	public void setFreeImage(MultipartFile freeImage) {
		this.freeImage = freeImage;
	}

	//一個贈品活動，對應一個出版社
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="FK_CompanyBean_Id")
	private CompanyBean companyBean;
	
	
	
	public FreeBiesBean(Integer FreeBieEventId, String FreeBieEventName, Integer FreeBieThreshold, 
			String FreeBies,Blob FreeBiesImg,Integer FreeBieQuota,
			String FreeBieContent,Timestamp FreeBieFromDate
			,Timestamp FreeBieFinishDate,CompanyBean companyBean) {
		this.FreeBieEventId = FreeBieEventId;
		this.FreeBieEventName = FreeBieEventName;
		this.FreeBieThreshold = FreeBieThreshold;
		this.FreeBies=FreeBies;
		this.FreeBiesImg=FreeBiesImg;
		this.FreeBieQuota = FreeBieQuota;
	
		this.FreeBieContent = FreeBieContent;
		this.FreeBieFromDate=FreeBieFromDate;
		this.FreeBieFinishDate=FreeBieFinishDate;
		this.companyBean=companyBean;
		
	}
	
	public FreeBiesBean(Integer FreeBieEventId, String FreeBieEventName, Integer FreeBieThreshold, 
			String FreeBies,Blob FreeBiesImg,Integer FreeBieQuota,
			String FreeBieContent,Timestamp FreeBieFromDate
			,Timestamp FreeBieFinishDate,int companyId) {
		this.FreeBieEventId = FreeBieEventId;
		this.FreeBieEventName = FreeBieEventName;
		this.FreeBieThreshold = FreeBieThreshold;
		this.FreeBies=FreeBies;
		this.FreeBiesImg=FreeBiesImg;
		this.FreeBieQuota = FreeBieQuota;
	
		this.FreeBieContent = FreeBieContent;
		this.FreeBieFromDate=FreeBieFromDate;
		this.FreeBieFinishDate=FreeBieFinishDate;
		this.companyId=companyId;
		
	}
	



	public FreeBiesBean() {
	}
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	public CompanyBean getCompanyBean() {
		return companyBean;
	}
	

	public void setCompanyBean(CompanyBean companyBean) {
		this.companyBean = companyBean;
	}

	public Integer getFreeBieEventId() {
		return FreeBieEventId;
	}

	public void setFreeBieEventId(Integer freeBieEventId) {
		FreeBieEventId = freeBieEventId;
	}

	public String getFreeBieEventName() {
		return FreeBieEventName;
	}

	public void setFreeBieEventName(String freeBieEventName) {
		FreeBieEventName = freeBieEventName;
	}

	public Integer getFreeBieThreshold() {
		return FreeBieThreshold;
	}

	public void setFreeBieThreshold(Integer freeBieThreshold) {
		FreeBieThreshold = freeBieThreshold;
	}

	public String getFreeBies() {
		return FreeBies;
	}

	public void setFreeBies(String freeBies) {
		FreeBies = freeBies;
	}

	public Integer getFreeBieQuota() {
		return FreeBieQuota;
	}

	public void setFreeBieQuota(Integer freeBieQuota) {
		FreeBieQuota = freeBieQuota;
	}

	public String getFreeBieContent() {
		return FreeBieContent;
	}

	public void setFreeBieContent(String freeBieContent) {
		FreeBieContent = freeBieContent;
	}

	public Timestamp getFreeBieFromDate() {
		return FreeBieFromDate;
	}

	public void setFreeBieFromDate(Timestamp freeBieFromDate) {
		FreeBieFromDate = freeBieFromDate;
	}

	public Timestamp getFreeBieFinishDate() {
		return FreeBieFinishDate;
	}

	public void setFreeBieFinishDate(Timestamp freeBieFinishDate) {
		FreeBieFinishDate = freeBieFinishDate;
	}

//	public Integer getBookId() {
//		return bookId;
//	}
//
//	public void setBookId(Integer bookId) {
//		this.bookId = bookId;
//	}

	public Blob getFreeBiesImg() {
		return FreeBiesImg;
	}

	public void setFreeBiesImg(Blob freeBiesImg) {
		FreeBiesImg = freeBiesImg;
	}

	public Integer getCompanyId() {
		return companyBean != null ? companyBean.getId() : companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getFreeBieDateStr() {
		return FreeBieDateStr;
	}

	public void setFreeBieDateStr(String freeBieDateStr) {
		FreeBieDateStr = freeBieDateStr;
	}
	

	
	
}