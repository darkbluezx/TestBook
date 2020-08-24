package _08_Promotion_com.web.store.service;

import java.util.List;

import _08_Promotion_com.web.store.model.ShoppingDiscountBean;

public interface ShoppingDiscountService {
	
	List<ShoppingDiscountBean>  getAllShoppingDiscounts();
	
	public ShoppingDiscountBean getShoppingDiscountById(int shoppingDiscountId);

	void addShoppingDiscount(ShoppingDiscountBean shoppingDiscount);

	void updateShoppingDiscount(ShoppingDiscountBean bean);
}
