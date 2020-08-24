package _08_Promotion_com.web.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _08_Promotion_com.web.store.dao.DiscountDao;
import _08_Promotion_com.web.store.model.DiscountBean;
import _08_Promotion_com.web.store.model.FreeBiesBean;
import _08_Promotion_com.web.store.service.DiscountService;
import _09_Book.model.CompanyBean;

@Service
public class DiscountServiceImpl implements DiscountService{
	DiscountDao dao;
    
	@Autowired
    public void setDao(DiscountDao dao) {
		this.dao = dao;
	}

	@Transactional
	@Override
	public List<DiscountBean> getAllDiscounts() {
		return dao.getAllDiscounts(); 
	}
	
	@Transactional
	@Override
	public DiscountBean getDiscountById(int discountId) {
		return dao.getDiscountById(discountId);
	}
	
	//===========
	@Transactional
	@Override
	public void addDiscount(DiscountBean discount) {
		dao.addDiscount(discount);
	}
	@Transactional
	@Override
	public CompanyBean getCompanyById(int companyId) {
		return dao.getCompanyById(companyId);
	}
	@Transactional
	@Override
	public List<CompanyBean> getCompanyList() {
		return dao.getCompanyList();
	}
	
	
	//===update===
	@Transactional
	@Override
	public void updateDiscount(DiscountBean bean,int companyId) {
		dao.updateDiscount(bean,companyId);
			
	}

		
}


