package _08_Promotion_com.web.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _08_Promotion_com.web.store.dao.ShoppingDiscountDao;
import _08_Promotion_com.web.store.model.DiscountBean;
import _08_Promotion_com.web.store.model.ShoppingDiscountBean;
import _08_Promotion_com.web.store.service.ShoppingDiscountService;

@Service
public class ShoppingDiscountServiceImpl implements ShoppingDiscountService{
	ShoppingDiscountDao dao;
	
	@Autowired
    public void setDao(ShoppingDiscountDao dao) {
		this.dao = dao;
	}

	@Transactional
	@Override
	public List<ShoppingDiscountBean> getAllShoppingDiscounts() {
		return dao.getAllShoppingDiscounts(); 
	}
	
	@Transactional
	@Override
	public ShoppingDiscountBean getShoppingDiscountById(int shoppingDiscountId) {
		return dao.getShoppingDiscountById(shoppingDiscountId);
	}
	
	//=========
	@Transactional
	@Override
	public void addShoppingDiscount(ShoppingDiscountBean shoppingDiscount) {
		dao.addShoppingDiscount(shoppingDiscount);
	}
	
	
	//===update===
	@Transactional
	@Override
	public void updateShoppingDiscount(ShoppingDiscountBean bean) {
		dao.updateShoppingDiscount(bean);
			
	}
	
}
