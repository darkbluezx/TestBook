package _08_Promotion_com.web.store.service;

import java.util.List;

import _08_Promotion_com.web.store.model.DiscountBean;
import _09_Book.model.CompanyBean;

public interface DiscountService {
	List<DiscountBean>  getAllDiscounts(); 
	
	public DiscountBean getDiscountById(int discountId);
	
	void addDiscount(DiscountBean discountId);
	CompanyBean  getCompanyById(int companyId);
	List<CompanyBean>  getCompanyList();

	void updateDiscount(DiscountBean bean,int companyId);
	
}
