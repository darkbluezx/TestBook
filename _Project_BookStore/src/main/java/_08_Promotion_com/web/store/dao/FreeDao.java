package _08_Promotion_com.web.store.dao;

import java.util.List;

import _08_Promotion_com.web.store.model.FreeBiesBean;
import _09_Book.model.CompanyBean;

public interface FreeDao {
	List<FreeBiesBean>  getAllFrees(); 
	
	public FreeBiesBean getFreeById(int freeId);
	
	void addFree(FreeBiesBean free);
	CompanyBean  getCompanyById(int companyId);
	List<CompanyBean>  getCompanyList();

	void updateFreeBies(FreeBiesBean bean); 
	
} 
