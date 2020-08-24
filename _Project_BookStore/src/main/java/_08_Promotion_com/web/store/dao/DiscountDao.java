package _08_Promotion_com.web.store.dao;

import java.util.List;

import _08_Promotion_com.web.store.model.DiscountBean;
import _09_Book.model.BookBean;
import _09_Book.model.CompanyBean;

public interface DiscountDao {

	List<DiscountBean>  getAllDiscounts(); 
	
	public DiscountBean getDiscountById(int discountId);
	
	void addDiscount(DiscountBean discount);
	CompanyBean  getCompanyById(int discountId);
	List<CompanyBean>  getCompanyList();

//	void updateDiscount(DiscountBean bean);

	void updateDiscount(DiscountBean bean, int companyId);




}
